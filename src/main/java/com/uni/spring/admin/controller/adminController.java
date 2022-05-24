package com.uni.spring.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
	@RequestMapping("empManagement")
	public String empmanagement() {
		return "admin/empManagement";
	}

}
