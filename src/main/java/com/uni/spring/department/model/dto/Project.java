package com.uni.spring.department.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Project {
	private int proNo; //프로젝트 번호
	private int proWriter;//프로젝트 생성자
	private int proDepart;//참조 부서 코드
	private String proTitle;//프로젝트 명
	private int count;//프로젝트 참여자 수
	private Date proDate;//생성 날 짜 
	private String proStatus;//상태값
}	
