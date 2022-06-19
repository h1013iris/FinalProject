package com.uni.spring.approval.model.service;

import java.util.ArrayList;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.AprvHistory;
import com.uni.spring.approval.model.dto.AprvStatus;
import com.uni.spring.approval.model.dto.BusCoopForm;
import com.uni.spring.approval.model.dto.BusDraftForm;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
import com.uni.spring.approval.model.dto.DocOutbox;
import com.uni.spring.approval.model.dto.DocType;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.approval.model.dto.ReturnDoc;
import com.uni.spring.approval.model.dto.SecurityDoc;
import com.uni.spring.common.PageInfo;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.member.model.dto.Member;

public interface AprvService {

	ArrayList<Member> selectDeptApprover(Member loginUser);
	
	String selectDeptName(String deptNo);
	
	void enrollDocument(int docType, AprvDoc aprvDoc, AprvHistory aprvHistory, LeaveForm leaveForm, CmtUpdateForm cmtUpdateForm, BusDraftForm busDraftForm, BusCoopForm busCoopform);
	
	AttendLog selectCmt(AttendLog attendLog);

	ArrayList<Department> selectDeptList(int deptNo);

	int waitingListCount(AprvDoc aprvDoc);

	ArrayList<AprvDoc> selectWaitingList(PageInfo pi, AprvDoc aprvDoc);
	
	int requestListCount(AprvDoc aprvDoc);

	ArrayList<AprvDoc> selectRequestList(PageInfo pi, AprvDoc aprvDoc);

	int selectDocTypeNo(int docNo);

	void aprvReturn(AprvHistory aprvHistory, AprvDoc aprvDoc, ReturnDoc returnDoc);
	
	LeaveForm selectLeaveForm(int docNo);

	ArrayList<Member> selectDocApprover(int docNo);

	BusCoopForm selectbusCoopForm(int docNo);

	BusDraftForm selectbusDraftForm(int docNo);

	CmtUpdateForm selectCmtUpdateForm(int docNo);

	void documentApprove(AprvHistory aprvHistory, AprvDoc aprvDoc, int approve);

	int returnListCount(AprvDoc aprvDoc);

	ArrayList<AprvDoc> selectReturnList(PageInfo pi, AprvDoc aprvDoc);

	ReturnDoc selectReReason(int docNo);

	int selectDrafter(int docNo);

	void deleteReturnDoc(int docNo);

	int completeListCount(AprvDoc aprvDoc);

	ArrayList<AprvDoc> selectCompleteList(PageInfo pi, AprvDoc aprvDoc);

	void docScrtyRequest(SecurityDoc securityDoc);

	int docScrtyReqCheck(int docNo);

	int statusListCount(AprvDoc aprvDoc);

	ArrayList<AprvDoc> selectStatusList(PageInfo pi, AprvDoc aprvDoc);

	String selectApprover(int docNo);

	int selectAprvStatus(int docNo);

	ArrayList<AprvStatus> aprvStatusList();

	void saveLeaveFormOutbox(DocOutbox docOutbox, LeaveForm leaveForm);

	void saveCmpUdpFormOutbox(DocOutbox docOutbox, CmtUpdateForm cmtUpdateForm);

	void saveDraftFormOutbox(DocOutbox docOutbox, BusDraftForm busDraftForm);

	void saveCoopFormOutbox(DocOutbox docOutbox, BusCoopForm busCoopForm);

	int outboxListCount(AprvDoc aprvDoc);

	ArrayList<DocOutbox> selectOutboxList(PageInfo pi, AprvDoc aprvDoc);

	int selectOutboxDocTypeNo(int outboxNo);

	LeaveForm selectLeaveFormOutbox(int outboxNo);

	CmtUpdateForm selectCmtUdtFormOutbox(int outboxNo);

	BusDraftForm selectDraftFormOutbox(int outboxNo);

	BusCoopForm selectCoopFormOutbox(int outboxNo);

	void deleteOutboxDoc(int outboxNo, int docType, Integer docNo);

	void updateLeaveApp(LeaveForm leaveForm, int outboxNo);

	void updateCmtUpdateApp(CmtUpdateForm cmtUpdateForm, int outboxNo);

	void updateBusDraft(BusDraftForm busDraftForm, int outboxNo);

	void updateBusCoop(BusCoopForm busCoopForm, int outboxNo);

	void oboxAprvReqLeaveApp(AprvDoc aprvDoc, AprvHistory aprvHistory, LeaveForm leaveForm, int outboxNo);

	void oboxAprvReqCmtApp(AprvDoc aprvDoc, AprvHistory aprvHistory, CmtUpdateForm cmtUpdateForm, int outboxNo);

	void oboxAprvReqBusDft(AprvDoc aprvDoc, AprvHistory aprvHistory, BusDraftForm busDraftForm, int outboxNo);

	void oboxAprvReqBusCoop(AprvDoc aprvDoc, AprvHistory aprvHistory, BusCoopForm busCoopForm, int outboxNo);

	AprvDoc lastAprvHistory(int docNo);

	void aprvCancle(int docNo, int docType, DocOutbox docOutbox);

	void aprvReRequest(int docType, int outboxNo, LeaveForm leaveForm, CmtUpdateForm cmtUpdateForm, BusDraftForm busDraftForm, BusCoopForm busCoopForm, AprvHistory aprvHistory, AprvDoc aprvDoc);

	ArrayList<DocType> selectDocTypeList();
	
	int searchAllDocListCount(AprvDoc aprvDoc);

	ArrayList<AprvDoc> searchAllDocList(PageInfo pi, AprvDoc aprvDoc);

	ArrayList<Member> selectDocEnrollApprover(Member loginUser);

	AprvDoc selectCancleDocApprover(int docNo);

	
	

	

	

}
