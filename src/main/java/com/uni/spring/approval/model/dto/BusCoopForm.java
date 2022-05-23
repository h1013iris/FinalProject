package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BusCoopForm {

	private int busCoopNo;
	private int docNo;
	private int refDocNo;
	private String coopTitle;
	private int drafter;
	private Timestamp dftDate;
	private int receiveDeptNo;
	private String coopContent;
}
