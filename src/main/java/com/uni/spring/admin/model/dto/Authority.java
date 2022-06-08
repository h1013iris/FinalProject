package com.uni.spring.admin.model.dto;

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
public class Authority {
	
	private int authorityNo;
	private int empNo;
	private String authorityName;
	
	
}
