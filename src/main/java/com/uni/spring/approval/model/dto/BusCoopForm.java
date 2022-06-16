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

	private int busCoopNo; 				// 업무 협조문 번호
	private Integer docNo; 				// 문서 번호
	private int docTypeNo; 				// 문서 서식 번호
	private String docTitle; 			// 협조문 제목
	private int drafter; 				// 기안자 (int)
	private String drafterDept;			// 기안자 소속 (int)
	private Date dftDate; 				// 기안일
	private String receiveDept; 		// 수신 부서 (int)
	private String coopContent; 		// 협조문 내용
	private int outboxNo; 				// 임시 보관 문서 번호
	
	private String drafterName; 		// 기안자 이름
	private String receiveDeptName; 	// 수신 부서 이름
	/*private String jobName;
	private String departmentTitle;*/
}
