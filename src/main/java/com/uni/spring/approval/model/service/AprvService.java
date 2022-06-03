package com.uni.spring.approval.model.service;

import java.util.ArrayList;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.AprvHistory;
import com.uni.spring.approval.model.dto.BusCoopForm;
import com.uni.spring.approval.model.dto.BusDraftForm;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.common.PageInfo;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.member.model.dto.Member;

public interface AprvService {

	int completeListCount();

	ArrayList<AprvDoc> completeSelectList(PageInfo pi);

	ArrayList<Member> selectDeptApprover(String deptNo);
	
	String selectDeptName(String deptNo);
	
	void insertLeaveApp(AprvDoc aprvDoc, AprvHistory aprvHistory, LeaveForm leaveForm);
	
	AttendLog selectCmt(AttendLog attendLog);

	void insertCmtUpdateApp(AprvDoc aprvDoc, AprvHistory aprvHistory, CmtUpdateForm cmtUpdateForm);

	ArrayList<Department> selectDeptList();

	void insertBusDraft(AprvDoc aprvDoc, AprvHistory aprvHistory, BusDraftForm busDraftForm);

	void insertBusCoop(AprvDoc aprvDoc, AprvHistory aprvHistory, BusCoopForm busCoopform);

	int requestListCount(Member loginUser);

	ArrayList<AprvDoc> selectRequestList(PageInfo pi, Member loginUser);

	int selectDocTypeNo(int docNo);

	LeaveForm selectLeaveForm(int docNo);

	AprvDoc selectDocApprover(int docNo);

	

	

	

}
