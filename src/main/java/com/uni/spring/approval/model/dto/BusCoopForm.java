package com.uni.spring.approval.model.dto;

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
	private int refDocNo; // 참조 문서 번호
	private String coopTitle; // 협조문 제목
	private int drafter; // 기안자
	private Timestamp dftDate; // 기안일
	private int receiveDeptNo; // 참조 부서
	private String coopContent; // 협조문 내용
}
