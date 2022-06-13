package com.uni.spring.approval.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AprvDoc {

	private int docNo; // 문서 번호
	private int docType; // 문서 유형
	private String docTitle; // 문서 제목
	private String drafter; // 기안자 (int)
	private Date draftDate; // 기안일
	private String firstAprv; // 1차 결재자 (int)
	private String secondAprv; // 2차 결재자 (int)
	private int aprvStatus; // 결재 상태
	private String status; // 상태값
	
	private String docForm; // 문서 종류 폼	
	private Date proDate; // 요청일
	private Date reDate; // 반려일
	
	
	private String firstJob; // 1차 결재자 직급
	private String secondJob; // 2차 결재자 직급
	
	private String aprvStatusName; // 결재 상태 이름
	
	
	
}
