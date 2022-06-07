package com.uni.spring.department.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SemiProject {
	private int semiNo;//세부 프로젝트 번호 
	private int refPro;//프로젝트 번호 
	private String refPc;//참조 분류 명(예정, ....)
	private int semiWriter;//세부 프로젝트 작성자 
	private String semiTitle;//세부 프로젝트 제목
	private String semiContent;//세부 프로젝트 설명
	private Date semiDue;//기한일
	private Date semiDate;//생성 날짜 
	private String semiStatus;//상태값
}
