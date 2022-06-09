package com.uni.spring.admin.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Department {

	private int deptNo; //부서코드
	private String deptTitle; //부서명
	private String deptResponsible; //총책임자
	private Date deptCreationDate;//부서 생성일자
}
