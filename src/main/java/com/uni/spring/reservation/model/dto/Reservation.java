package com.uni.spring.reservation.model.dto;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
public class Reservation {

	private String reserveNo;	// 예약번호
	private String empNo;		// 사원번호
	private String roomSmallNo;	// 회의실 번호
	private String startDate;	// 시작일
	private String endDate;		// 종료일
	private String meetingName;	// 회의명
	private String status;		// 상태값

	private String smallRoomName;	// 회의실 명
	/* RESERVE_NUM
	 * EMP_NO
	 * ROOM_SMALL_NO
	 * START_DATE
	 * END_DATE
	 * MEETING_NAME*/
	
	// 시작일 년월일 분리
	public Map<String, Integer> changeDate(String startDate) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		String date; // 일자
		String[] day; // 년,월,일 나누기 위한 것
		
		date = startDate; // (시간포함)

		// 일자 분리
		day = date.split(" ");
		
		// 날짜담음
		date = day[0];
		
		// 년 월 일 분리
		day = date.split("-");
		
		//임의 값 확인
		for(int i = 0 ; i < day.length ; i++) {
			if(i == 0) {
				map.put("searchYear", Integer.parseInt(day[i]));
			}else if(i == 1) {
				map.put("searchMonth", Integer.parseInt(day[i]));
			}else if(i == 2) {
				map.put("searchDate", Integer.parseInt(day[i]));
			}
		}
		return map;
	}

	public Reservation concatDate(Reservation reservation, String startTime, String endTime) {
		
		reservation.setStartDate(reservation.getStartDate().concat(" ").concat(startTime));
		reservation.setEndDate(reservation.getEndDate().concat(" ").concat(endTime));
		
		return reservation;
	}

	// 예약포함 날짜 넣기
	public Map<String, String> putMap(String startDate, String sRoom) {
		Map<String, String> map = new HashMap<String, String>();
		String date; // 일자
		String[] day; // 년,월,일 나누기 위한 것
		
		date = startDate; // (시간포함)

		// 일자 분리
		day = date.split(" ");
		
		// 날짜담음
		date = day[0];
		
		// 년 월 일 분리
		day = date.split("-");
		
		//임의 값 확인
		for(int i = 0 ; i < day.length ; i++) {
			if(i == 0) {
				map.put("searchYear", day[i]);
			}else if(i == 1) {
				map.put("searchMonth", day[i]);
			}else if(i == 2) {
				map.put("searchDate", day[i]);
			}
		}
		map.put("sRoom", sRoom);
		
		return map;
	}
}
