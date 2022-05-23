package com.uni.spring.approval.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AprvStatus { // 결재 상태

	private int aprvStatusNo; // 결재 상태 번호
	private String aprvStatus; // 결재 상태
}
