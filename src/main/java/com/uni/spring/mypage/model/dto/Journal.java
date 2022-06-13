package com.uni.spring.mypage.model.dto;

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
public class Journal {
	private int journalNo;
	private int empNo;
	private String empName;
	private Date createDate;
	private String content;
	private String sideNote;
	private String uniqueness;
	private int sortNo;
	private String searchValue;
	private String fromDate;
	private String toDate;
}
