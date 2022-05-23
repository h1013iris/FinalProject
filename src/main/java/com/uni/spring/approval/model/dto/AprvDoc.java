package com.uni.spring.approval.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AprvDoc {

	private int docNo;
	private int docType;
	private int drafter;
	private int firstAprv;
	private int secondAprv;
	private int aprvStatus;
	private int status;
	
}
