package com.uni.spring.department.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SemiCheckList {
	private int ckeckNo; //체크 번호 
	private int refSemi;//참조 세부 번호 
	private String checkContent;//체크 내용
	private Date checkDate;//생성 날짜
	private String checkConfirm;//체크 여부
	private String CheckStatus;//상태값
	private int writerNo;//작성자
}
