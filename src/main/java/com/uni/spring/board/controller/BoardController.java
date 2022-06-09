package com.uni.spring.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.coment;
import com.uni.spring.board.model.dto.pbox;
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
	public ModelAndView enroll(Board b ,ModelAndView mv) {

		mv.addObject("b" , b).setViewName("Board/enroll");

		return mv;
	}

	@RequestMapping("insertenroll.do")
	public String insertBoard(Board b ,pbox p,HttpServletRequest request ,@RequestParam("bo") int bo ,@RequestParam(value="deno",required = false ) int deno ,@RequestParam(value="save",required = false, defaultValue = "1") int save)  {
    
	    
		System.out.println(bo+"나는 게시판 번호");
		
		b.setContent(b.getContent().replaceAll("\n", "<br>"));
		
	    b.setBoardno(bo);
	    p.setBoardno(bo);
       
		System.out.println(b.toString());
		 
		System.out.println(deno+"나는 부서번호");
		
		if(save == 2) {
			System.out.println(b.toString());
			BoardService.saveboard(p);
						
			return "Board/noticelist";

		}else {
		BoardService.insertboard(b);
			
		if(bo == 1) {

			return "redirect:notice.do";
		}
		else if(bo == 2) {
		
			return "redirect:free.do";
		}	
		else if(bo == 3) {

			BoardService.insertdept(b,deno);
			return "redirect:depart.do";
		}

		return null;

		}

	}
//부서게시판
	//영업팀 기술지원팀 경영지원팀 
	@RequestMapping("depart.do")
	public String selectdepartList(@RequestParam(value="currentPage" , required = false , defaultValue = "1")int currentPage, Model model
			){
		
		
		int listCount = BoardService.selecdeparttListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

	
		
		
          
		ArrayList<Board> conditions =BoardService.selectdeptnameList();
		
		ArrayList<Board> list = new ArrayList<Board>();
				
		list = BoardService.selectdeptList(pi);

		
		
		System.out.println(list.toString());	
		model.addAttribute("list",list);
		model.addAttribute("conditions",conditions);
		model.addAttribute("pi",pi);
		return "Board/deptlist";
	}
	
	@RequestMapping("standup.do")
	public String standup(@RequestParam(value="currentPage" , required = false , defaultValue = "1")int currentPage, Model model
			,@RequestParam("con") int con ,@RequestParam("nold") String nold){

		System.out.println(con);
		System.out.println(nold);
		
		Board b = new Board();
		b.setDeptno(con);
		b.setStatus(nold);
		
		int listCount = BoardService.selectstandupListCount(con);
		System.out.println(listCount);
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
       
		ArrayList<Board> conditions =BoardService.selectdeptnameList();
		
		ArrayList<Board> list = new ArrayList<Board>();
				
		list = BoardService.selectstandupList(pi,b);

		
		
		System.out.println(list.toString());		
		model.addAttribute("list",list);
		model.addAttribute("conditions",conditions);
		model.addAttribute("pi",pi);
		model.addAttribute("con",con);
		model.addAttribute("nold",nold);
		return "Board/deptlist";
	
	
	}
	
	
	@RequestMapping("detailBoard.do")
    public ModelAndView selectBoard(int bno ,int uno,ModelAndView mv ) {
		
		
		System.out.println(bno+"나는비앤오");
		/*Board a = new Board();
		a.setWriteno(bno);	*/
		
		Board bo= new Board();
		bo.setWriteno(bno);
		bo.setEmpno(uno);
		BoardService.insertuser(bo);
		
		Board b = BoardService.detailBoard(bno);
		
		mv.addObject("b" , b).setViewName("Board/boarddetail");
			    
	
		return mv;

	
	}
	@ResponseBody
	@RequestMapping(value = "insertcontent.do", produces="application/json; charset =utf-8")
       public String insertReply(coment r ) {
		
		int result = BoardService.insertReply(r);
		
		return String.valueOf(result);
		
		}
	@ResponseBody
	@RequestMapping(value = "listcoment.do" , produces="application/json; charset =utf-8") 
	public String selectReplyList(int bno) {
		
		ArrayList<coment> list = BoardService.selectcomentList(bno);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list); 
		
	}
	
	@RequestMapping("deletecoment.do")
    public ModelAndView deletecoment(int cno, int bno , ModelAndView mv) {
		
		System.out.println(cno + "나는 cno야");
		
		int result = BoardService.deletecoment(cno);
		
		if(result>0) {
			mv.addObject("bno", bno).setViewName("redirect:detailBoard.do");
		}else {
			mv.addObject("msg","댓글 삭제 실패").addObject("msgTitle", "댓글 삭제").setViewName("common/alert");
		}
		
		return mv;
	}   	
	
	@RequestMapping("updateFormBoard.do") 
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		
		mv.addObject("b" , BoardService.detailBoard(bno)) 
		.setViewName("Board/boardupdate"); 
		
	
		
		return mv;
	}
	
	@RequestMapping("updateboard.do")
	public ModelAndView updatedetail(Board b , ModelAndView mv, HttpServletRequest request) {
		
		BoardService.updatedetail(b);
		
		System.out.println(b.getContent()+"이거도");
		System.out.println(b.getWriteno()+"이거이거");
		
		mv.addObject("bno",b.getWriteno()).addObject("uno",b.getEmpno()).setViewName("redirect:detailBoard.do");
		return mv;
	}

		@RequestMapping("deleteBoard.do")
		public String deleteBoard(int bno, int boardno,String fileName, HttpServletRequest request) {
			
			BoardService.deleteBoard(bno); //지울 게시물 번호를 가져와서 지우기
			
			if(boardno == 1) {
				return "redirect:notice.do";
			}else if(boardno == 2) {
				return "redirect:free.do";
			}else if(boardno == 3) {
				return "redirect:depart.do";
			}else {
				return "null";
			}
			
			
		}
		//임시보관함
		@RequestMapping("pbox.do")
       public String selectpbox(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model
    		   ,@RequestParam("userno") int userno) {
			
			System.out.println(userno+"나는 유저넘버");
			
			int listCount = BoardService.selectpboxCount(userno);
			System.out.println(listCount);


			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

			ArrayList<Board> list = BoardService.selectpbox(pi,userno);

			System.out.println(list);

			model.addAttribute("list",list);
			model.addAttribute("pi",pi);
			return "Board/pbox";
		}
       @RequestMapping("detailpbox.do")
       public ModelAndView detailpbox(int pno, ModelAndView mv ) {
   		
   		
   		System.out.println(pno+"나는피앤오");
   		
   		
   		pbox p = BoardService.detailpbox(pno);
   		
   		mv.addObject("p" , p).setViewName("Board/pboxdetail");
   		
   		return mv;

   	
   	}
        
        @RequestMapping("deletepbox.do")
        public String deletepbox(int pno, String fileName, HttpServletRequest request) {
        
         BoardService.deletepbox(pno);
        	
        return "redirect:pbox.do";
        }
        @ResponseBody
        @RequestMapping(value="readuser.do" ,produces="application/json; charset=utf-8")
        public String readuser(Model model,int wno) {
        	
        	System.out.println(wno+"나는wno");

    		ArrayList<Board> list = BoardService.readuser(wno);

    		System.out.println(list);

    		
    		return new GsonBuilder().create().toJson(list);
        	
        
}
}