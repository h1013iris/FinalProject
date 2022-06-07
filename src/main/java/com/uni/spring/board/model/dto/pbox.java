package com.uni.spring.board.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class pbox {

	
	private int pno;
	private int empno;
	private String title;
 	private String content;
 	private int boardno;
 	private String status;
 	private Date pcreateDate;
	
}
