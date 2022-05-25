package com.uni.spring.approval.model.service;

import java.util.ArrayList;

import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.common.PageInfo;

public interface AprvService {

	int selectListCount();

	ArrayList<AprvDoc> selectList(PageInfo pi);

}
