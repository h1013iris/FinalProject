package com.uni.spring.admin.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class MeetingRoom extends MeetingRoomLargeCategory{
	
	private int roomNoSmall;
	private String SRoomName;
	private String maxCount;
	
	@Builder
	public MeetingRoom(int roomNoLarge, String LRoomName, int roomNoSmall, String sRoomName, String maxCount) {
		super(roomNoLarge, LRoomName);
		// TODO Auto-generated constructor stub
		this.roomNoSmall = roomNoSmall;
		this.SRoomName = sRoomName;
		this.maxCount = maxCount;
	}

	@Builder
	public MeetingRoom(String LRoomName, int roomNoSmall, String sRoomName, String maxCount) {
		super(LRoomName);
		// TODO Auto-generated constructor stub
		this.roomNoSmall = roomNoSmall;
		this.SRoomName = sRoomName;
		this.maxCount = maxCount;
	}
	
	@Builder
	public MeetingRoom(int roomNoLarge, int roomNoSmall, String sRoomName, String maxCount) {
		super(roomNoLarge);
		// TODO Auto-generated constructor stub
		this.roomNoSmall = roomNoSmall;
		this.SRoomName = sRoomName;
		this.maxCount = maxCount;
	}
	
	
	
}
