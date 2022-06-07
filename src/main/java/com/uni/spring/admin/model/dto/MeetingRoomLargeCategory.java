package com.uni.spring.admin.model.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class MeetingRoomLargeCategory {
	private int roomNoLarge;
	private String LRoomName;
	
	public MeetingRoomLargeCategory(String lRoomName) {
		super();
		this.LRoomName = lRoomName;
	}
	
	public MeetingRoomLargeCategory(int roomNoLarge) {
		super();
		this.roomNoLarge = roomNoLarge;
	}
	

}