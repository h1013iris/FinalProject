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
			
		}
		map.put("searchYear", todayInfo.get("searchYear"));
		map.put("searchMonth", todayInfo.get("searchMonth"));
		map.put("searchDate", todayInfo.get("searchDate"));
		
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
	public int insertReservation(Reservation reservation) {
		
		int result = reservationDao.insertReservation(reservation, sqlSession);
		return result;
	}

	@Override
	public int insertAttendee(ArrayList<AttendeeList> list) {
		// TODO Auto-generated method stub
		int result = reservationDao.insertAttendee(list, sqlSession);
		
		return result;
	}

	@Override
	public ArrayList<Reservation> selectRoomReservation(String startDate, String sRoom, String reserveNo) {
		// TODO Auto-generated method stub
		Reservation res = new Reservation();
		Map<String, String> map = res.putMap(startDate, sRoom);
		map.put("reserveNo", reserveNo);

		ArrayList<Reservation> list = reservationDao.selectRoomReservation(map, sqlSession);
		return list;
	}

	@Override
	public ArrayList<ReservationRoom> selectRoomAllList() {
		ArrayList<ReservationRoom> roomList = reservationDao.selectRoomAllList(sqlSession);
		return roomList;
	}

	@Override
	public int deleteReservation(String reserveNo) {
		int result = reservationDao.deleteReservation(reserveNo, sqlSession);
		return result;
	}

	@Override
	public int deleteAttendeeList(String reserveNo) {
		int result = reservationDao.deleteAttendeeList(reserveNo, sqlSession);
		return result;
	}

	@Override
	public Reservation selectOneReservation(String resNo) {
		Reservation reservation = reservationDao.selectOneReservation(resNo, sqlSession);
		return reservation;
	}

	@Override
	public ArrayList<AttendeeList> selectOneAttendee(String resNo) {
		ArrayList<AttendeeList> attendeeList = reservationDao.selectOneAttendee(resNo, sqlSession);
		return attendeeList;
	}

	@Override
	public ArrayList<Reservation> smallRoomReservation(Member m, Map<String, Integer> todayInfo, String roomSmallNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		// m 객체가 null이 아니면 ( 내 예약 현황 )
		if(m != null) {
			map.put("empNo", m.getEmpNo());
		}
		// null이면 ( 전체 예약 현황)
		map.put("searchYear", todayInfo.get("searchYear"));
		map.put("searchMonth", todayInfo.get("searchMonth"));
		map.put("searchDate", todayInfo.get("searchDate"));
		map.put("roomSmallNo", Integer.parseInt(roomSmallNo));
		
		ArrayList<Reservation> list = reservationDao.smallRoomReservation(map, sqlSession);
		return list;
	}

	@Override
	public ArrayList<ReservationRoom> selectRoomOne(String roomSmallNo) {
		ArrayList<ReservationRoom> roomList = reservationDao.selectRoomOne(roomSmallNo, sqlSession);
		return roomList;
	}

	@Override
	public int updateReservation(Reservation reservation) {
		int result = reservationDao.updateReservation(reservation, sqlSession);
		return result;
	}

	@Override
	public int insertNewAttendee(ArrayList<AttendeeList> list) {
		// TODO Auto-generated method stub
		int result = reservationDao.insertNewAttendee(list, sqlSession);
		
		return result;
	}

}
