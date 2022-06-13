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
public class ToDoList {
	private int listNo;
	private int empNo;
	private Date todoDate;
	private String content;
	private String status;
	private String percent;
	private String time;
}
