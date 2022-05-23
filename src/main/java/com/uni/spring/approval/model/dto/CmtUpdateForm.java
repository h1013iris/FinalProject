package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CmtUpdateForm {

	private int cmtUptAppNo;
	private int docNo;
	private String appTitle;
	private int drafter;
	private Timestamp draftDate;
	private String cmt;
	private Timestamp updateDate;
	private Timestamp beforeTime;
	private Timestamp afterTime;
	private String updateReason;
}
