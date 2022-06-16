package com.uni.spring.approval.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LeaveForm { // 휴가 신청서

	private int leaveAppNo; 	// 휴가 신청서 번호
	private Integer docNo; 		// 문서 번호
	private int docTypeNo; 		// 문서 서식 번호
	private int drafter; 		// 기안자
	private String drafterDept; // 기안자 소속 (int)
	private Date dftDate; 		// 기안일
	private String vacType; 	// 휴가 종류
	private Date startDate; 	//휴가 시작일
	private String endDate; 	// 휴가 종료일 (Date)
	private String vacUseDays; 	// 사용 일수 (int)
	private String vacReason; 	// 휴가 사유
	private int outboxNo; 		// 임시 보관 문서 번호
	
	private String drafterName; // 기안자 이름
	//private String jobName;
}
