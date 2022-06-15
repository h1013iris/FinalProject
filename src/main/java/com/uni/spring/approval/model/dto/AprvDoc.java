package com.uni.spring.approval.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AprvDoc {

	private int docNo; 			// 문서 번호
	private int docType; 		// 문서 유형
	private String docTitle;	// 문서 제목
	private String drafter; 	// 기안자 (int)
	private Date draftDate; 	// 기안일
	private String firstAprv; 	// 1차 결재자 (int)
	private String secondAprv; 	// 2차 결재자 (int)
	private int aprvStatus; 	// 결재 상태
	private String status; 		// 상태값
	
	// 결재 리스트 조회 및 문서 상세 조회 시 사용
	private String docForm; 	// 문서 종류 폼	
	private Date proDate;	 	// 요청일
	private Date reDate; 		// 반려일
	
	// 문서 상세 조회 시 사용
	private String firstJob; 	// 1차 결재자 직급
	private String secondJob; 	// 2차 결재자 직급
	
	// 진행 상태 확인 리스트 조회 시 사용
	private String aprvStatusName; // 결재 상태 이름
	
	// 결재 취소 시 사용
	private String aprvCode;	// 결재 코드
	private String aprvPro;		// 결재 코드명
	
}
