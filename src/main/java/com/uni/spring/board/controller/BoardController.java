package com.uni.spring.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@RequestMapping("notice.do")
	public ModelAndView notice(ModelAndView mv) {
		
		mv.setViewName("Board/noticelist");
		
		return mv;
	}
	@RequestMapping("enroll.do")
	public ModelAndView enroll(ModelAndView mv) {
		
		mv.setViewName("Board/enroll");
		
		return mv;
	}
}
