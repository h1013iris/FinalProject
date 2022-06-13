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
	private String enfDate; // 시행일 (자바 클래스에서 null 값이 들어갈 수 있도록 String 으로 수정)
	private Integer coopDept; // 협조 부서 (임시저장 시 null 값 넣기 위해 Integer로 수정)
	private String dftContent; // 기안서 내용
	
	private String empName;
	private String jobName;
	private String departmentTitle;
}
