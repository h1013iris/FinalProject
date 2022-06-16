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

	private int businessDftNo; 		// 업무 기안서 번호
	private Integer docNo; 			// 문서 번호
	private int docTypeNo; 			// 문서 서식 번호
	private String docTitle; 		// 기안서 제목
	private int drafter; 			// 기안자
	private String drafterDept; 	// 기안자 소속 (int)
	private Date dftDate; 			// 기안일
	private String enfDate; 		// 시행일 (int)
	private String coopDept; 		// 협조 부서 (int)
	private String dftContent; 		// 기안서 내용
	private int outboxNo; 			// 임시 보관함 번호
	
	private String drafterName; 	// 기안자 이름
	private String coopDeptName; 	// 협조 부서 이름
	//private String jobName;
}
