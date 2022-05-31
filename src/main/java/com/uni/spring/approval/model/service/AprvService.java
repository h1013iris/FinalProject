package com.uni.spring.approval.model.service;

import java.util.ArrayList;

import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.AprvHistory;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.common.PageInfo;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.member.model.dto.Member;

public interface AprvService {

	int completeListCount();

	ArrayList<AprvDoc> completeSelectList(PageInfo pi);

	ArrayList<Member> selectApprover(String deptNo);
	
	String selectDeptName(String deptNo);

	void insertDoc(AprvDoc aprvDoc, AprvHistory aprvHistory);

	int insertLeaveApp(LeaveForm leaveForm);

	int insertCmtUpdateForm(CmtUpdateForm cmtUpdateForm);

	AttendLog selectCmt(AttendLog attendLog);

	

	

}
