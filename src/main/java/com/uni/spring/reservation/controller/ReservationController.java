package com.uni.spring.reservation.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.uni.spring.common.DepartmentManagement;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.reservation.model.dto.AttendeeList;
import com.uni.spring.reservation.model.dto.DateData;
import com.uni.spring.reservation.model.dto.Reservation;
import com.uni.spring.reservation.model.dto.ReservationRoom;
import com.uni.spring.reservation.model.service.ReservationService;

@SessionAttributes("loginUser")
@Controller
public class ReservationController {
	
	@Autowired
	public ReservationService reservationService;
	
	@RequestMapping(value="roomReservation.do", method = RequestMethod.GET)
	public String selectReservation(Model model, HttpSession session, DateData dateData) {
		Calendar cal = GregorianCalendar.getInstance();
		DateData data;
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 세션이 안바뀌게 새 객체 생성
		Member m = null;
		
		//검색 날짜(화살표표시 클릭하여 이동하기위한 검색날짜의 데이터[이전년도,이전달,다음년도,다음달])
		if(dateData.getDate() == null &&dateData.getMonth() == null){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
				
		//검색 날짜 end
		Map<String, Integer> todayInfo =  dateData.today_info(dateData);
		System.out.println(todayInfo.toString());
		
		// 전체예약 조회
		ArrayList<Reservation> list = reservationService.selectList(m, todayInfo);
		
		m = new Member();
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
		m.setEmpNo(loginUser.getEmpNo());
		m.setDepartmentNo(loginUser.getDepartmentNo());
		
		// 일정 리스트를 담음 (내 예약 현황 - 날짜 가리지 않음)
		ArrayList<Reservation> myList = reservationService.selectList(m, todayInfo);
		
		//배열에 담음
		model.addAttribute("todayInfo", todayInfo);
		model.addAttribute("myList", myList);
		model.addAttribute("list", list);
		
		return "reservation/reservationMain";
	}
	
	@ResponseBody
	@RequestMapping(value = "selectReservationRoomList.do", produces="application/json; charset=utf-8")
	public String selectReservationRoomList() {
		
		ArrayList<ReservationRoom> list = reservationService.selectReservationRoomList();
		
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "selectLroomList.do", produces="application/json; charset=utf-8")
	public String selectLroomList() {
		
		ArrayList<ReservationRoom> list = reservationService.selectLroomList();
		
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "selectSroomList.do", produces="application/json; charset=utf-8")
	public String selectSroomList(String lNo) {
		
		ArrayList<ReservationRoom> list = reservationService.selectSroomList(lNo);
		
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "selectreservation.do", produces="application/json; charset=utf-8")
	public String selectreservation(String startDate, String sRoom) {
		
		ArrayList<Reservation> list = reservationService.selectRoomReservation(startDate, sRoom);
		
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "selectResDepartment.do", produces="application/json; charset=utf-8")
	public String selectResDepartment(String startDate) {
		
		ArrayList<DepartmentManagement> list = reservationService.selectResDepartment();
		
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "selectResAddress.do", produces="application/json; charset=utf-8")
	public String selectResAddress(String dNo) {
		
		ArrayList<Member> list = reservationService.selectResAddress(dNo);
		
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "insertReservation.do", method = { RequestMethod.POST })
	public String insertReservation(@RequestParam HashMap<String, Object> map) {
		
		System.out.println("참석자 ==>" + map);
		
		// 회의실 예약 db저장
		Reservation reservation = new Reservation();
		
		reservation.setEmpNo(String.valueOf(map.get("reservation[empNo]")));
		reservation.setRoomSmallNo(String.valueOf(map.get("reservation[roomSmallNo]")));
		reservation.setStartDate(String.valueOf(map.get("reservation[startDate]")));
		reservation.setEndDate(String.valueOf(map.get("reservation[endDate]")));
		reservation.setMeetingName(String.valueOf(map.get("reservation[meetingName]")));
		int result = reservationService.insertReservation(reservation);
		
		int resultNum = 0;
		// 참석자 db 저장 
		if(result > 0) {
			ArrayList<AttendeeList> list = new ArrayList<AttendeeList>();
			for(int i = 0; i < map.size() ; i++) {
				AttendeeList att = new AttendeeList();
				
				// get한게 null이 아니면 실행
				if(map.get("attendeeNo["+i+"]") != null) {
					
					att.setAttendeeNo(String.valueOf(map.get("attendeeNo["+i+"]")));

					System.out.println(att.getAttendeeNo());
					list.add(att);
				}
			}
			System.out.println("참석자 ==>" + list);
			resultNum = reservationService.insertAttendee(list);
		}
		
		return new Gson().toJson(resultNum);
	}
}
