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
	@RequestMapping("free.do")
public String selectfreeList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {
		
		int listCount = BoardService.selecfreetListCount();
		System.out.println(listCount);
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Board> list = BoardService.selectfreeList(pi);
		
		System.out.println(list);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/freelist";
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
	
	@RequestMapping("enroll.do")
	public ModelAndView enroll(ModelAndView mv) {
		
		mv.setViewName("Board/enroll");
		
		return mv;
	}
	
	@RequestMapping("insertenroll.do")
	public String insertBoard(Board b , HttpServletRequest request) {
		
		

	    return "redirect:listBoard.do";
		
	}
	
	
}
