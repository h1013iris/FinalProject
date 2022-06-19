package com.uni.spring.manageMent.model.dto;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class vacationInfo {
	private int vacaNo;//휴가 순번
	private int empNo;//사원 번호 
	private Date hireDate;//입사 날짜
	private int totDayoff;//사용된 총 연차 
	private int useDayoff;//사용연차 
	private String status;//상태값
	private int totTyear;//총 연차
	private String empName;//사원 이름
}
