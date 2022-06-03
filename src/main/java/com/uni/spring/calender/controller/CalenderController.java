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
	public String calendar(Model model, HttpServletRequest request, DateData dateData, HttpSession session){
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//검색 날짜(화살표표시 클릭하여 이동하기위한 검색날짜의 데이터[이전년도,이전달,다음년도,다음달])
		if(dateData.getDate() == null &&dateData.getMonth() == null){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		
		//검색 날짜 end
		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		DepartmentManagement department = new DepartmentManagement();
		if(!loginUser.getDepartmentNo().isEmpty()) {// 부서 번호가 존재할 시
			department = calenderService.selectDepartment(loginUser.getDepartmentNo());
			department.getDepartmentTitle().replaceAll(" ", "&nbsp"); // 부서명가져올 때 replace

		}
		ArrayList<Calender> list = calenderService.selectList(loginUser, today_info); // 일정 리스트를 담음(팀,전체,개인 공개)
		
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
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		model.addAttribute("monthList", list); // 스케쥴 담음
		model.addAttribute("department", department);
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
//		calender.setTitle(calender.getTitle().replaceAll("&nbsp", " "));
//		calender.setPlace(calender.getPlace().replaceAll("&nbsp", " "));
//		calender.setMemo(calender.getMemo().replaceAll("&nbsp", " "));
		System.out.println(calender);
		
		return new Gson().toJson(calender);
	}
}
