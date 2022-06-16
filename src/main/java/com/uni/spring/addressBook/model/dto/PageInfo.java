package com.uni.spring.addressBook.model.dto;

import lombok.Data;

@Data
public class PageInfo {
	private int currentPage;
	private int listCount;
	private int startPage;
	private int endPage;
	private int maxPage;
	private int pageLimit;
	private int boardLimit;
}
