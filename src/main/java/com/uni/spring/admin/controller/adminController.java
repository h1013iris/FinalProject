package com.uni.spring.admin.controller;

import java.net.http.HttpHeaders;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.admin.model.dto.Job;
import com.uni.spring.admin.model.dto.employee;
import com.uni.spring.admin.model.service.adminService;

@Controller
public class adminController {
	
	@Autowired
	private adminService adminservice;
	
	@RequestMapping("empManagement")
	public String empmanagement() {
		return "admin/empManagement";
	}
	
	@RequestMapping("insertemp")
	public String empInsertPage(Model model) {
		ArrayList<Department> deptList = adminservice.selectAllDeptList();
		ArrayList<Job> jobList = adminservice.selectAllJobList();
		
		model.addAttribute("jobList", jobList);
		model.addAttribute("deptList", deptList);
		return "admin/empInsertForm";
	}
	
	@RequestMapping("insertEmp")
	public String insertEmp(employee emp, Model model) {
		System.out.println(emp);
		
		employee empInfo = adminservice.insertEmp(emp);
		
		model.addAttribute("empInfo", empInfo);
		
		return "admin/empInsertSuccess";
		
	}
	
//	@RequestMapping("smsSendRequest")
//	public String smsSendRequest(String empNo, String empName, String phone) {
//        // 헤더 설정값 세팅
//        
//
//	}

}
