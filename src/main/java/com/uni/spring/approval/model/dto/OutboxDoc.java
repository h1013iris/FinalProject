package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OutboxDoc {

	private int outboxNo;
	private int docNo;
	private int approver;
	private Timestamp lastUpdateDate;
	private String status;
}
