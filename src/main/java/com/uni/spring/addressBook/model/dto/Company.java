package com.uni.spring.addressBook.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Company {
	private int compNo;
	private int empNo;
	private String inFolder;
	private String comNm;
	private String comNo;
	private String comTel;
	private String comCeo;
	private String comPix;
	private String comPhone;
	private String comEmail;
	private String comMemo;
	private Date creDate;
	private String outBox;
	
}
