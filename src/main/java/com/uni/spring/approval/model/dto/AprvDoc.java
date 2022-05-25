package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

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
	private int drafter; // 기안자
	private int firstAprv; // 1차 결재자
	private int secondAprv; // 2차 결재자
	private int aprvStatus; // 결재 상태
	private Timestamp comDate; // 결재 완료일 - 결재 완료 문서 위해
	private int status; // 상태값
	
	
	// 결재 완료 문서 생성자
	public AprvDoc(int docNo, int docType, String docTitle, int drafter, Timestamp comDate) {
		super();
		this.docNo = docNo;
		this.docType = docType;
		this.docTitle = docTitle;
		this.drafter = drafter;
		this.comDate = comDate;
	}
	
	
	
}
