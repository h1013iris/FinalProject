package com.uni.spring.board.model.dto;

import java.sql.Date;

import com.uni.spring.department.model.dto.Department;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	
	private int writeno;
	private String title;
	private int deptno;
	private String deptname;
	private int empno;
	private String writer;
	private String content;
	private Date createDate;
	private String status;
}
