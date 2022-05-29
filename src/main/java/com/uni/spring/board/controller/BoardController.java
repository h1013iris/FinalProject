package com.uni.spring.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.searchcon;
import com.uni.spring.board.model.service.BoardService;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.Pagination;

@Controller
public class BoardController {

	@Autowired
	public BoardService BoardService;

	//notice
	@RequestMapping("notice.do")
	public String selectList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

		int listCount = BoardService.selectListCount();
		System.out.println(listCount);


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = BoardService.selectList(pi);

		System.out.println(list);

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/noticelist";
	}
	@RequestMapping("noticeold.do")
	public String selectoldList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

		int listCount = BoardService.selectListCount();
		System.out.println(listCount);


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = BoardService.selectoldList(pi);

		System.out.println(list);

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/noticelist";
	}
	@RequestMapping("searchBoard.do")
	public String search(@RequestParam(value="currentPage" , required = false , defaultValue = "1")int currentPage
			,@RequestParam("condition") String condition , @RequestParam("search") String search,searchcon sc, Model model) {


		switch(condition) { //선택한거 넘겨주기
		case "content" : 
			sc.setContent(search);
			break;
		case "title" : 
			sc.setTitle(search);
			break;
		}
		int listCount = BoardService.selectsearchnotiCount(sc);
		System.out.println(listCount);


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = BoardService.selectsearchnoti(pi,sc);

		System.out.println(list);

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		model.addAttribute("search",search);
		model.addAttribute("condition",condition);

		return "Board/noticelist";
	}

	//freeboard
	@RequestMapping("free.do")
	public String selectfreeList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

		int listCount = BoardService.selecfreetListCount();
		System.out.println(listCount);


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = BoardService.selectfreeList(pi);

		System.out.println(list.toString());

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/freelist";
	}
	@RequestMapping("freeold.do")
	public String selectfreeoldList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

		int listCount = BoardService.selectListCount();
		System.out.println(listCount);


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = BoardService.selectfreeoldList(pi);

		System.out.println(list);

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/freelist";
	}
	@RequestMapping("searchfree.do")
	public String searchfree(@RequestParam(value="currentPage" , required = false , defaultValue = "1")int currentPage
			,@RequestParam("condition") String condition , @RequestParam("search") String search,searchcon sc, Model model) {


		switch(condition) { //선택한거 넘겨주기
		case "content" : 
			sc.setContent(search);
			break;
		case "title" : 
			sc.setTitle(search);
			break;
		}
		int listCount = BoardService.selectsearchfreeCount(sc);
		System.out.println(listCount);


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = BoardService.selectsearchfree(pi,sc);

		System.out.println(list);

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		model.addAttribute("search",search);
		model.addAttribute("condition",condition);

		return "Board/freelist";
	}

	//글작성
	@RequestMapping("enroll.do")
	public ModelAndView enroll(ModelAndView mv) {

		mv.setViewName("Board/enroll");

		return mv;
	}

	@RequestMapping("insertenroll.do")
	public String insertBoard(Board b , HttpServletRequest request ,@RequestParam("bo") int bo)  {

	

		System.out.println(b.toString());

		if(bo == 1) {
			BoardService.insertnotice(b);


			return "redirect:notice.do";
		}
		else if(bo == 2) {
			BoardService.insertfree(b);


			return "redirect:free.do";
		}

		return null;



	}
//부서게시판
	//영업팀 기술지원팀 경영지원팀 
	@RequestMapping("depart.do")
	public String selectdepartList(@RequestParam(value="currentPage" , required = false , defaultValue = "1")int currentPage, Model model,
		@RequestParam(required = false, value="old")String old, @RequestParam(required = false, value="dpt")String dpt){
		
		System.out.println(dpt);
		System.out.println(old);
		int listCount = BoardService.selecdeparttListCount();
		System.out.println(listCount);

		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		int de = 0;
		if(dpt != null) {
			if(dpt.equals("영업팀")) {
				de = 1;
			}else if (dpt.equals("기술 지원팀")){
				de = 2;
			}else if (dpt.equals("경영 지원팀")) {
				de=3;
			}
		}
		
          System.out.println(de+"나는 부서");
		ArrayList<Board> conditions =BoardService.selectdeptnameList();
		
		ArrayList<Board> list = new ArrayList<Board>();
		if(old != null) {
			if(de == 1 || old.equals("오래된순")) {			
				list = BoardService.selectdeoldList(pi ,de);

			}else if(de == 1 || old.equals("최신순")){
				list = BoardService.selectdepartList(pi);
			}
			if(de == 2 || old.equals("오래된순")) {						
				list = BoardService.selectdeoldList(pi ,de);
			}else if (de == 2 || old.equals("최신순")){
				list = BoardService.selectoperList(pi);
			}
			if(de == 3 || old.equals("오래된순")) {						
				list = BoardService.selectdeoldList(pi ,de);
			}else if(de == 3 || old.equals("최신순")){
				list = BoardService.selecttecList(pi);
			}
		}
		
		System.out.println(list.toString());
		model.addAttribute("condition", "최신순");
		model.addAttribute("list",list);
		model.addAttribute("conditions",conditions);
		model.addAttribute("pi",pi);
		return "Board/deptlist";
	}
	@RequestMapping("tec.do")
	public String selecttecList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

		int listCount = BoardService.selecttectListCount();
		System.out.println(listCount);


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = BoardService.selecttecList(pi);

		System.out.println(list.toString());
		model.addAttribute("condition", "최신순");
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/deptlist";
	}
	@RequestMapping("oper.do")
	public String selectoperList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

		int listCount = BoardService.selectoperListCount();
		System.out.println(listCount);


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = BoardService.selectoperList(pi);

		System.out.println(list.toString());
		model.addAttribute("condition", "최신순");
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/deptlist";
	}
	@RequestMapping("departold.do")
	public String selectdepartoldList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model, @RequestParam(required=false, value="de")int de) {

		int listCount = BoardService.selectdeoldCount();
		System.out.println(listCount);


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = BoardService.selectdeoldList(pi ,de);

		System.out.println(list);		
		model.addAttribute("condition", "오래된순");
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/deptlist";
	}
	
	}


