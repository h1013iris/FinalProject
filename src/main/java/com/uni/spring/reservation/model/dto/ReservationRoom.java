package com.uni.spring.reservation.model.dto;

import lombok.Data;

@Data
public class ReservationRoom {
	
	private String roomLargeNo; // 대그룽 넘버
	private String roomSmallNo;	// 소그룹 넘버
	private String lRoomName;	// 대그룹 명
	private String sRoomName;	// 소그룹 명
	private String maxCount;	// 최대 인원
	private String status;		// 상태값
	
	/* ROOM_LARGE_NO
	 * ROOM_SMALL_NO
	 * LROOM_NAME
	 * SROOM_NAME
	 * MAX_COUNT
	 * STATUS
	 */
}
