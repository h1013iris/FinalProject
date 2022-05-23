package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LeaveForm {

	private int leaveAppNo;
	private int docNo;
	private String appTitle;
	private int drafter;
	private Timestamp draftDate;
	private String vacType;
	private Timestamp startDate;
	private Timestamp endDate;
	private int vacUseDays;
	private String vacReason;
}
