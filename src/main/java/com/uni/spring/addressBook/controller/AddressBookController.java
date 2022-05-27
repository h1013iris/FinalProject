package com.uni.spring.addressBook.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.addressBook.model.service.AddressBookService;
import com.uni.spring.member.model.dto.WideMember;

@Controller
public class AddressBookController {
	
	@Autowired 
	public AddressBookService addressBookService;

	//전체주소록 조회
/*	@GetMapping("addressMain.do")
	public String mainAddress(WideMember wm, Model model) {
		
		ArrayList<WideMember> allAddList = addressBookService.selectAllAddList(wm);
		System.out.println("조회결과:"+allAddList);
		
		model.addAttribute("allAddList",allAddList);
		
		return "addressBook/mainAdd";

	
	}
	*///두개 합쳐보기
	@GetMapping("addressMain.do")
	public String mainAddress(WideMember wm, Dept dp, Model model) {
		
		ArrayList<WideMember> allAddList = addressBookService.selectAllAddList(wm);
		
		System.out.println("주소록 전체내용 조회결과:"+allAddList);
		
		ArrayList<Dept> deptTitleList = addressBookService.selectDeptTitleList(dp);

		System.out.println("부서명 조회결과:"+deptTitleList);
		
		model.addAttribute("allAddList",allAddList);
		model.addAttribute("deptTitlList",deptTitleList);

		return "addressBook/mainAdd";
	}
	/*@GetMapping("addressMain.do")
	public String selsectDeptTitle(Department dp, Model model) {
		
		ArrayList<Department> deptTitleList = addressBookService.selectDeptTitleList(dp);

		System.out.println("조회결과:"+deptTitleList);
		
		model.addAttribute("deptTitlList",deptTitleList);
		
		return "addressBook/mainAdd";


	}*/
}
