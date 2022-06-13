package com.uni.spring.approval.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BusCoopForm { // 업무 협조문

	private int busCoopNo; // 업무 협조문 번호
	private int docNo; // 문서 번호
	private int docTypeNo; // 문서 서식 번호
	private String docTitle; // 협조문 제목
	private int drafter; // 기안자
	private int drafterDept; // 기안자 소속
	private Date dftDate; // 기안일
	private Integer receiveDept; // 수신 부서 (임시저장 시 null 값 넣기 위해 Integer로 수정)
	private String coopContent; // 협조문 내용
	
	private String empName;
	private String jobName;
	private String departmentTitle;
}
