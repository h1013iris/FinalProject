package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AprvHistory { // 결재 기록

	private int aprvHistoryNo; // 결재 기록 번호
	private int docNo; // 문서 번호
	private int approver; // 결재자
	private int approverJob; // 결재자 직급
	private String aprvPro; // 결재 처리
	private Timestamp proDate; // 처리일
}
