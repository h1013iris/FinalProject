package com.uni.spring.member.model.dto;

import java.sql.Date;


import lombok.Data;

@Data
public class Member {
	
	//파싱을 위해서 int대신 String타입으로 받아준다
	private int empNo;//int.. String이부분 좀더 공부하기..
	private String userId;
	private String userPw;
	private String empName;
	private String userNo;
	private String email;
	private String phone;
	private String address;
	private Date hireDate;
	private String status;
	private Date endDate;
	private String jobNo;//int
	private String departmentNo;//int
	
	private String jobName;
	private String departmentName;	// 부서명 (김태연 세션 저장시 필요함)
	private String changeName;//이미지 명
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
