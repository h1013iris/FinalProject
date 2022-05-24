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
	
	
	private String Title;
	private String Writer;
	private String Content;
	private String originName;
	private String changeName;
	private Date createDate;
	private String status;
}
