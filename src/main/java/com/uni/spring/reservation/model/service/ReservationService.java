package com.uni.spring.reservation.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.spring.common.DepartmentManagement;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.reservation.model.dto.AttendeeList;
import com.uni.spring.reservation.model.dto.Reservation;
import com.uni.spring.reservation.model.dto.ReservationRoom;

public interface ReservationService {

	ArrayList<Reservation> selectList(Member m, Map<String, Integer> todayInfo);

	ArrayList<ReservationRoom> selectReservationRoomList();

	ArrayList<ReservationRoom> selectLroomList();

	ArrayList<ReservationRoom> selectSroomList(String lNo);

	ArrayList<Reservation> selectreservation(String startDate);

	ArrayList<DepartmentManagement> selectResDepartment();

	ArrayList<Member> selectResAddress(String dNo);

	int insertReservation(Reservation reservation);

	int insertAttendee(ArrayList<AttendeeList> list);

	ArrayList<Reservation> selectRoomReservation(String startDate, String sRoom, String reserveNo);

	ArrayList<ReservationRoom> selectRoomAllList();

	int deleteReservation(String reserveNo);

	int deleteAttendeeList(String reserveNo);

	Reservation selectOneReservation(String resNo);

	ArrayList<AttendeeList> selectOneAttendee(String resNo);

	ArrayList<Reservation> smallRoomReservation(Member m, Map<String, Integer> todayInfo, String roomSmallNo);

	ArrayList<ReservationRoom> selectRoomOne(String roomSmallNo);

	int updateReservation(Reservation reservation);

	int insertNewAttendee(ArrayList<AttendeeList> list);

}
