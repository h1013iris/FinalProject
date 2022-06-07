package com.uni.spring.approval.model.dto;

import java.sql.Date;
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
	private int docTypeNo; // 문서 서식 번호
	private String docTitle; // 기안서 제목
	private int drafter; // 기안자
	private int drafterDept; // 기안자 소속
	private Date dftDate; // 기안일
	private Date enfDate; // 시행일
	private int coopDept; // 협조 부서
	private String dftContent; // 기안서 내용
	
	private String empName;
	private String jobName;
	private String departmentTitle;
}
