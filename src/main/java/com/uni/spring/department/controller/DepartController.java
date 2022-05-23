package com.uni.spring.department.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.uni.spring.department.model.service.DepartService;

@Controller
public class DepartController {

	@Autowired
	public DepartService departService;
	
	//공지사항 등록하러 화면 전환
	@RequestMapping("enrollFormAnnoDepart.do")
	public String enrollForm() {
		return "depart/annoDepartEnrollForm";
	}
	
	
}
