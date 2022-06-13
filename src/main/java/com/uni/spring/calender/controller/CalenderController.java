package com.uni.spring.calender.controller;

import java.util.ArrayList; 
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.uni.spring.calender.model.dto.Calender;
import com.uni.spring.calender.model.dto.DateData;
import com.uni.spring.calender.model.service.CalenderService;
import com.uni.spring.common.DepartmentManagement;
import com.uni.spring.member.model.dto.Member;

@SessionAttributes("loginUser")
@Controller
public class CalenderController {
	
	@Autowired
	public CalenderService calenderService;

	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData, String empNo, String departmentNo, HttpSession session){
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 세션이 안바뀌게 새 객체 생성
		Member m = new Member();
		m.setUserId(loginUser.getUserId());
		m.setUserPw(loginUser.getUserPw());
		m.setEmpName(loginUser.getEmpName());
		m.setUserNo(loginUser.getUserNo());
		m.setEmail(loginUser.getEmail());
		m.setPhone(loginUser.getPhone());
		m.setAddress(loginUser.getAddress());
		m.setHireDate(loginUser.getHireDate());
		m.setStatus(loginUser.getStatus());
		m.setEndDate(loginUser.getEndDate());
		m.setJobNo(loginUser.getJobNo());
		
		
		// 리셋 시킴
		m.setEmpNo(0);
		m.setDepartmentNo(null);
		
		//검색 날짜(화살표표시 클릭하여 이동하기위한 검색날짜의 데이터[이전년도,이전달,다음년도,다음달])
		if(dateData.getDate() == null &&dateData.getMonth() == null){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		
		boolean departmentCheck = false;
		boolean empCheck = false;
		// 팀과 개인 들어 있을 시
		if(empNo != null || departmentNo != null) {
			if(empNo != null && departmentNo == null) {
				// 개인공개만이면
				m.setEmpNo(Integer.parseInt(empNo));
				empCheck = true;
			}else if(empNo == null && departmentNo != null) {
				// 팀 공개 만이면
				departmentCheck = true;
				m.setDepartmentNo(departmentNo);
			}else {
				// 둘다면
				departmentCheck = true;
				empCheck = true;
				m.setEmpNo(Integer.parseInt(empNo));
				m.setDepartmentNo(departmentNo);
			}
			// 둘다 null일 시에는 null로 들어가기 때문에 따로 입력 하지 않아도 된다.
		}
		
		//검색 날짜 end
		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		DepartmentManagement department = new DepartmentManagement();
		if(m.getDepartmentNo() != null) {// 부서 번호가 존재할 시
			department = calenderService.selectDepartment(m.getDepartmentNo());
			department.getDepartmentTitle().replaceAll(" ", "&nbsp"); // 부서명가져올 때 replace

		}
		ArrayList<Calender> list = calenderService.selectList(m, today_info); // 일정 리스트를 담음(팀,전체,개인 공개)
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입 -- 앞에 이전달의 날을 비우기 위해
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			// 오늘이 있으면
			if(i==today_info.get("today")){
				// 오늘에 데이터 값을 넣기
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
				
			}else{
				// 아닌경우 노멀값을 넣기
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			// 삽입
			dateList.add(calendarData);
		}

		//월 끝난 후 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		// 다시 세팅 해주기
		m.setEmpNo(loginUser.getEmpNo());
		m.setDepartmentNo(loginUser.getDepartmentNo());
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		model.addAttribute("monthList", list); // 스케쥴 담음
		model.addAttribute("department", department);
		model.addAttribute("empNo", m.getEmpNo());
		model.addAttribute("departmentNo", m.getDepartmentNo());
		model.addAttribute("departmentCheck", departmentCheck);
		model.addAttribute("empCheck", empCheck);
		return "calender/calender";
	}
	
	@RequestMapping(value = "enrollFormCalender.do")
	public String enrollFormCalender() {
		return "calender/calenderEnrollForm";
	}
	
	@RequestMapping(value = "insertCalender.do", method = RequestMethod.POST)
	public String insertCalender(Calender calender, String startTime, String endTime, HttpSession session) {
		System.out.println("controller 캘린더 insert ==> "+calender);
		System.out.println("시작 시간 ==> "+startTime+" 종료시간 ==> " +endTime);
		System.out.println(calender.getOneday());
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		calender.setTitle(calender.getTitle().replaceAll(" ", "&nbsp").replaceAll("<br>", "\n"));
		calender.setMemo(calender.getMemo().replaceAll(" ", "&nbsp").replaceAll("<br>", "\n"));
		calender.setPlace(calender.getPlace().replaceAll(" ", "&nbsp").replaceAll("<br>", "\n"));
		
		if(calender.getOpenOption().equals("전체공개")) {
			System.out.println("전체공개 선택함");
			calender.setWriterNo("10000");
		}else if(calender.getOpenOption().equals("팀공개")) {
			System.out.println("팀공개 선택함");
			calender.setWriterNo(loginUser.getDepartmentNo());
		}else {
			System.out.println("개인공개 선택함");
			calender.setWriterNo(String.valueOf(loginUser.getEmpNo()));
		}

		calender.setRealWriter(String.valueOf(loginUser.getEmpNo()));
		
		if(calender.getOneday() == null) {
			System.out.println("들어와라");
			calenderService.insertCalender(calender, startTime, endTime);
		}else {
			calenderService.insertCalender(calender);
		}
		return "redirect:calendar.do";
	}
	
	@ResponseBody
	@RequestMapping(value="calenderDetailView.do", produces="application/json; charset=utf-8")
	public String selectCalenderDetailView(String startDate, String endDate, String writerNo) {
		System.out.println("시작 일 ==> "+startDate);
		System.out.println("종료 일 ==> "+endDate);
		System.out.println("작성자 번호 ==> "+writerNo);
		
		Calender calender = calenderService.selectCalenderDetailView(startDate, endDate, writerNo);
		if(writerNo.length() == 1) { // 부서버노 이면
			DepartmentManagement dapartment = calenderService.selectDepartment(writerNo);
			calender.setDepartment(dapartment.getDepartmentTitle());
		}
		System.out.println(calender);
		
		return new Gson().toJson(calender);
	}
	
	@ResponseBody
	@RequestMapping(value="deleteCalender.do", produces="application/json; charset=utf-8")
	public String deleteCalender(String startDate, String endDate, String realWriter) {
		System.out.println("시작 일 ==> "+startDate);
		System.out.println("종료 일 ==> "+endDate);
		System.out.println("진짜 작성자 번호 ==> "+realWriter);
		
		int result = calenderService.deleteCalender(startDate, endDate, realWriter);
		if(result > 0) {
			return new Gson().toJson("성공");	
		}
		return "실패";
	}

	@RequestMapping(value = "updatedCalenderEnrollForm.do")
	public String updateEnrollForm(Model model, String startDate, String endDate, String realWriter) {
		System.out.println("시작 일 ==> "+startDate);
		System.out.println("종료 일 ==> "+endDate);
		System.out.println("진짜 작성자 번호 ==> "+realWriter);
		
		Calender calender = calenderService.selectCalenderDetailView(startDate, endDate, realWriter);
		String colorCode = calenderService.selectColor(calender.getSelectColor());
		
		calender.setSelectColor(colorCode);
		
		model.addAttribute("calender", calender);
		return "calender/updateCalenderEnrollform";
	}
	
	@RequestMapping(value="updateCalender.do")
	public String updateCalender(Calender calender, String startTime, String endTime, HttpSession session) {
		
		// 기존 값 확인 후
		System.out.println("기존 시작 일 ==> "+calender.getEditStartDate());
		System.out.println("기존 종료 일 ==> "+calender.getEditEndDate());
		System.out.println("진짜 작성자 번호 ==> "+calender.getEditWriterNo());
		
		// 바꿀 캘린더 값 가져오기
		Calender editcalender = calenderService.selectCalenderDetailView(calender.getEditStartDate(), calender.getEditEndDate(), calender.getEditWriterNo());
		
		// 존재 할 경우 진행
		if(editcalender != null) {
			// 업데이트 할 값들 확인
			System.out.println("controller 캘린더 update ==> "+calender);
			System.out.println("시작 시간 ==> "+startTime+" 종료시간 ==> " +endTime);
			System.out.println(calender.getOneday());
			
			// 세션 값 가져오기
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			// 제목 메모 장소 띄어쓰기, 엔터 바로잡기
			calender.setTitle(calender.getTitle().replaceAll(" ", "&nbsp").replaceAll("\r\n", "<br>"));
			calender.setMemo(calender.getMemo().replaceAll(" ", "&nbsp").replaceAll("\r\n", "<br>"));
			calender.setPlace(calender.getPlace().replaceAll(" ", "&nbsp").replaceAll("\r\n", "<br>"));
			
			// 공개 여부에 따라서 보여지는게 달라지기 때문에 값 넣음
			if(calender.getOpenOption().equals("전체공개")) {
				System.out.println("전체공개 선택함");
				calender.setWriterNo("10000");
			}else if(calender.getOpenOption().equals("팀공개")) {
				System.out.println("팀공개 선택함");
				calender.setWriterNo(loginUser.getDepartmentNo());
			}else {
				System.out.println("개인공개 선택함");
				calender.setWriterNo(String.valueOf(loginUser.getEmpNo()));
			}
	
			// 진짜 작성자 사번
			calender.setRealWriter(String.valueOf(loginUser.getEmpNo()));
			
			// 하루종일이 아닐 시 time을 들고 진행
			if(calender.getOneday() == null) {
				System.out.println("들어와라");
				calenderService.updateCalender(calender, startTime, endTime);
			}else {
				// 하루종일 일 시 calender 객체만 담음
				calenderService.updateCalender(calender);
			}
		}
		return "redirect:calendar.do";
	}
	
	@ResponseBody
	@RequestMapping(value="searchCalender.do", produces="application/json; charset=utf-8")
	public String selectCalenderSearchList(String searchWord, HttpSession session) {
		System.out.println("검색할 단어 ==> "+searchWord);
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Calender> cList = calenderService.selectCalenderSearchList(searchWord, loginUser);
		
		for(Calender calender : cList) {
			if(calender.getWriterNo().equals("1")) { // 부서버노 이면
				DepartmentManagement dapartment = calenderService.selectDepartment(calender.getWriterNo());
				calender.setDepartment(dapartment.getDepartmentTitle());
			}
		}
		System.out.println(cList);
		
		return new Gson().toJson(cList);
	}
}
