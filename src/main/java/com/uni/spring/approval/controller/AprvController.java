package com.uni.spring.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.approval.model.service.AprvService;

@Controller // 가장 먼저 어노테이션으로 등록
public class AprvController {
	
	@Autowired
	public AprvService aprvService;
	
	
	
	@RequestMapping("apprvalMain.do")
	public ModelAndView apprvalMain(ModelAndView mv) {
		
		mv.setViewName("approval/approvalMain");
		
		return mv;
	}
	
	
	
	@RequestMapping("completeMain.do")
	public ModelAndView completeMain(ModelAndView mv) {
		
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
