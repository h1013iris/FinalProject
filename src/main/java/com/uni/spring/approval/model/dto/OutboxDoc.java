package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OutboxDoc { // 임시 보관 문서

	private int outboxNo; // 임시 보관 번호
	private int docNo; // 문서 번호
	private int approver; // 현재 결재자
	private Timestamp lastUpdateDate; // 마지막 수정일
	private String status; // 상태값 (삭제 유무)
}
