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
	private int cityNo;
	private String email;
	private String phone;
	private String address;
	private Date hireDate;
	private Date endDate;
	private int jobNo;
	private int deptNo;
}
