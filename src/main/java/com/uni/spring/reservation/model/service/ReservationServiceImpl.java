package com.uni.spring.reservation.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.DepartmentManagement;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.reservation.model.dao.ReservationDao;
import com.uni.spring.reservation.model.dto.AttendeeList;
import com.uni.spring.reservation.model.dto.Reservation;
import com.uni.spring.reservation.model.dto.ReservationRoom;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	public ReservationDao reservationDao;
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Reservation> selectList(Member m, Map<String, Integer> todayInfo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		// m 객체가 null이 아니면 ( 내 예약 현황 )
		if(m != null) {
			map.put("empNo", m.getEmpNo());
		}else { // null이면 ( 전체 예약 현황)
			map.put("searchYear", todayInfo.get("searchYear"));
			map.put("searchMonth", todayInfo.get("searchMonth"));
			map.put("searchDate", todayInfo.get("searchDate"));
		}
		
		ArrayList<Reservation> list = reservationDao.selectList(map, sqlSession);
		return list;
	}

	@Override
	public ArrayList<ReservationRoom> selectReservationRoomList() {
		ArrayList<ReservationRoom> list = reservationDao.selectReservationRoomList(sqlSession);
		return list;
	}

	@Override
	public ArrayList<ReservationRoom> selectLroomList() {
		ArrayList<ReservationRoom> list = reservationDao.selectLroomList(sqlSession);
		return list;
	}

	@Override
	public ArrayList<ReservationRoom> selectSroomList(String lNo) {
		ArrayList<ReservationRoom> list = reservationDao.selectSroomList(lNo, sqlSession);
		return list;
	}

	@Override
	public ArrayList<Reservation> selectreservation(String startDate) {
		Reservation reservation = new Reservation();
		Map<String, Integer> map = reservation.changeDate(startDate);
		ArrayList<Reservation> list = reservationDao.selectList(map, sqlSession);
		return list;
	}

	@Override
	public ArrayList<DepartmentManagement> selectResDepartment() {
		ArrayList<DepartmentManagement> list = reservationDao.selectResDepartment(sqlSession);
		return list;
	}

	@Override
	public ArrayList<Member> selectResAddress(String dNo) {
		ArrayList<Member> list = reservationDao.selectResAddress(dNo, sqlSession);
		return list;
	}

	@Override
	public int insertReservation(Reservation reservation, String startTime, String endTime) {
		reservation = reservation.concatDate(reservation, startTime, endTime);
		
		int result = reservationDao.insertReservation(reservation, sqlSession);
		return result;
	}

	@Override
	public void insertAttendee(ArrayList<AttendeeList> list) {
		// TODO Auto-generated method stub
		reservationDao.insertAttendee(list, sqlSession);
	}

}
