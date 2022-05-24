package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BusDraftForm {

	private int busDftNo;
	private int docNo;
	private String dftTitle;
	private int drafter;
	private Timestamp dftDate;
	private Timestamp enfDate;
	private int coopDeptNo;
	private String dftContent;
}
