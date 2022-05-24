package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AprvHistory {

	private int aprvHistoryNo;
	private int docNo;
	private int approver;
	private int approverJob;
	private String aprvPro;
	private Timestamp proDate;
}
