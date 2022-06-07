package com.uni.spring.admin.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class employeeAllInfo extends employee{
	
	private String carStatus;
	private String career;
	private String awards;
	private String bankName;
	private String bankNo;
	private String holderName;
	private String homeStatus;
	private String marriage;
	private String childrenCount;
	private String lastEducational;
	

	@Builder
	public employeeAllInfo(int empNo, String empName, String cityNo, String email, String phone,
			String address, Date hireDate, int jobNo, int deptNo, String carStatus, String career, String awards, String bankName, String bankNo, String holderName,
			String homeStatus, String marriage, String childrenCount, String lastEducational) {
		super(empNo, empName, cityNo, email, phone, address, hireDate, jobNo, deptNo);
		// TODO Auto-generated constructor stub
		this.carStatus = carStatus;
		this.career = career;
		this.awards = awards;
		this.bankName = bankName;
		this.bankNo = bankNo;
		this.holderName = holderName;
		this.homeStatus = homeStatus;
		this.marriage = marriage;
		this.childrenCount = childrenCount;
		this.lastEducational = lastEducational;
	}
	
	

}
