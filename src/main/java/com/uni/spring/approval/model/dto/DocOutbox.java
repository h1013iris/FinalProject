package com.uni.spring.approval.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DocOutbox { // 임시 보관 문서

	private int docOutboxNo; 			// 임시 보관 번호
	private int docType; 				// 문서 타입
	private String docTitle; 			// 문서 제목
	private String drafter; 			// 기안자
	private Date lastUpdateDate; 	// 마지막 수정일
	private Integer docNo; 					// 문서 번호 (결재 취소한 경우)
	
	private String docForm; 			// 리스트 조회 시 사용할 서식 이름
}
