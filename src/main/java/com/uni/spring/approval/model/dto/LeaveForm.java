package com.uni.spring.approval.model.dto;



import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	private String drafter; // 기안자 (파싱 때문에 String으로)
	private String drafterDept; // 기안자 소속
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date draftDate; // 기안일
	private String vacType; // 휴가 종류
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate; //휴가 시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate; // 휴가 종료일
	private String vacUseDays; // 사용 일수
	private String vacReason; // 휴가 사유
}
