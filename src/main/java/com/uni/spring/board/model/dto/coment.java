package com.uni.spring.board.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class coment {

	private int cno;
	private String empno;
	private String ccontent;
	private int cwriteno;
	private int writerno;
	private String cwirter;
	private Timestamp ccreateDate; //timestamp로 하면 시간까지 다 잘 나옴 
	private String status;
	private int boardno;
}
