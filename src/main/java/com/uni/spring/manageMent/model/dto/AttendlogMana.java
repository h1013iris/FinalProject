package com.uni.spring.manageMent.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendlogMana {
	private int attendNo;//근태 순번 
	private int empNo;//사원번호 
	private Date attendDate;//출입날짜 
	private Date attendTime;//출근 시간
	private Date leaveTime;//퇴근시간 
	private String attendStatus;//근무 상태 
	private String status;//상태값
}
