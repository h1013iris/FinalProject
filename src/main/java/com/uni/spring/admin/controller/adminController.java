package com.uni.spring.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.admin.model.dto.BanWords;
import com.uni.spring.admin.model.dto.BoardManagement;
import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.admin.model.dto.Job;
import com.uni.spring.admin.model.dto.MeetingRoomLargeCategory;
import com.uni.spring.admin.model.dto.employee;
import com.uni.spring.admin.model.dto.employeeAllInfo;
import com.uni.spring.admin.model.service.adminService;

@Controller
public class adminController {
	
	@Autowired
	private adminService adminservice;
	
	@RequestMapping("empManagement")
	public ModelAndView empmanagement(ModelAndView mv) {
		
		ArrayList<employee> list = adminservice.selectEmpAllList();
		
		mv.addObject("empList", list).setViewName("admin/empManagement");;
		
		return mv;
	}
	
	@RequestMapping("insertEmpPage")
	public String empInsertPage(Model model) {
		ArrayList<Department> deptList = adminservice.selectAllDeptList();
		ArrayList<Job> jobList = adminservice.selectAllJobList();
		
		model.addAttribute("jobList", jobList);
		model.addAttribute("deptList", deptList);
		return "admin/empInsertForm";
	}
	
	@ResponseBody
	@RequestMapping("insertEmp")
	public String insertEmp(employee emp) {
		System.out.println("controller"+emp);
		
		var emp_rnt= adminservice.insertEmp(emp);
		
		return String.valueOf(emp_rnt.getEmpNo());

	}
	
//	@RequestMapping("selectSort")
//	public String selectSort(int number, ModelAndView mv) {
//		System.out.println(number);
//		
//		ArrayList<employee> list = adminservice.selectSort(number);
//		
//		mv.addObject("empList",list).setViewName("admin/");;
//		
//		
//	}
	
	@RequestMapping("empDetailPage")
	public ModelAndView empDetailPage(String empNo, ModelAndView mv) {
		
		employeeAllInfo emp = adminservice.selectEmp(empNo);
		
		mv.addObject("emp", emp).setViewName("admin/empDetailPage");;
		
		return mv;
	}

	@RequestMapping("boardManagement")
	public String boardManagement(Model model){

		ArrayList<BoardManagement> list = adminservice.selectBoardAllList();
		
		model.addAttribute("list", list);

		return "admin/BoardManagement";
	}


	@ResponseBody
	@RequestMapping("BoardInsert")
	public void insertBoard(String text) {
		
		adminservice.insertBoard(text);
		
	}
	
	@ResponseBody
	@RequestMapping("BoardDelete")
	public void deleteBoard(String boardNo) {
		
		adminservice.deleteBoard(Integer.parseInt(boardNo));
		
	}
	
	@ResponseBody
	@RequestMapping("BoardUpdate")
	public void updateBoard(String text, String boardNo) {
		
		BoardManagement bm = new BoardManagement(Integer.parseInt(boardNo), text);
		
		
		adminservice.updateBoard(bm);
		
	}
	
	@RequestMapping("banWordsPage")
	public String BanWordsPage(Model model) {
		
		ArrayList<BanWords> list = adminservice.selectBanWordsAllList();
		
		model.addAttribute("list", list);
		
		return "admin/forbiddenWords";
	}
	
	@ResponseBody
	@RequestMapping("BanWordsInsert")
	public void insertBanWords(String words) {
		adminservice.insertBanWords(words);
	}
	
	@ResponseBody
	@RequestMapping("BanWordsDelete")
	public void deleteBanWords(String words) {
		System.out.println(words);
		adminservice.deleteBanWords(words);
	}
	
	@ResponseBody
	@RequestMapping("BanWordsUpdate")
	public void updateBanWords(BanWords bw) {
		adminservice.updateBanWords(bw);
	}
	
	@RequestMapping("meetingRoom")
	public String meetingRoom(Model model) {
		
		model.addAttribute("list", adminservice.selectMRAllList());
		
		return "admin/meetingRoomManagement";
	}
	
	@ResponseBody
	@RequestMapping("MRLCUpdate")
	public void updateMRLC(MeetingRoomLargeCategory MRLC) {
		adminservice.updateMRLC(MRLC);
	}
	
	@ResponseBody
	@RequestMapping("MRLCInsert")
	public void updateMRLC(String LRoomName) {
		adminservice.insertMRLC(LRoomName);
	}
	
	@ResponseBody
	@RequestMapping("MRLCDelete")
	public void deleteMRLC(String roomNoLarge) {
		adminservice.deleteMRLC(Integer.parseInt(roomNoLarge));
	}
	
}
