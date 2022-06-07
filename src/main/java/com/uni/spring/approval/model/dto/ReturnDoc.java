package com.uni.spring.approval.model.dto;

import java.sql.Date;

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
	private Date reDate; // 반려일
	
	private String reFromName; // 반려자 이름 (반려 사유 조회 시 반려자 이름으로 가져오기 위해)
}
