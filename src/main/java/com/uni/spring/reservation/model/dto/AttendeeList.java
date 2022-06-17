package com.uni.spring.reservation.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendeeList {
	private String attendeeNum;	// 참석 번호
	private String attendeeNo;	// 참석자 번호
	private String reserveNum;	// 예약 번호
	private String status;		// 상태값
	private String empName;		// 사원명
	
	
	
	/*
  	ATTENDEE_NUM
	ATTENDEE_NO
	RESERVE_NUM
	STATUS
	*/
}
