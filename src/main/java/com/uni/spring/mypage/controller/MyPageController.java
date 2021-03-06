package com.uni.spring.mypage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.uni.spring.admin.model.dto.employee;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.mypage.model.dto.Journal;
import com.uni.spring.mypage.model.dto.MyPage;
import com.uni.spring.mypage.model.dto.ToDoList;
import com.uni.spring.mypage.model.dto.WorkRequest;
import com.uni.spring.mypage.model.service.MyPageService;

@SessionAttributes("loginUser")
@Controller
public class MyPageController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MyPageService MPService;
	
	@RequestMapping("journalInsertPage")
	public String journalInsertPage() {
		return "mypage/dailyworklog";
	}
	
	@RequestMapping("journalInsert")
	public String InsertJournal(Journal journal, Model model) {
		MPService.InsertJournal(journal);
		
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		ArrayList<ToDoList> list = MPService.selectToDoAllList(empNo);
		
		model.addAttribute("list", list);
		
		return "mypage/ToDoList";
	}
	
	@RequestMapping("journalList")
	public ModelAndView journalList(ModelAndView mv, Model model) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		ArrayList<Journal> list = MPService.selectJournalList(empNo);
		
		mv.addObject("list", list).setViewName("mypage/journalList");
		
		return mv;
	}
	
	@RequestMapping("detailJournal")
	public String selectJournal(Model model, int journalNo) {
		Journal journal = MPService.selectJournal(journalNo);
		
		model.addAttribute("journal", journal);
		
		return "mypage/detailJournal";
	}
	
	@RequestMapping("selectJournal")
	public String selectUpdateJournal(Model model, int journalNo) {
		Journal journal = MPService.selectJournal(journalNo);
		
		model.addAttribute("journal", journal);
		
		return "mypage/updateJournal";
	}
	
	@RequestMapping("deleteJournal")
	public ModelAndView deleteJournal(Model model, ModelAndView mv, int journalNo) {
		MPService.deleteJournal(journalNo);
		
		Member member = (Member) model.getAttribute("loginUser");
		int empNo = member.getEmpNo();
		ArrayList<Journal> list = MPService.selectJournalList(empNo);
		
		mv.addObject("list", list).setViewName("mypage/journalList");
		
		return mv;
	}
	
	@RequestMapping("journalUpdate")
	public String updateJournal(Model model, Journal jour) {
		MPService.updateJournal(jour);
		
		Journal journal = MPService.selectJournal(jour.getJournalNo());
		
		model.addAttribute("journal", journal);
		
		return "mypage/detailJournal";
	}
	
	@ResponseBody
	@RequestMapping("searchDateFrom")
	public String searchDateFrom(String fromDate, String toDate , Model model) {
		
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		Journal journal = new Journal();
		
		journal.setEmpNo(empNo);
		journal.setFromDate(fromDate);
		journal.setToDate(toDate);
		
		System.out.println(journal);
		
		ArrayList<Journal> list = MPService.searchDateFrom(journal);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
		
	}
	
	@RequestMapping("myBusinessCard")
	public String myBusinessCard(Model model) {
		
		return "mypage/businessCard";
	}
	
	@RequestMapping("ToDoListPage")
	public String myToDoListPage(Model model) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		ArrayList<ToDoList> list = MPService.selectToDoAllList(empNo);
		
		model.addAttribute("list", list);
		
		return "mypage/ToDoList";
	}
	
	@ResponseBody
	@RequestMapping(value="todolistInsert",produces = "application/text;charset=utf8")
	public String insertTodolist(Model model, ToDoList toList) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();

		toList.setEmpNo(empNo);
		MPService.insertTodolist(toList);
		
		
		return "ToDoList ?????? ??????";
	}
	
	@ResponseBody
	@RequestMapping("updateToDoList")
	public void updateToDoList(ToDoList toList) {
		MPService.updateToDoList(toList);
	}
	
	@ResponseBody
	@RequestMapping("selectToDoList")
	public String selectToDoList(int listNo) {
		
		ToDoList toList = MPService.selectToDoList(listNo);
		
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(toList);
	}
	
	@ResponseBody
	@RequestMapping(value="todolistUpdate", produces="application/text;charset=utf8")
	public String updateToDoListContent(ToDoList toList) {
		MPService.updateToDoListContent(toList);
		
		return "ToDoList ?????? ??????";
	}
	
	@ResponseBody
	@RequestMapping("todoDateSelectList")
	public String todoDateSelectList(ToDoList toList, Model model) {
		Member member = (Member) model.getAttribute("loginUser");
		int empNo = member.getEmpNo();
		
		toList.setEmpNo(empNo);
		
		ArrayList<ToDoList> list = MPService.todoDateSelectList(toList);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("selectRequestEmpSearch")
	public String selectRequestEmpSearch(int[] checkval) {
		
		ArrayList<employee> list = MPService.selectRequestEmpSearch(checkval);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("EmpSelectAllList")
	public String EmpSelectAllList() {
		
		ArrayList<employee> list = MPService.EmpSelectAllList();
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("insertWorkRequest")
	public void insertWorkRequest(WorkRequest wr, Model model) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		wr.setEmpNo(empNo);
		System.out.println(wr.getEStatus());
		MPService.insertWorkRequest(wr);
	}
	
	@RequestMapping("workreceivedPage")
	public String workreceivedPage(Model model) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		ArrayList<WorkRequest> list = MPService.selectWorkReceivedList(empNo);
		
		model.addAttribute("list", list);
		
		return "mypage/workReceived";
	}
	
	@RequestMapping("requestWorkList")
	public String requestWorkList(Model model) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		ArrayList<WorkRequest> list = MPService.selectrequestWorkList(empNo);
		
		model.addAttribute("list", list);
		
		return "mypage/requestWorkList";
	}
	
	@RequestMapping("workDetailPage")
	public String workDetailPage(String raskNo, Model model) {
		WorkRequest wr = MPService.selectworkDetail(raskNo);
		
		model.addAttribute("work", wr);
		
		return "mypage/workRequestDetailPage";
	}
	
	@RequestMapping("workRequestDetailPage")
	public String workRequestDetailPage(String raskNo, Model model) {
		WorkRequest wr = MPService.selectworkRequestDetail(raskNo);
		ArrayList<employee> empList = MPService.selectWorkEmpList(raskNo);
		
		model.addAttribute("work", wr);
		model.addAttribute("empList", empList);
		
		return "mypage/workDetailPage";
	}
	
	@ResponseBody
	@RequestMapping("updateRequestStatus")
	public void updateRequestStatus(String raskNo) {
		MPService.updateRequestStatus(raskNo);
	}
	
	@RequestMapping("mypageManagement")
	public String selectMyPageList(Model model) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		ArrayList<MyPage> insertList = MPService.selectMyPageInsertList(empNo);
		ArrayList<MyPage> deleteList = MPService.selectMyPageDeleteList(empNo);
		
		model.addAttribute("insertList",insertList);
		model.addAttribute("deleteList",deleteList);
		
		return "mypage/favoritesPage";

	}
	
	@ResponseBody
	@RequestMapping("insertMypage")
	public void insertMypage(String pageNo, Model model) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();

		MyPage mp = new MyPage();
		mp.setPageNo(Integer.parseInt(pageNo));
		mp.setEmpNo(empNo);
		
		MPService.insertMypage(mp);
	}

	@ResponseBody
	@RequestMapping("deleteMypage")
	public void deleteMypage(String pageNo, Model model) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		MyPage mp = new MyPage();
		System.out.println("pageNo"+pageNo);
		mp.setPageNo(Integer.parseInt(pageNo));
		mp.setEmpNo(empNo);
		
		MPService.deleteMypage(mp);
	}
	
	@ResponseBody
	@RequestMapping("mypageListSelect")
	public String selectMypageList(Model model) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		ArrayList<MyPage> list = MPService.selectMyPageDeleteList(empNo);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	@RequestMapping("myinfoUpdate")
	public String updateMyInfo(Model model) {
		int empNo = ((Member) model.getAttribute("loginUser")).getEmpNo();
		
		employee emp = MPService.selectEmp(empNo);
		
		model.addAttribute("emp", emp);
		
		return "mypage/updateEmpPage";
	}
	
	@RequestMapping("updateEmployeemypage")
	public String updateEmployee(employee emp) {
		
		String encPwd = bCryptPasswordEncoder.encode(emp.getUserPwd());
		
		emp.setUserPwd(encPwd);
		System.out.println("================================================"+emp);
		MPService.updateEmployee(emp);
		
		return "redirect:ToDoListPage";
	}
	
}
