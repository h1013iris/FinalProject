package com.uni.spring.approval.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LeaveForm { // 휴가 신청서

	private int leaveAppNo; // 휴가 신청서 번호
	private int docNo; // 문서 번호
	private int docTypeNo; // 문서 서식 번호
	private int drafter; // 기안자 (파싱 때문에 String으로)
	private int drafterDept; // 기안자 소속
	private Date dftDate; // 기안일
	private String vacType; // 휴가 종류
	private Date startDate; //휴가 시작일
	private String endDate; // 휴가 종료일 (자바 클래스에서 null 값이 들어갈 수 있도록 String 으로 수정)
	private String vacUseDays; // 사용 일수
	private String vacReason; // 휴가 사유
	
	private String empName;
	private String jobName;
}
