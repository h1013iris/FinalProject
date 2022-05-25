package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BusDraftForm { // 업무 기안서

	private int busDftNo; // 업무 기안서 번호
	private int docNo; // 문서 번호
	private String dftTitle; // 기안서 제목
	private int drafter; // 기안자
	private Timestamp dftDate; // 기안일
	private Timestamp enfDate; // 시행일
	private int coopDeptNo; // 협조 부서
	private String dftContent; // 기안서 내용
}
