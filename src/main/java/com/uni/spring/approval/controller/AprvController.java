package com.uni.spring.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.AprvHistory;
import com.uni.spring.approval.model.dto.BusCoopForm;
import com.uni.spring.approval.model.dto.BusDraftForm;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.approval.model.service.AprvService;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.Pagination;
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
	public ModelAndView docEnrollForm(Integer docForm, String docTitle, String deptNo, ModelAndView mv) {
		
		//System.out.println("docForm ========" + docForm);
		//System.out.println("docTitle ========" + docTitle);
		//System.out.println("deptNo ===============" + deptNo);
		
		// 해당 부서 1차, 2차 결재자 조회해서 담기
		ArrayList<Member> approver = aprvService.selectApprover(deptNo);
				
		// 폼 유형, 문서 제목, 결재자 넘기기
		mv.addObject("docForm", docForm);
		mv.addObject("docTitle", docTitle);
		mv.addObject("approver", approver);
		mv.setViewName("approval/docEnrollForm");
		
		return mv;
	}
	
	
	// 휴가 신청서 등록
	@ResponseBody
	@RequestMapping(value="insertLeaveApp.do", produces="application/json; charset=utf-8")
	public String insertLeaveApp(AprvDoc aprvDoc, AprvHistory aprvHistory, LeaveForm leaveForm) {
		
		System.out.println("Dao ======= " + aprvDoc.toString());
		System.out.println("Dao ======= " + leaveForm.toString());
		System.out.println(aprvHistory.toString());
		
		// 결재 문서에 먼저 등록 -> 결재 기록에 등록
		aprvService.insertDoc(aprvDoc, aprvHistory);
		
		// 최종적으로 문서 서식 등록
		aprvService.insertLeaveApp(leaveForm);
		
		return new Gson().toJson("success");
	}
	
	
	// 근태 기록 수정 신청서 등록
	@RequestMapping("insertCmtUpdateApp.do")
	public ModelAndView insertCmtUpdateApp(CmtUpdateForm form, ModelAndView mv) {
		
		
		
		mv.setViewName("redirect:approvalMain.do");
		
		return mv;
	}
	
	
	// 업무 기안서 등록
	@RequestMapping("insertBusDraft.do")
	public ModelAndView insertBusDraft(BusDraftForm form, ModelAndView mv) {
		
		
		
		mv.setViewName("redirect:approvalMain.do");
		
		return mv;
	}
	
	
	// 업무 협조문 등록
	@RequestMapping("insertBusCoop.do")
	public ModelAndView insertBusCoop(BusCoopForm form, ModelAndView mv) {
		
		
		
		mv.setViewName("redirect:approvalMain.do");
		
		return mv;
	}
	
	
	
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
	
	
	
	@RequestMapping("outboxMain.do")
	public ModelAndView outboxMain(ModelAndView mv) {
		
		mv.setViewName("approval/documentForm/test");
		
		return mv;
	}
	
	
	
	@RequestMapping("requestMain.do")
	public ModelAndView requestMain(ModelAndView mv) {
		
		mv.setViewName("approval/request/requestMain");
		
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
