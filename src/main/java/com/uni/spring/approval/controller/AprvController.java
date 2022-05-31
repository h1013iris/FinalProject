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
	public ModelAndView docEnrollForm(Integer docForm, String docTitle, String deptNo, ModelAndView mv) {
		
		//System.out.println("docForm ========" + docForm);
		//System.out.println("docTitle ========" + docTitle);
		//System.out.println("deptNo ===============" + deptNo);
		
		// 폼 유형, 문서 제목, 결재자 넘기기 - 메소드 체이닝으로
		mv.addObject("docForm", docForm)
		.addObject("docTitle", docTitle)
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
	
	
	// 결재선 조회
	@ResponseBody
	@RequestMapping(value="selectApprover.do", produces="application/json; charset=utf-8")
	public String selectApprover(String deptNo) {
		
		// 해당 부서 1차, 2차 결재자 조회해서 담기
		ArrayList<Member> approver = aprvService.selectApprover(deptNo);
		
		return new Gson().toJson(approver);
	}
	
	
	// 휴가 신청서 등록
	@ResponseBody
	@RequestMapping(value="insertLeaveApp.do", produces="application/json; charset=utf-8")
	public String insertLeaveApp(AprvDoc aprvDoc, AprvHistory aprvHistory, LeaveForm leaveForm) {
		
		//System.out.println("Dao ======= " + aprvDoc.toString());
		//System.out.println("Dao ======= " + leaveForm.toString());
		//System.out.println(aprvHistory.toString());

		// 문서 서식 먼저 등록
		int result = aprvService.insertLeaveApp(leaveForm);
		
		// 결재 문서에 먼저 등록 -> 결재 기록에 등록
		if(result > 0) {
			aprvService.insertDoc(aprvDoc, aprvHistory);
			
			return new Gson().toJson("success");
		
		} else {
			return new Gson().toJson("fail");
		}
		
	}
	
	
	// 근태 기록 수정 신청서 등록
	@ResponseBody
	@RequestMapping(value="insertCmtUpdateApp.do", produces="application/json; charset=utf-8")
	public String insertCmtUpdateApp(AprvDoc aprvDoc, AprvHistory aprvHistory, CmtUpdateForm cmtUpdateForm) {

		// 문서 서식 먼저 등록
		int result = aprvService.insertCmtUpdateForm(cmtUpdateForm);
		
		// 결재 문서에 먼저 등록 -> 결재 기록에 등록
		if(result > 0) {
			aprvService.insertDoc(aprvDoc, aprvHistory);
			
			return new Gson().toJson("success");
		
		} else {
			return new Gson().toJson("fail");
		}
	}
	
	
	// 해당 날짜 근태 기록 조회
	@ResponseBody
	@RequestMapping(value="selectCmt.do", produces="application/json; charset=utf-8")
	public Model selectCmt(String userNo, String date, Model model) {
		
		// 근태 기록 객체에 유저 번호, 해당 날짜 담아서 넘기기
		AttendLog attendLog = new AttendLog();
		attendLog.setEmpNo(Integer.valueOf(userNo));
		attendLog.setAttendDate(Date.valueOf(date)); // String 을 Date로 형변환해서 set
		
		System.out.println("Controller =========" + attendLog.toString());
		
		// 회원의 해당 날짜 촐퇴근 시간을 근태 기록 객체에 담기
		AttendLog userAttendLog = aprvService.selectCmt(attendLog);
		
		System.out.println(userAttendLog.toString());
		
		model.addAttribute("userAttendLog", userAttendLog);
		
		return model;
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
