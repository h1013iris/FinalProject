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
		
		Map<Integer, String> timeInfo = new HashMap<Integer, String>();
				
		// 시분 만들기 30분 간격이기 때문에 48만큼 하드코딩
		timeInfo.put(1, "00:00");timeInfo.put(2, "00:30");timeInfo.put(3, "01:00");
		timeInfo.put(4, "01:30");timeInfo.put(5, "02:00");timeInfo.put(6, "02:30");
		timeInfo.put(7, "03:00");timeInfo.put(8, "03:30");timeInfo.put(9, "04:00");
		timeInfo.put(10, "04:30");timeInfo.put(11, "05:00");timeInfo.put(12, "05:30");
		timeInfo.put(13, "06:00");timeInfo.put(14, "06:30");timeInfo.put(15, "07:00");
		timeInfo.put(16, "07:30");timeInfo.put(17, "08:00");timeInfo.put(18, "08:30");
		timeInfo.put(19, "09:00");timeInfo.put(20, "09:30");timeInfo.put(21, "10:00");
		timeInfo.put(22, "10:30");timeInfo.put(23, "11:00");timeInfo.put(24, "11:30");
		timeInfo.put(25, "12:00");timeInfo.put(26, "12:30");timeInfo.put(27, "13:00");
		timeInfo.put(28, "13:30");timeInfo.put(29, "14:00");timeInfo.put(30, "14:30");
		timeInfo.put(31, "15:00");timeInfo.put(32, "15:30");timeInfo.put(33, "16:00");
		timeInfo.put(34, "16:30");timeInfo.put(35, "17:00");timeInfo.put(36, "17:30");
		timeInfo.put(37, "18:00");timeInfo.put(38, "18:30");timeInfo.put(39, "19:00");
		timeInfo.put(40, "19:30");timeInfo.put(41, "20:00");timeInfo.put(42, "20:30");
		timeInfo.put(43, "21:00");timeInfo.put(44, "21:30");timeInfo.put(45, "22:00");
		timeInfo.put(46, "22:30");timeInfo.put(47, "23:00");timeInfo.put(48, "23:30");
		
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
		ArrayList<ReservationRoom> roomList = reservationService.selectRoomAllList();
		System.out.println(timeInfo);
		//배열에 담음
		model.addAttribute("todayInfo", todayInfo);
		model.addAttribute("timeInfo", timeInfo);
		model.addAttribute("myList", myList);
		model.addAttribute("list", list);
		model.addAttribute("roomList", roomList);
		
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
	public String selectreservation(String startDate, String sRoom, String reserveNo) {
		
		
		ArrayList<Reservation> list = reservationService.selectRoomReservation(startDate, sRoom, reserveNo);
		
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
		reservation.setMeetingName(reservation.getMeetingName().replace(" ", "nbsp;"));
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
	
	@ResponseBody
	@RequestMapping(value = "deleteReservation.do", produces="application/json; charset=utf-8")
	public String deleteReservation(String reserveNo) {
		
		int result = reservationService.deleteAttendeeList(reserveNo);
		
		result += reservationService.deleteReservation(reserveNo);
		
		return new Gson().toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "selectOneReservation.do", produces="application/json; charset=utf-8")
	public String selectOneReservation(String resNo) {
		
		Reservation reservation = reservationService.selectOneReservation(resNo);
		
		return new Gson().toJson(reservation);
	}
	
	@ResponseBody
	@RequestMapping(value = "selectOneAttendee.do", produces="application/json; charset=utf-8")
	public String selectOneAttendee(String resNo) {
		
		ArrayList<AttendeeList> attendeeList = reservationService.selectOneAttendee(resNo);
		
		return new Gson().toJson(attendeeList);
	}
	
	@RequestMapping(value="smallRoomReservation.do", method = RequestMethod.GET)
	public String smallRoomReservation(Model model, HttpSession session, DateData dateData, String roomSmallNo) {
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
		ArrayList<Reservation> list = reservationService.smallRoomReservation(m, todayInfo, roomSmallNo);
		
		Map<Integer, String> timeInfo = new HashMap<Integer, String>();
				
		// 시분 만들기 30분 간격이기 때문에 48만큼 하드코딩
		timeInfo.put(1, "00:00");timeInfo.put(2, "00:30");timeInfo.put(3, "01:00");
		timeInfo.put(4, "01:30");timeInfo.put(5, "02:00");timeInfo.put(6, "02:30");
		timeInfo.put(7, "03:00");timeInfo.put(8, "03:30");timeInfo.put(9, "04:00");
		timeInfo.put(10, "04:30");timeInfo.put(11, "05:00");timeInfo.put(12, "05:30");
		timeInfo.put(13, "06:00");timeInfo.put(14, "06:30");timeInfo.put(15, "07:00");
		timeInfo.put(16, "07:30");timeInfo.put(17, "08:00");timeInfo.put(18, "08:30");
		timeInfo.put(19, "09:00");timeInfo.put(20, "09:30");timeInfo.put(21, "10:00");
		timeInfo.put(22, "10:30");timeInfo.put(23, "11:00");timeInfo.put(24, "11:30");
		timeInfo.put(25, "12:00");timeInfo.put(26, "12:30");timeInfo.put(27, "13:00");
		timeInfo.put(28, "13:30");timeInfo.put(29, "14:00");timeInfo.put(30, "14:30");
		timeInfo.put(31, "15:00");timeInfo.put(32, "15:30");timeInfo.put(33, "16:00");
		timeInfo.put(34, "16:30");timeInfo.put(35, "17:00");timeInfo.put(36, "17:30");
		timeInfo.put(37, "18:00");timeInfo.put(38, "18:30");timeInfo.put(39, "19:00");
		timeInfo.put(40, "19:30");timeInfo.put(41, "20:00");timeInfo.put(42, "20:30");
		timeInfo.put(43, "21:00");timeInfo.put(44, "21:30");timeInfo.put(45, "22:00");
		timeInfo.put(46, "22:30");timeInfo.put(47, "23:00");timeInfo.put(48, "23:30");
		
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
		ArrayList<Reservation> myList = reservationService.smallRoomReservation(m, todayInfo, roomSmallNo);
		ArrayList<ReservationRoom> roomList = reservationService.selectRoomOne(roomSmallNo);
		System.out.println(myList);
		System.out.println(list);
		System.out.println(timeInfo);
		//배열에 담음
		model.addAttribute("todayInfo", todayInfo);
		model.addAttribute("timeInfo", timeInfo);
		model.addAttribute("myList", myList);
		model.addAttribute("list", list);
		model.addAttribute("roomList", roomList);
		model.addAttribute("roomSmallNo", roomSmallNo);
		
		return "reservation/reservationRoomSmallMain";
	}
	
	@ResponseBody
	@RequestMapping(value = "updateReservation.do", method = { RequestMethod.POST })
	public String updateReservation(@RequestParam HashMap<String, Object> map) {
		
		System.out.println("참석자 ==>" + map);
		
		// 회의실 예약 db저장
		Reservation reservation = new Reservation();
		
		reservation.setEmpNo(String.valueOf(map.get("reservation[empNo]")));
		reservation.setRoomSmallNo(String.valueOf(map.get("reservation[roomSmallNo]")));
		reservation.setStartDate(String.valueOf(map.get("reservation[startDate]")));
		reservation.setEndDate(String.valueOf(map.get("reservation[endDate]")));
		reservation.setMeetingName(String.valueOf(map.get("reservation[meetingName]")));
		reservation.setMeetingName(reservation.getMeetingName().replace(" ", "nbsp;"));
		reservation.setReserveNo(String.valueOf(map.get("reservation[reserveNo]")));
		int result = reservationService.updateReservation(reservation);
		
		int resultNum = 0;
		// 참석자 db 저장 
		if(result > 0) {
			ArrayList<AttendeeList> list = new ArrayList<AttendeeList>();
			for(int i = 0; i < map.size() ; i++) {
				AttendeeList att = new AttendeeList();
				
				// get한게 null이 아니면 실행
				if(map.get("attendeeNo["+i+"]") != null) {
					
					att.setAttendeeNo(String.valueOf(map.get("attendeeNo["+i+"]")));
					att.setReserveNum(String.valueOf(map.get("reservation[reserveNo]")));
					System.out.println(att.getReserveNum());
					list.add(att);
				}
			}
			reservationService.deleteAttendeeList(reservation.getReserveNo());
			System.out.println("참석자 ==>" + list);
			resultNum = reservationService.insertNewAttendee(list);
		}
		
		return new Gson().toJson(resultNum);
	}
}
