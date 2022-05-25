package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SecurityDoc { // 보안 문서

	private int docNo; // 문서 번호
	private String scrtyReason; // 보안 사유
	private Timestamp scrtyReqDate; // 보안 요청일
	private Timestamp scrtySetDate; // 보안 설정일
	private String scrtyStatus; // 보안 상태
}
