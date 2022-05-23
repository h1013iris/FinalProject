package com.uni.spring.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {

	private int listCatNo;//분류 순서
	private int catNo;//분류번호
	private int largetCat;//대분류
}
