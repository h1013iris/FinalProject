package com.uni.spring.approval.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DocType { // 문서 유형

	private int docTypeNo; // 문서 유형 번호
	private String docType; // 문서 유형
	private String docForm; // 문서 서식
	
	
}
