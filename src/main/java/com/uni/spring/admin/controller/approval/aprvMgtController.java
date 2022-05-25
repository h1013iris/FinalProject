package com.uni.spring.admin.controller.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.admin.model.service.approval.AprvMgtService;

@Controller
public class aprvMgtController {

	@Autowired
	public AprvMgtService aprvMgtService;
	
	
	@RequestMapping("securityMain.do")
	public ModelAndView securityMgtMain(ModelAndView mv) {
		
		mv.setViewName("admin/approval/securityMgtMain");
		
		return mv;
	}
	
	@RequestMapping("formMgtMain.do")
	public ModelAndView formMgtMain(ModelAndView mv) {
		
		mv.setViewName("admin/approval/formMgtMain");
		
		return mv;
	}
}
