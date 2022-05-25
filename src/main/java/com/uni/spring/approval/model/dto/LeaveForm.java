package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LeaveForm { // 휴가 신청서

	private int leaveAppNo; // 휴가 신청서 번호
	private int docNo; // 문서 번호
	private String appTitle; // 신청서 제목
	private int drafter; // 기안자
	private Timestamp draftDate; // 기안일
	private String vacType; // 휴가 종류
	private Timestamp startDate; // 휴가 시작일
	private Timestamp endDate; // 휴가 종료일
	private int vacUseDays; // 사용 일수
	private String vacReason; // 휴가 사유
}
