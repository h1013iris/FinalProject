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
import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.AprvHistory;
import com.uni.spring.approval.model.dto.BusCoopForm;
import com.uni.spring.approval.model.dto.BusDraftForm;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.approval.model.service.AprvService;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.Pagination;
import com.uni.spring.department.model.dto.AttendLog;
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
	public String selectDeptApprover(String deptNo) {
		
		// 해당 부서 1차, 2차 결재자 조회해서 담기
		ArrayList<Member> approver = aprvService.selectDeptApprover(deptNo);
		
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
	public String selectDeptList() {
		
		ArrayList<Department> list = aprvService.selectDeptList();
		
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
	
	
	
	@RequestMapping("outboxMain.do")
	public ModelAndView outboxMain(ModelAndView mv) {
		
		
		
		mv.setViewName("approval/documentForm/test");
		
		return mv;
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
	public String requestList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Member loginUser, Model model) {
		
		System.out.println("controller ===========" + loginUser.toString());
		
		int listCount = aprvService.requestListCount(loginUser);
		System.out.println("listCount ======== " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<AprvDoc> list = aprvService.selectRequestList(pi, loginUser);
		
		return new Gson().toJson(list);
	}
	
	
	
	// 문서 상세 조회
	@RequestMapping("requestDetail.do")
	public ModelAndView detailRequestDoc(int docNo, ModelAndView mv) {
		
		// 해당 문서의 서식 번호 가져오기
		int docType = aprvService.selectDocTypeNo(docNo);
		
		mv.addObject("docNo", docNo)
		.addObject("docType", docType)
		.setViewName("approval/request/requestDetailView");
		
		return mv;
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
		
		return new Gson().toJson(leaveForm);
	}
	
	
	
	// 결재완료 리스트
	@RequestMapping("completeMain.do")
	public ModelAndView completeMain(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, ModelAndView mv) {
		
		// @RequestParam(value="currentPage") int currentPage : 값이 넘어오지 않아서 에러
		// @RequestParam(value="currentPage", required = false) int currentPage
		
		// required : 해당 파라미터 필수 여부 확인 (true면 필수)
		// required = false 값을 꼭 받아 줄 필요가 없다고 선언. 그래서 null이 들어올 수 있음
		// -> null 은 기본형 int에 들어갈 수 없기 때문에 에러 발생
		
		// defaultValue : 넘어오는 값이 null인 경우 해당 파라미터 기본값 지정
		
		int listCount = aprvService.completeListCount();
		System.out.println("listCount ======== " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<AprvDoc> list = aprvService.completeSelectList(pi);
		
		mv.addObject("list", list);
		mv.setViewName("approval/complete/completeMain");
		
		return mv;
	}
		
	
	
	@RequestMapping("returnMain.do")
	public ModelAndView returnMain(ModelAndView mv) {
		
		mv.setViewName("approval/return/returnMain");
		
		return mv;
	}
	
	
	
	@RequestMapping("statusMain.do")
	public ModelAndView statusMain(ModelAndView mv) {
		
		mv.setViewName("approval/status/statusMain");
		
		return mv;
	}
	
	
	
	@RequestMapping("waitingMain.do")
	public ModelAndView waitingMain(ModelAndView mv) {
		
		mv.setViewName("approval/waiting/waitingMain");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
