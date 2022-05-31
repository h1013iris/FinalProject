package com.uni.spring.addressBook.model.dto;

import java.sql.Date;

import lombok.Data;


@Data
public class Customer {
	
	private int cusNo;
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
	
	/*
	
	 	CUS_NO
		EMP_NO
		IN_FOLDER
		COM_NM
		COMNO
		COM_TEL
		COM_CEO
		COM_PIX
		COM_PHONE
		COM_EMAIL
		COM_MEMO
		CRE_DATE
		OUTBOX
	*/
	

}
