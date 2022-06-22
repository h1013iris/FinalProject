package com.uni.spring.admin.model.service.approval;

import java.util.ArrayList;

import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.SecurityDoc;
import com.uni.spring.common.PageInfo;

public interface AprvMgtService {

	int selectDocTypeNo(int docNo);

	int scrtyReqListCount();
	
	ArrayList<AprvDoc> selectScrtyReqList();

	int scrtyDocListCount(AprvDoc aprvDoc);
	
	ArrayList<AprvDoc> selectScrtyDocList(PageInfo pi, AprvDoc aprvDoc);

	SecurityDoc selectScrtyReason(int docNo);

	void docScrtySet(SecurityDoc securityDoc, AprvDoc aprvDoc);

	void docScrtyCancel(SecurityDoc securityDoc, AprvDoc aprvDoc);

	
}
