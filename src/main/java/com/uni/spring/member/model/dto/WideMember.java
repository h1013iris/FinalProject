package com.uni.spring.member.model.dto;

import java.sql.Date;

import lombok.Data;

//조인을 위한 dto
@Data
public class WideMember {
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
	private String departMentTitle;
}
