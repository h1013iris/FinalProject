package com.uni.spring.approval.controller;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
import com.uni.spring.approval.model.service.AprvService;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.Pagination;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.manageMent.model.service.ManageService;
import com.uni.spring.member.model.dto.Member;

@SessionAttributes("loginUser") // 해당 key값의 value를 세션에 추가
@Controller // 가장 먼저 어노테이션으로 등록
public class AprvController {
	
	@Autowired
	public AprvService aprvService;
	
	
	// 전자결재 메인으로
	@RequestMapping("approvalMain.do")
	public ModelAndView apprvalMain(ModelAndView mv) {
		
		mv.setViewName("approval/approvalMain");
		
		return mv;
	}
	
	
	
	// 문서 등록 폼
	@RequestMapping("docEnrollForm.do")
	public ModelAndView docEnrollForm(Integer docForm, String modalDocTitle, String deptNo, ModelAndView mv) {
		
		//System.out.println("docForm ========" + docForm);
		//System.out.println("docTitle ========" + docTitle);
		//System.out.println("deptNo ===============" + deptNo);
		
		// 폼 유형, 문서 제목, 결재자 넘기기 - 메소드 체이닝으로
		mv.addObject("docForm", docForm)
		.addObject("docTitle", modalDocTitle)
		.setViewName("approval/docEnrollForm");
		
		return mv;
	}
	
	
	
	// 로그인 유저의 소속(부서명) 조회
	@ResponseBody
	@RequestMapping(value="selectDeptName.do", produces="application/json; charset=utf-8")
	public String selectDeptName(String deptNo) {
		
		// 로그인 유저의 부서명 조회해서 가져오기
		String deptName = aprvService.selectDeptName(deptNo);
		
		return new Gson().toJson(deptName);
	}
	
	
	
	// 문서 등록 시 결재선 조회
	@ResponseBody
	@RequestMapping(value="selectDeptApprover.do", produces="application/json; charset=utf-8")
	public String selectDeptApprover(String deptNo, String jobNo) {
		
		Member loginUser = new Member();
		loginUser.setDepartmentNo(deptNo);
		loginUser.setJobNo(jobNo);
		System.out.println(loginUser.toString());
		
		// 해당 부서 1차, 2차 결재자 조회해서 담기
		ArrayList<Member> approver = aprvService.selectDeptApprover(loginUser);
		
		return new Gson().toJson(approver);
	}
	
	
	
