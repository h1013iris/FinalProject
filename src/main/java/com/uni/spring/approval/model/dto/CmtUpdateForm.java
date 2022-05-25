package com.uni.spring.approval.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CmtUpdateForm { // 근태 기록 수정 의뢰 신청서

	private int cmtUptAppNo; // 근태 기록 수정 신청서 번호
	private int docNo; // 문서 번호
	private String appTitle; // 신청서 제목
	private int drafter; // 기안자
	private Timestamp draftDate; // 기안일
	private String cmt; // 출퇴근
	private Timestamp updateDate; // 수정일
	private Timestamp beforeTime; // 수정 전 시간
	private Timestamp afterTime; // 수정 후 시간
	private String updateReason; // 수정 사유
}
