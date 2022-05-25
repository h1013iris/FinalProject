package com.uni.spring.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.service.AprvService;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.Pagination;

@Controller // 가장 먼저 어노테이션으로 등록
public class AprvController {
	
	@Autowired
	public AprvService aprvService;
	
	
	
	@RequestMapping("approvalMain.do")
	public ModelAndView apprvalMain(ModelAndView mv) {
		
		mv.setViewName("approval/approvalMain");
		
		return mv;
	}
	
	
	
	@RequestMapping("docEnrollForm.do")
	public ModelAndView docEnrollForm(int docForm, String docTitle, ModelAndView mv) {
		
		//System.out.println("docForm ========" + docForm);
		//System.out.println("docTitle ========" + docTitle);
		
		mv.addObject("docForm", docForm);
		mv.addObject("docTitle", docTitle);
		mv.setViewName("approval/docEnrollForm");
		
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
		
		int listCount = aprvService.selectListCount();
		System.out.println("listCount ======== " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<AprvDoc> list = aprvService.selectList(pi);
		
		mv.addObject("list", list);
		mv.setViewName("approval/complete/completeMain");
		
		return mv;
	}
	
	
	
	@RequestMapping("outboxMain.do")
	public ModelAndView outboxMain(ModelAndView mv) {
		
		mv.setViewName("approval/outbox/outboxMain");
		
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
