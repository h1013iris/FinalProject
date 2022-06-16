package com.uni.spring.approval.model.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class CmtUpdateForm {    // 근태 기록 수정 의뢰 신청서

	private int cmtUptAppNo; 		  // 근태 기록 수정 신청서 번호
	private Integer docNo; 			  // 문서 번호
	private int docTypeNo; 			  // 문서 서식 번호
	private int drafter; 			    // 기안자
	private String drafterDept;		// 기안자 소속 (int)
	private Date dftDate; 			  // 기안일
	private String updateDate; 		// 수정일 (int)
	private String beAttendTime; 	// 기존 출근 시간
	private String beLeaveTime;  	// 기존 출근 시간
	private String attendTime; 		// 수정 출근 시간
	private String leaveTime; 		// 수정 퇴근 시간
	private String updateReason; 	// 수정 사유
	private int outboxNo; 			  // 임시 보관 문서 번호
	private String editStatus;    //수정 여부

	private String drafterName;
	//private String jobName;
}
