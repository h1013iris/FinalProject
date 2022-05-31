package com.uni.spring.member.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	
	//파싱을 위해서 int대신 String타입으로 받아준다
	private String empNo;//int
	private String userId;
	private String userPw;
	private String empName;
	private String userNo;//int
	private String email;
	private String phone;
	private String address;
	private Date hireDate;
	private String status;
	private Date endDate;
	private String jobNo;//int
	private String departmentNo;//int
	
	private String jobName;
	
	
	/*
	USER_INFO 컬럼명
	
	EMP_NO
	USER_ID
	USER_PW
	EMP_NAME
	USER_NO
	EMAIL
	PHONE
	ADDRESS
	HIRE_DATE
	STATUS
	END_DATE
	JOB_NO
	DEPARTMENT_NO
	*/
	

}