	// 휴가 신청서 등록
	@ResponseBody
	@RequestMapping(value="insertLeaveApp.do", produces="application/json; charset=utf-8")
	public String insertLeaveApp(AprvDoc aprvDoc, AprvHistory aprvHistory, LeaveForm leaveForm) {
		
		//System.out.println("Dao ======= " + aprvDoc.toString());
		//System.out.println("Dao ======= " + leaveForm.toString());
		//System.out.println(aprvHistory.toString());

		aprvService.insertLeaveApp(aprvDoc, aprvHistory, leaveForm);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 해당 날짜 근태 기록 조회
	@ResponseBody
	@RequestMapping(value="selectCmt.do", produces="application/json; charset=utf-8")
	public String selectCmt(String userNo, String date, Model model) {
		
		// 근태 기록 객체에 유저 번호, 해당 날짜 담아서 넘기기
		AttendLog attendLog = new AttendLog();
		attendLog.setEmpNo(Integer.valueOf(userNo));
		attendLog.setAttendDate(Date.valueOf(date)); // String 을 Date로 형변환해서 set
		
		System.out.println("Controller =========" + attendLog.toString());
		
		// 회원의 해당 날짜 촐퇴근 시간을 근태 기록 객체에 담기
		AttendLog userAttendLog = aprvService.selectCmt(attendLog);
		
		//System.out.println(userAttendLog.toString());
		
		return new Gson().toJson(userAttendLog);
	}
	
	
	
	// 근태 기록 수정 신청서 등록
	@ResponseBody
	@RequestMapping(value="insertCmtUpdateApp.do", produces="application/json; charset=utf-8")
	public String insertCmtUpdateApp(AprvDoc aprvDoc, AprvHistory aprvHistory, CmtUpdateForm cmtUpdateForm) {
		
		aprvService.insertCmtUpdateApp(aprvDoc, aprvHistory, cmtUpdateForm);
		
		return new Gson().toJson("success");
	}

	
	
	// 부서 조회
	@ResponseBody
	@RequestMapping(value="selectDeptList.do", produces="application/json; charset=utf-8")
	public String selectDeptList(int deptNo) {
		
		ArrayList<Department> list = aprvService.selectDeptList(deptNo);
		
		return new Gson().toJson(list);
	}
	
	
	
	// 업무 기안서 등록
	@ResponseBody
	@RequestMapping(value="insertBusDraft.do", produces="application/json; charset=utf-8")
	public String insertBusDraft(AprvDoc aprvDoc, AprvHistory aprvHistory, BusDraftForm busDraftForm) {
		
		aprvService.insertBusDraft(aprvDoc, aprvHistory, busDraftForm);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 업무 협조문 등록
	@ResponseBody
	@RequestMapping(value="insertBusCoop.do", produces="application/json; charset=utf-8")
	public String insertBusCoop(AprvDoc aprvDoc, AprvHistory aprvHistory, BusCoopForm busCoopform) {
		
		aprvService.insertBusCoop(aprvDoc, aprvHistory, busCoopform);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 해당 문서 결재자 조회
	@ResponseBody
	@RequestMapping(value="selectDocApprover.do", produces="application/json; charset=utf-8")
	public String selectDocApprover(int docNo) {
		
		// 해당 부서 1차, 2차 결재자 조회해서 담기
		AprvDoc approver = aprvService.selectDocApprover(docNo);
		
		return new Gson().toJson(approver);
	}
	
	
	// 휴가 신청서 상세 조회
	@ResponseBody
	@RequestMapping(value="selectLeaveForm.do", produces="application/json; charset=utf-8")
	public String selectLeaveForm(int docNo) {
		
		LeaveForm leaveForm = aprvService.selectLeaveForm(docNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(leaveForm);
	}
	
	
	
	// 근태 기록 수정 신청서
	@ResponseBody
	@RequestMapping(value="selectCmtUpdateForm.do", produces="application/json; charset=utf-8")
	public String selectCmtUpdateForm(int docNo) {
		
		CmtUpdateForm cmtUpdateForm = aprvService.selectCmtUpdateForm(docNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(cmtUpdateForm);
	}
	
	
	
	// 업무 기안서 상세 조회
	@ResponseBody
	@RequestMapping(value="selectbusDraftForm.do", produces="application/json; charset=utf-8")
	public String selectbusDftForm(int docNo) {
		
		BusDraftForm busDraftForm = aprvService.selectbusDraftForm(docNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(busDraftForm);
	}
	
	
	
	// 업무 협조문 상세 조회
	@ResponseBody
	@RequestMapping(value="selectbusCoopForm.do", produces="application/json; charset=utf-8")
	public String selectbusCoopForm(int docNo) {
		
		BusCoopForm busCoopForm = aprvService.selectbusCoopForm(docNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(busCoopForm);
	}
	
	
	
	// 결재 대기함 메인
	@RequestMapping("waitingMain.do")
	public ModelAndView waitingMain(ModelAndView mv) {
		
		mv.setViewName("approval/waiting/waitingMain");
		
		return mv;
	}
	
	
	
	// 결재 대기 리스트
	@ResponseBody
	@RequestMapping(value="waitingList.do", produces="application/json; charset=utf-8")
	public String selectWaitingList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Member loginUser) {
				
		int listCount = aprvService.waitingListCount(loginUser);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<AprvDoc> list = aprvService.selectWaitingList(pi, loginUser);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	
	
	// 결재 대기 문서 상세 조회
	@RequestMapping("waitingDetail.do")
	public ModelAndView detailWaitingDoc(int docNo, ModelAndView mv) {
		
		// 해당 문서의 서식 번호 가져오기
		int docType = aprvService.selectDocTypeNo(docNo);
		
		mv.addObject("docNo", docNo)
		.addObject("docType", docType)
		.setViewName("approval/waiting/waitingDetailView");
		
		return mv;
	}
	
	
	
	// 결재 승인 (중간 승인)
	@ResponseBody
	@RequestMapping(value="aprvApprove.do", produces="application/json; charset=utf-8")
	public String aprvApprove(AprvHistory aprvHistory) {
		
		// 2차 결재자가 null이 아니고 본인이 1차 결재자일 경우 상태값 업데이트 없음
		// -> 결재 기록만 등록
		System.out.println(aprvHistory.toString());
		
		aprvService.aprvApprove(aprvHistory);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 결재 승인 (최종 승인)
	@ResponseBody
	@RequestMapping(value="aprvApproveComplete.do", produces="application/json; charset=utf-8")
	public String aprvApproveComplete(AprvHistory aprvHistory, AprvDoc aprvDoc) {
		
		// 2차 결재재일 경우, 또는 2차 결재자가  null인 문서의 1차 결재자일 경우 상태값 결재 완료로 업데이트
		// -> 결재 기록 등록, 상태값 업데이트
		System.out.println(aprvHistory.toString());
		System.out.println(aprvDoc.toString());
		
		aprvService.aprvApproveComplete(aprvHistory, aprvDoc);
		
		
		return new Gson().toJson("success");
	}
	
	
	
	// 결재 반려
	@ResponseBody
	@RequestMapping(value="aprvReturn.do", produces="application/json; charset=utf-8")
	public String aprvReturn(AprvHistory aprvHistory, AprvDoc aprvDoc, ReturnDoc returnDoc) {
		
		// 결재 기록에 등록
		// 결재 상태 반려 중으로 변경
		// 반려 문서에 등록
		System.out.println(aprvHistory.toString());
		System.out.println(returnDoc.toString());
		System.out.println(aprvDoc.toString());
		
		aprvService.aprvReturn(aprvHistory, aprvDoc, returnDoc);
		
		return new Gson().toJson("success");
	}

	
	
	
	// 결재 요청 메인
	@RequestMapping("requestMain.do")
	public ModelAndView requestMain(ModelAndView mv) {
		
		mv.setViewName("approval/request/requestMain");
		
		return mv;
	}
	
	
	
	// 결재 요청 리스트
	@ResponseBody
	@RequestMapping(value="requestList.do", produces="application/json; charset=utf-8")
	public String selectRequestList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Member loginUser) {
				
		int listCount = aprvService.requestListCount(loginUser);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<AprvDoc> list = aprvService.selectRequestList(pi, loginUser);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	
	
	// 결재 요청 문서 상세 조회
	@RequestMapping("requestDetail.do")
	public ModelAndView detailRequestDoc(int docNo, ModelAndView mv) {
		
		// 해당 문서의 서식 번호 가져오기
		int docType = aprvService.selectDocTypeNo(docNo);
		
		mv.addObject("docNo", docNo)
		.addObject("docType", docType)
		.setViewName("approval/request/requestDetailView");
		
		return mv;
	}
	
	
	
	// 결재 완료 메인
	@RequestMapping("completeMain.do")
	public ModelAndView completeMain(ModelAndView mv) {
		
		mv.setViewName("approval/complete/completeMain");
		
		return mv;
	}
		
	
	
	// 결재 완료 리스트
	@ResponseBody
	@RequestMapping(value="completeList.do", produces="application/json; charset=utf-8")
	public String selectCompleteList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, int empNo) {
		
		int listCount = aprvService.completeListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<AprvDoc> list = aprvService.selectCompleteList(pi, empNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	
	
	// 결재 완료 문서 상세 조회
	@RequestMapping("completeDetail.do")
	public ModelAndView detailCompleteDoc(int docNo, ModelAndView mv) {
		
		// 해당 문서의 서식 번호 가져오기
		int docType = aprvService.selectDocTypeNo(docNo);
		
		mv.addObject("docNo", docNo)
		.addObject("docType", docType)
		.setViewName("approval/complete/completeDetailView");
		
		return mv;
	}
	
	
	
	// 반려 문서함 메인
	@RequestMapping("returnMain.do")
	public ModelAndView returnMain(ModelAndView mv) {
		
		mv.setViewName("approval/return/returnMain");
		
		return mv;
	}
	
	
	
	// 결재 반려 리스트
	@ResponseBody
	@RequestMapping(value="returnList.do", produces="application/json; charset=utf-8")
	public String selectReturnList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, int empNo) {
				
		int listCount = aprvService.returnListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<AprvDoc> list = aprvService.selectReturnList(pi, empNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	
	
	// 결재 반려 문서 상세 조회
	@RequestMapping("returnDetail.do")
	public ModelAndView detailReturnDoc(int docNo, ModelAndView mv) {
		
		// 해당 문서의 서식 번호 가져오기
		int docType = aprvService.selectDocTypeNo(docNo);
		
		mv.addObject("docNo", docNo)
		.addObject("docType", docType)
		.setViewName("approval/return/returnDetailView");
		
		return mv;
	}
	
	
	
	// 반려 사유 조회
	@ResponseBody
	@RequestMapping(value="selectReReason.do", produces="application/json; charset=utf-8")
	public String selectReReason(int docNo) {
		
		ReturnDoc returnDoc = aprvService.selectReReason(docNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(returnDoc);
	}
	
	
	
	// 기안자 조회
	@ResponseBody
	@RequestMapping(value="selectDrafter.do", produces="application/json; charset=utf-8")
	public String selectDrafter(int docNo) {
		
		int drafter  = aprvService.selectDrafter(docNo);
		
		return new Gson().toJson(drafter);
	}
	
	
	
	// 반려 문서 삭제
	@ResponseBody
	@RequestMapping(value="deleteReturnDoc.do", produces="application/json; charset=utf-8")
	public String deleteReturnDoc(int docNo) {
		
		aprvService.deleteReturnDoc(docNo);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 보안 요청
	@ResponseBody
	@RequestMapping(value="scrtyRequest.do", produces="application/json; charset=utf-8")
	public String docScrtyRequest(SecurityDoc securityDoc) {
		
		// 일단 보안 문서에 등록하고
		// 관리자가 보안 처리한 문서만 문서 상태값 변경
		System.out.println(securityDoc.toString());
		
		aprvService.docScrtyRequest(securityDoc);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 보안 요청된 문서인지 조회
	@ResponseBody
	@RequestMapping(value="docScrtyReqCheck.do", produces="application/json; charset=utf-8")
	public String docScrtyCheck(int docNo) {
				
		int result = aprvService.docScrtyReqCheck(docNo);
		
		// 조회 결과가 존재하면 yes 리턴, 아니면 no 리턴
		if(result > 0) {
			return new Gson().toJson("yes");
		
		} else {
			return new Gson().toJson("no");
		}
		
	}
	
	
	
	// 진행 상태 확인함 메인
	@RequestMapping("statusMain.do")
	public ModelAndView statusMain(ModelAndView mv) {
		
		mv.setViewName("approval/status/statusMain");
		
		return mv;
	}
	
	
	
	// 진행 상태 확인 리스트
	@ResponseBody
	@RequestMapping(value="statusList.do", produces="application/json; charset=utf-8")
	public String selectStatusList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, AprvDoc aprvDoc) {
		
		System.out.println(aprvDoc.toString());
		
		int listCount = aprvService.statusListCount(aprvDoc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<AprvDoc> list = aprvService.selectStatusList(pi, aprvDoc);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	
	
	// 진행 상태 확인 상세 조회
	@RequestMapping("statusnDetail.do")
	public ModelAndView detailStatusDoc(int docNo, ModelAndView mv) {
		
		// 해당 문서의 서식 번호 가져오기
		int docType = aprvService.selectDocTypeNo(docNo);
		
		// 해당 문서 상태값 조회
		int aprvStatus = aprvService.selectAprvStatus(docNo);
		
		mv.addObject("docNo", docNo)
		.addObject("docType", docType)
		.addObject("aprvStatus", aprvStatus)
		.setViewName("approval/status/statusDetailView");
		
		return mv;
	}
	

	
	// 상태값이 진행 중인 경우 현재 결재자 조회
	@ResponseBody
	@RequestMapping(value="selectApprover.do", produces="application/json; charset=utf-8")
	public String selectApprover(int docNo) {
				
		String approver = aprvService.selectApprover(docNo);
		
		return new Gson().toJson(approver);
	}
	
	
	
	// 결재 문서 상태값 리스트 조회
	@ResponseBody
	@RequestMapping(value="selectAprvStatusList.do", produces="application/json; charset=utf-8")
	public String selectAprvStatusList() {
		
		ArrayList<AprvStatus> list = aprvService.aprvStatusList();
		
		return new Gson().toJson(list);
	}
	
	
	// 휴가 신청서 임시 보관함에 저장
	@ResponseBody
	@RequestMapping(value="saveLeaveFormOutbox.do", produces="application/json; charset=utf-8")
	public String saveLeaveFormOutbox(DocOutbox docOutbox, LeaveForm leaveForm) {
		
		System.out.println(docOutbox.toString());
		System.out.println(leaveForm.toString());
		
		aprvService.saveLeaveFormOutbox(docOutbox, leaveForm);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 근태 기록 수정 신청서 임시 보관함에 저장
	@ResponseBody
	@RequestMapping(value="saveCmpUdpFormOutbox.do", produces="application/json; charset=utf-8")
	public String saveCmpUdpFormOutbox(DocOutbox docOutbox, CmtUpdateForm cmtUpdateForm) {
		
		System.out.println(cmtUpdateForm.toString());
		
		aprvService.saveCmpUdpFormOutbox(docOutbox, cmtUpdateForm);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 업무 기안서 임시 보관함에 저장
	@ResponseBody
	@RequestMapping(value="saveDraftFormOutbox.do", produces="application/json; charset=utf-8")
	public String saveDraftFormOutbox(DocOutbox docOutbox, BusDraftForm busDraftForm) {
		
		System.out.println(busDraftForm.toString());
		
		aprvService.saveDraftFormOutbox(docOutbox, busDraftForm);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 업무 협조문 신청서 임시 보관함에 저장
	@ResponseBody
	@RequestMapping(value="saveCoopFormOutbox.do", produces="application/json; charset=utf-8")
	public String saveCoopFormOutbox(DocOutbox docOutbox, BusCoopForm busCoopForm) {
		
		System.out.println(busCoopForm.toString());
		
		aprvService.saveCoopFormOutbox(docOutbox, busCoopForm);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 임시 보관함 메인
	@RequestMapping("outboxMain.do")
	public ModelAndView outboxMain(ModelAndView mv) {
		
		mv.setViewName("approval/outbox/outboxMain");
		
		return mv;
	}
	
	
	
	// 임시 보관 리스트 조회
	@ResponseBody
	@RequestMapping(value="selectOutboxList.do", produces="application/json; charset=utf-8")
	public String selectOutboxList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, int empNo) {
				
		int listCount = aprvService.outboxListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<DocOutbox> list = aprvService.selectOutboxList(pi, empNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	
	
	// 임시 보관 문서 임시 보관함 상세 조회
	@RequestMapping("outboxDetail.do")
	public ModelAndView detailOutboxDetailDoc(int outboxNo, ModelAndView mv) {
		
		// 해당 문서의 서식 번호 가져오기
		int docType = aprvService.selectOutboxDocTypeNo(outboxNo);
		
		mv.addObject("outboxNo", outboxNo)
		.addObject("docType", docType)
		.setViewName("approval/outbox/outboxDetailView");
		
		return mv;
	}
	
	
	
	// 휴가 신청서 임시 보관함 상세 조회
	@ResponseBody
	@RequestMapping(value="selectLeaveFormOutbox.do", produces="application/json; charset=utf-8")
	public String selectLeaveFormOutbox(int outboxNo) {
		
		LeaveForm leaveForm = aprvService.selectLeaveFormOutbox(outboxNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(leaveForm);
	}
	
	
	
	// 근태 기록 수정 신청서 임시 보관함 상세 조회
	@ResponseBody
	@RequestMapping(value="selectCmtUdtFormOutbox.do", produces="application/json; charset=utf-8")
	public String selectCmtUdtFormOutbox(int outboxNo) {
		
		CmtUpdateForm cmtUpdateForm = aprvService.selectCmtUdtFormOutbox(outboxNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(cmtUpdateForm);
	}
	
	
	
	// 업무 기안서 임시 보관함 상세 조회
	@ResponseBody
	@RequestMapping(value="selectDraftFormOutbox.do", produces="application/json; charset=utf-8")
	public String selectDraftFormOutbox(int outboxNo) {
		
		BusDraftForm busDraftForm = aprvService.selectDraftFormOutbox(outboxNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(busDraftForm);
	}
	
	
	
	// 업무 협조문 상세 조회
	@ResponseBody
	@RequestMapping(value="selectCoopFormOutbox.do", produces="application/json; charset=utf-8")
	public String selectCoopFormOutbox(int outboxNo) {
		
		BusCoopForm busCoopForm = aprvService.selectCoopFormOutbox(outboxNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(busCoopForm);
	}
	
	
	
	// 임시 저장 문서 삭제
	@ResponseBody
	@RequestMapping(value="deleteOutboxDoc.do", produces="application/json; charset=utf-8")
	public String deleteOutboxDoc(int outboxNo, int docType, 
								@RequestParam(required = false) Integer docNo) {
		
		System.out.println("Controller docNo ==========> " + docNo);
		aprvService.deleteOutboxDoc(outboxNo, docType, docNo);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 임시 저장 문서 수정 페이지로 이동
	@ResponseBody
	@RequestMapping("docUpdateForm.do")
	public ModelAndView docUpdateForm(Integer docType, int outboxNo, ModelAndView mv) {
		
		//System.out.println("outboxNo ========" + outboxNo);
		//System.out.println("docForm ========" + docType);
		
		// 폼 유형, 임시 저장 문서 번호 넘기기 - 메소드 체이닝으로
		mv.addObject("docForm", docType)
		.addObject("outboxNo", outboxNo)
		.setViewName("approval/outbox/docUpdateForm");
		
		return mv;
	}
	
	
	
	// 휴가 신청서 업데이트
	@ResponseBody
	@RequestMapping(value="updateLeaveApp.do", produces="application/json; charset=utf-8")
	public String updateLeaveApp(LeaveForm leaveForm) {
		
		System.out.println(leaveForm.toString());
		
		// 최근 수정일 변경하기 위해 임시 보관 번호 선언해서 넘기기
		int outboxNo = leaveForm.getOutboxNo();
		
		aprvService.updateLeaveApp(leaveForm, outboxNo);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 근태 기록 수정 신청서 업데이트
	@ResponseBody
	@RequestMapping(value="updateCmtUpdateApp.do", produces="application/json; charset=utf-8")
	public String updateCmtUpdateApp(CmtUpdateForm cmtUpdateForm) {
		
		System.out.println(cmtUpdateForm.toString());
		
		// 최근 수정일 변경하기 위해 임시 보관 번호 선언해서 넘기기
		int outboxNo = cmtUpdateForm.getOutboxNo();
		
		aprvService.updateCmtUpdateApp(cmtUpdateForm, outboxNo);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 업무 기안서 업데이트
	@ResponseBody
	@RequestMapping(value="updateBusDraft.do", produces="application/json; charset=utf-8")
	public String updateBusDraft(BusDraftForm busDraftForm) {
		
		System.out.println(busDraftForm.toString());
		
		// 최근 수정일 변경하기 위해 임시 보관 번호 선언해서 넘기기
		int outboxNo = busDraftForm.getOutboxNo();
		
		aprvService.updateBusDraft(busDraftForm, outboxNo);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 업무 협조문 업데이트
	@ResponseBody
	@RequestMapping(value="updateBusCoop.do", produces="application/json; charset=utf-8")
	public String updateBusCoop(BusCoopForm busCoopForm) {
		
		System.out.println(busCoopForm.toString());
		
		// 최근 수정일 변경하기 위해 임시 보관 번호 선언해서 넘기기
		int outboxNo = busCoopForm.getOutboxNo();
		
		aprvService.updateBusCoop(busCoopForm, outboxNo);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 임시 저장 문서 - 휴가 신청서 결재 요청
	@ResponseBody
	@RequestMapping(value="oboxAprvReqLeaveApp.do", produces="application/json; charset=utf-8")
	public String oboxAprvReqLeaveApp(AprvDoc aprvDoc, AprvHistory aprvHistory, 
								LeaveForm leaveForm, int outboxNo) {
		
		System.out.println(aprvDoc.toString());
		System.out.println(aprvHistory.toString());
		System.out.println(leaveForm.toString());
		
		aprvService.oboxAprvReqLeaveApp(aprvDoc, aprvHistory, leaveForm, outboxNo);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 임시 저장 문서 - 근태 기록 수정 신청서 결재 요청
	@ResponseBody
	@RequestMapping(value="oboxAprvReqCmtApp.do", produces="application/json; charset=utf-8")
	public String oboxAprvReqCmtApp(AprvDoc aprvDoc, AprvHistory aprvHistory, 
								CmtUpdateForm cmtUpdateForm, int outboxNo) {
		
		System.out.println(aprvDoc.toString());
		System.out.println(aprvHistory.toString());
		System.out.println(cmtUpdateForm.toString());
		
		aprvService.oboxAprvReqCmtApp(aprvDoc, aprvHistory, cmtUpdateForm, outboxNo);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 임시 저장 문서 - 근태 기록 수정 신청서 결재 요청
	@ResponseBody
	@RequestMapping(value="oboxAprvReqBusDft.do", produces="application/json; charset=utf-8")
	public String oboxAprvReqBusDft(AprvDoc aprvDoc, AprvHistory aprvHistory, 
								BusDraftForm busDraftForm, int outboxNo) {
		
		System.out.println(aprvDoc.toString());
		System.out.println(aprvHistory.toString());
		System.out.println(busDraftForm.toString());
		
		aprvService.oboxAprvReqBusDft(aprvDoc, aprvHistory, busDraftForm, outboxNo);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 임시 저장 문서 - 근태 기록 수정 신청서 결재 요청
	@ResponseBody
	@RequestMapping(value="oboxAprvReqBusCoop.do", produces="application/json; charset=utf-8")
	public String oboxAprvReqBusCoop(AprvDoc aprvDoc, AprvHistory aprvHistory, 
								BusCoopForm busCoopForm, int outboxNo) {
		
		System.out.println(aprvDoc.toString());
		System.out.println(aprvHistory.toString());
		System.out.println(busCoopForm.toString());
		
		aprvService.oboxAprvReqBusCoop(aprvDoc, aprvHistory, busCoopForm, outboxNo);
		
		return new Gson().toJson("success");
	}
	
	
	
	// 결재 취소 위해 해당 문서 가장 최근 기록 조회
	@ResponseBody
	@RequestMapping(value="lastAprvHistory.do", produces="application/json; charset=utf-8")
	public String aprvLastHistory(int docNo) {

		AprvDoc lastHistory = aprvService.lastAprvHistory(docNo);
		
		return new Gson().toJson(lastHistory);
	}
	
	
	
	// 결재 취소
	@ResponseBody
	@RequestMapping(value="aprvCancle.do", produces="application/json; charset=utf-8")
	public String aprvCancle(int docNo, int docType, DocOutbox docOutbox) {
		
		System.out.println("Controller =========> docType " + docType);
		System.out.println(docOutbox.toString());
		
		//int docType = docOutbox.getDocType();
		
		aprvService.aprvCancle(docNo, docType, docOutbox);
		
		return new Gson().toJson("success");
	}
	
	
	// 결재 취소 문서 결재 재요청
	@ResponseBody
	@RequestMapping(value="aprvReRequest.do", produces="application/json; charset=utf-8")
	public String aprvReRequest(int docType, int outboxNo, LeaveForm leaveForm,
								CmtUpdateForm cmtUpdateForm, BusDraftForm busDraftForm,
								BusCoopForm busCoopForm, AprvHistory aprvHistory, AprvDoc aprvDoc) {
		
		System.out.println(aprvHistory.toString());
		System.out.println(aprvDoc.toString());
		
		aprvService.aprvReRequest(docType, outboxNo, leaveForm, cmtUpdateForm,
								busDraftForm, busCoopForm, aprvHistory, aprvDoc);
		
		return new Gson().toJson("success");
	}
	
	
	// 문서 타입 리스트 조회
	@ResponseBody
	@RequestMapping(value="selectDocTypeList.do", produces="application/json; charset=utf-8")
	public String selectDocTypeList() {
		
		ArrayList<DocType> list = aprvService.selectDocTypeList();
		
		return new Gson().toJson(list);
	}
	
	
	
	
	
	
	
	
	
	
	
}

