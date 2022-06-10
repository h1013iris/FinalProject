package com.uni.spring.manageMent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uni.spring.manageMent.model.service.ManageService;

@Controller
public class ManageController {

	@Autowired
	public ManageService manageService;
	
	//header에서 경영 메인으로 
	@RequestMapping("manangeMain.do")
	public String manangeMain() {
		return "manage/manageMain";
	}
}
