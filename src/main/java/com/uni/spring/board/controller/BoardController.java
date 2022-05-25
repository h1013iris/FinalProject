package com.uni.spring.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.board.model.dto.Board;
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
	
	
	
	@RequestMapping("enroll.do")
	public ModelAndView enroll(ModelAndView mv) {
		
		mv.setViewName("Board/enroll");
		
		return mv;
	}
	
}
