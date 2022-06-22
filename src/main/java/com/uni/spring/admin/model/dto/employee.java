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
public class employee {
	
	private int empNo;
	private String userId;
	private String empName;
	private String cityNo;
	private String email;
	private String phone;
	private String address;
	private Date hireDate;
	private Date endDate;
	private int jobNo;
	private int deptNo;
	private String jobName;
	private String deptName;
	private String profileImg;
	private String userPwd;
	
	public employee(int empNo2, String empName2, String cityNo2, String email2, String phone2, String address2,
			Date hireDate2, int jobNo2, int deptNo2) {
		// TODO Auto-generated constructor stub
	}
	
}
