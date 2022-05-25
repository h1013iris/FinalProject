package com.uni.spring.board.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {
	
	private String writeno;
	private String title;
	private String writer;
	private String content;
	private Date createDate;
	private String status;
}
