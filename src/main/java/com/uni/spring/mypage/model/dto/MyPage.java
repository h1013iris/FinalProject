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
public class MyPage {
	
	private int pageNo;
	private String pageName;
	private String pageUrl;
	private int empNo;

}
