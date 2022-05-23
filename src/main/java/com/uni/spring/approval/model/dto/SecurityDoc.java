package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SecurityDoc {

	private int docNo;
	private String scrtyReason;
	private Timestamp scrtyReqDate;
	private Timestamp scrtySetDate;
	private String scrtyStatus;
}
