package com.uni.spring.department.model.dto;


import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendLog {
	
	private int attendNo; // 근태 순번
	private int empNo; // 사원 번호
	private Date attendDate; // 출입 날짜
	private Date attendTime; // 출근 시간
	private Date leaveTime; // 퇴근 시간
	private String attendStatus; // 근무 상태
	private String status; // 상태값
	
	private String attendTime2;
	private String leaveTime2; 
	
}
