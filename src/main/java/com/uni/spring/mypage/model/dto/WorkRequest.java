package com.uni.spring.mypage.model.dto;

import java.sql.Date;

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
public class WorkRequest {
	
	private int raskNo;
	private int empNo;
	private String empName;
	private String title;
	private String content;
	private Date fromDate;
	private Date toDate;
	private String EStatus;
	private String status;
	private String empNoArr;

}
