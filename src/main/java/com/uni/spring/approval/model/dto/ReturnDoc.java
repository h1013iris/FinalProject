package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReturnDoc { // 반려 문서

	private int docNo; // 문서 번호
	private int reFrom; // 반려자
	private String reReason; // 반려 사유
	private Timestamp reDate; // 반려일
}
