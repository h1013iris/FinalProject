package com.uni.spring.admin.model.service.approval;

import java.util.ArrayList;

import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.common.PageInfo;

public interface AprvMgtService {

	int selectDocTypeNo(int docNo);

	int scrtyReqListCount();
	
	ArrayList<AprvDoc> selectScrtyReqList(PageInfo pi);

	int scrtyListCount();
	
	ArrayList<AprvDoc> selectDocScrtyList(PageInfo pi);

	int docScrtyCheck(int docNo);

	
}
