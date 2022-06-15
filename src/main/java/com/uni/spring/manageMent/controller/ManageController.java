package com.uni.spring.manageMent.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.admin.model.dto.employeeAllInfo;
import com.uni.spring.admin.model.service.adminService;
import com.uni.spring.common.Attachment;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.department.model.dto.DepartmentAnno;
import com.uni.spring.department.model.dto.Project;
import com.uni.spring.department.model.service.DepartService;
import com.uni.spring.manageMent.model.dto.calculateSalary;
import com.uni.spring.manageMent.model.dto.calendarWeek;
import com.uni.spring.manageMent.model.dto.manageDepart;
import com.uni.spring.manageMent.model.service.ManageService;
import com.uni.spring.member.model.dto.Member;

@Controller
public class ManageController {

	@Autowired
	public ManageService manageService;
	
	@Autowired
	public DepartService departService;
	
	@Autowired
	public adminService adminService;
	
	//header에서 경영 메인으로 
	@RequestMapping("manangeMain.do")
	public ModelAndView manangeMain(int userNo,String departmentNo, ModelAndView mv) {
		ArrayList<DepartmentAnno> dlist = departService.selectAnnoDepartListMain(Integer.parseInt(departmentNo));//부서 공지사항 5개
		ArrayList<Department> dplist = adminService.selectAllDeptList();
		calendarWeek cw = new calendarWeek().selectThisWeek();
		ArrayList<AttendLog> al = manageService.selectListAttendLog(cw);
		ArrayList<AttendLog> att = new ArrayList<AttendLog>();
		for (AttendLog at : al) {
			att.add(new AttendLog().attendList(at));
		}
		System.out.println(al);
		mv.addObject("dplist",dplist).addObject("dlist", dlist).addObject("cw",cw).addObject("att",att).setViewName("manage/manageMain");
		return mv;
	}
	
	@RequestMapping("selectDepartInfo.do")
	public String selectDepartInfo(Department d, Model model) {
		ArrayList<Member> mlist = manageService.selectDepartInfo(d);
		ArrayList<Department> dplist = adminService.selectAllDeptList();
		model.addAttribute("d",d);
		model.addAttribute("dplist", dplist);
		model.addAttribute("mlist", mlist);
		return "manage/departInfoListView";
	}
	
	@ResponseBody
	@RequestMapping(value="filterCheck.do", produces="application/json; charset=utf-8")
	public String selectInfofilter(manageDepart md, Model model) {
		ArrayList<Member> list = manageService.selectInfofilter(md);
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	@RequestMapping("detailInfoMem.do")
	public ModelAndView selectInfoEmployee(String empNo, ModelAndView mv) {
		employeeAllInfo emp = adminService.selectEmp(empNo);
		Attachment a = manageService.selectInfoEmployeeAtt(empNo);
		ArrayList<Project> p = manageService.selectListProject(empNo);
		mv.addObject("emp",emp).addObject("a",a).addObject("p",p).setViewName("manage/detailInfoEmployee");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="calculateSalary.do", produces="application/json; charset=utf-8")
	public String calculateSalary(int salary) {
		int count = manageService.countSelect();//사원수
		calculateSalary cs = new calculateSalary().calcugukmin(salary, count);
		return new Gson().toJson(cs);
	}
	
	@ResponseBody
	@RequestMapping(value="filterCheckMianPage.do", produces="application/json; charset=utf-8")
	public String selectFilterInfo(manageDepart md) {
		calendarWeek cw = new calendarWeek().selectThisWeek();
		md.setWeeko(cw.getWeeko());md.setWeekt(cw.getWeekt()); md.setWeekh(cw.getWeekh());
		md.setWeeku(cw.getWeeku()); md.setWeekf(cw.getWeekf());
		ArrayList<AttendLog> al = manageService.selectFilterInfo(md);
		ArrayList<AttendLog> list = new ArrayList<AttendLog>();
		for (AttendLog at : al) {
			list.add(new AttendLog().attendList(at));
		}
		return new Gson().toJson(list);
	}
	
	@RequestMapping("selectListDepartInfo.do")
	public ModelAndView selectListDepartInfo(int deptNo, ModelAndView mv ) {
		String fd = manageService.selectFirstday();//이번달 주 월요일들 모음
		System.out.println(fd);
		calendarWeek cw = new calendarWeek().changeList(fd);
		System.out.println(cw);
		ArrayList<AttendLog> list = manageService.selectAttendAvg(cw);
		System.out.println(list);//성공
		ArrayList<AttendLog> att = new ArrayList<AttendLog>();
		for (AttendLog at : list) {
			att.add(new AttendLog().attendAVGLIST(at));
		}
		System.out.println(att);
		ArrayList<Department> dplist = adminService.selectAllDeptList();
		calendarWeek cw2 = new calendarWeek().selectThisWeek();
		ArrayList<AttendLog> al = manageService.selectListAttendLogAVG(cw2);
		
		ArrayList<AttendLog> att2 = new ArrayList<AttendLog>();
		for (AttendLog at : al) {
			att2.add(new AttendLog().attendAVGLISTAV(at));
		}
		System.out.println(att2);
		mv.addObject("att",att).addObject("dplist",dplist).addObject("att2", att2).setViewName("manage/attendlogListView");
		return mv;
	}
	
	@RequestMapping("selectDetailAttendLog.do")
	public ModelAndView selectDetailAttendLog(int empNo, ModelAndView mv) {
		//가져와야 할 것 
		//부서, 직급, 이름, 이번주 누적, 월별 누적
		//주차별 업무 시작 종료 근무시간나오는 리스트 
		String fd = manageService.selectFirstday();//이번달 주 월요일들 모음
		System.out.println(fd);
		calendarWeek cw = new calendarWeek().changeList(fd);//주 가져오
		System.out.println(cw);
		cw.setEmpNo(empNo);//넘버 같이 보내주기 
		ArrayList<AttendLog> list = manageService.selectAttendAvg(cw);//평균들 
		System.out.println(list);//성공
		AttendLog att = new AttendLog();
		for (AttendLog at : list) {
			att = new AttendLog().attendAVGLIST(at);
		}
		System.out.println("개인?!?!"+att);//성공함
		ArrayList<Department> dplist = adminService.selectAllDeptList();
		calendarWeek cw2 = new calendarWeek().selectThisWeek();
		cw2.setEmpNo(empNo);//넘버 같이 보내주기 
		ArrayList<AttendLog> al = manageService.selectListAttendLogAVG(cw2);
		AttendLog att2 = new AttendLog();
		for (AttendLog at : al) {
			att2 =new AttendLog().attendAVGLISTAV(at);
		}
		System.out.println(att2);//성공인지 확인하기 
		mv.addObject("att",att).addObject("att2",att2).setViewName("manage/detailAttendLogView");
		return mv;
	}
}
