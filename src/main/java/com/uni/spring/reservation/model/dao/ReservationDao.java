package com.uni.spring.reservation.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.common.DepartmentManagement;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.reservation.model.dto.AttendeeList;
import com.uni.spring.reservation.model.dto.Reservation;
import com.uni.spring.reservation.model.dto.ReservationRoom;

@Repository
public class ReservationDao {

	public ArrayList<ReservationRoom> selectReservationRoomList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationRoomList");
	}

	public ArrayList<Reservation> selectList(Map<String, Integer> map, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reservationMapper.selectList", map);
	}

	public ArrayList<ReservationRoom> selectLroomList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reservationMapper.selectLroomList");
	}

	public ArrayList<ReservationRoom> selectSroomList(String lNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reservationMapper.selectSroomList", lNo);
	}

	public ArrayList<DepartmentManagement> selectResDepartment(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reservationMapper.selectResDepartment");
	}

	public ArrayList<Member> selectResAddress(String dNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reservationMapper.selectResAddress", dNo);
	}

	public int insertReservation(Reservation reservation, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reservationMapper.insertReservation", reservation);
	}

	public int insertAttendee(ArrayList<AttendeeList> list, SqlSessionTemplate sqlSession) {
		int count = 0;
		for(AttendeeList attend : list) {
			count += sqlSession.insert("reservationMapper.insertAttendee", attend);
		}
		return count;
	}

	public ArrayList<Reservation> selectRoomReservation(Map<String, String> map, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reservationMapper.selectRoomReservation", map);
	}

	public ArrayList<ReservationRoom> selectRoomAllList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reservationMapper.selectRoomAllList");
	}

	public int deleteReservation(String reserveNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.update("reservationMapper.deleteReservation", reserveNo);
	}

	public int deleteAttendeeList(String reserveNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.delete("reservationMapper.deleteAttendeeList", reserveNo);
	}

	public Reservation selectOneReservation(String resNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reservationMapper.selectOneReservation", resNo);
	}

	public ArrayList<AttendeeList> selectOneAttendee(String resNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reservationMapper.selectOneAttendee", resNo);
	}

	public ArrayList<Reservation> smallRoomReservation(Map<String, Integer> map, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectList", map);
	}

	public ArrayList<ReservationRoom> selectRoomOne(String roomSmallNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("reservationMapper.selectRoomOne", roomSmallNo);
	}

	public int updateReservation(Reservation reservation, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.update("reservationMapper.updateReservation", reservation);
	}

	public int insertNewAttendee(ArrayList<AttendeeList> list, SqlSessionTemplate sqlSession) {
		int count = 0;
		for(AttendeeList attend : list) {
			count += sqlSession.insert("reservationMapper.insertNewAttendee", attend);
		}
		return count;
	}
}
