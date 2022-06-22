package com.uni.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.Part;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.coment;
import com.uni.spring.board.model.dto.pbox;
import com.uni.spring.board.model.dto.searchcon;
import com.uni.spring.board.model.service.BoardService;
import com.uni.spring.common.Attachment;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.Pagination;
import com.uni.spring.common.exception.CommException;

@Controller
public class BoardController {

	@Autowired
	public BoardService BoardService;

	//notice
	@RequestMapping("notice.do")
	public String selectList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

		int listCount = BoardService.selectListCount();
		


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

		ArrayList<Board> list = BoardService.selectList(pi);

		

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/noticelist";
	}
	@RequestMapping("noticeold.do")
	public String selectoldList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

		int listCount = BoardService.selectListCount();
		


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

		ArrayList<Board> list = BoardService.selectoldList(pi);

		

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/noticelist";
	}
	@RequestMapping("searchBoard.do")
	public String search(@RequestParam(value="currentPage" , required = false , defaultValue = "1")int currentPage
			,@RequestParam("condition") String condition , @RequestParam("search") String search,Board b,int cfbo, Model model
			,@RequestParam(value="userdept" , required = false, defaultValue = "0") int userdept) {


		switch(condition) { //선택한거 넘겨주기
		case "content" : 
			b.setContent(search);
			break;
		case "title" : 
			b.setTitle(search);
			break;
		}
		b.setBoardno(cfbo);
		b.setDeptno(userdept);
		
		
		
		int listCount = BoardService.selectsearchboardCount(b);
		
		ArrayList<Board> conditions =BoardService.selectdeptnameList();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

		ArrayList<Board> list = BoardService.selectsearchboard(pi,b);

		

		int con = b.getDeptno();
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		model.addAttribute("search",search);
		model.addAttribute("condition",condition);
		model.addAttribute("conditions",conditions);
		model.addAttribute("con",con);
        if(cfbo == 1) {
		return "Board/noticelist";
		
        }else if(cfbo == 2){
        	return "Board/freelist";
        }else if(cfbo == 3){           		
        	return "Board/deptlist";
        }else if(cfbo == 4){
        	return "Board/anonymous";
        }else {
        	return "Board/allboard";
        }
	}

	//freeboard
	@RequestMapping("free.do")
	public String selectfreeList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

		int listCount = BoardService.selecfreetListCount();
		


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

		ArrayList<Board> list = BoardService.selectfreeList(pi);

		

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/freelist";
	}
	@RequestMapping("freeold.do")
	public String selectfreeoldList(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

		int listCount = BoardService.selectListCount();
		


		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

		ArrayList<Board> list = BoardService.selectfreeoldList(pi);

		

		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "Board/freelist";
	}
	
	

	//글작성
	@RequestMapping("enroll.do")
	public ModelAndView enroll(Board b ,ModelAndView mv) {
		
		ArrayList<Board> bonum = BoardService.getboardallnumber();  
		
		mv.addObject("b" , b).addObject("bonum",bonum).setViewName("Board/enroll");

		return mv;
	}

	@RequestMapping("insertenroll.do")
	public String insertBoard(Board b ,pbox p,HttpServletRequest request ,@RequestParam("bo") int bo ,@RequestParam(value="deno",required = false ) int deno ,@RequestParam(value="save",required = false, defaultValue = "1") int save
			,MultipartHttpServletRequest mtfRequest , Attachment a , RedirectAttributes redirect)  {
		

		
		
		b.setContent(b.getContent().replaceAll("\n", "<br>"));
		
	    b.setBoardno(bo);
	    p.setBoardno(bo);
       
		
		 
		
		
		if(save == 2) {
			
			BoardService.saveboard(p);
						
			return "redirect:notice.do";

		}else {
		BoardService.insertboard(b,deno);
		 
			
			 
		  String resources = request.getSession().getServletContext().getRealPath("resources");
		
		   List<MultipartFile> fileList = mtfRequest.getFiles("file");
		   
		   
	        String src = mtfRequest.getParameter("src");
	        

	        String path = resources+"\\upload_files\\";

	        for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            if(!originFileName.isEmpty()) {
	            long fileSize = mf.getSize(); // 파일 사이즈

	            
	            

	            String safeFile = path + System.currentTimeMillis() + originFileName;
	            	     
	            String currentTime = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
	    		
	    		String ext = originFileName.substring(originFileName.lastIndexOf(".")); 
	    		
	    		String changeName = currentTime + ext;
	    	
	    		
	    		a.setChangeName(changeName);
	            
	            a.setOriginName(mf.getOriginalFilename());
	            	           	            
	            BoardService.savefiles(a);
	        
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
		   }
		}
		if(bo == 1) {

			return "redirect:notice.do";
		}
		else if(bo == 2) {
		
			return "redirect:free.do";
		}	
		else if(bo == 3) {

			//BoardService.insertdept(b,deno);
			return "redirect:depart.do";
		}
        int boardno = b.getBoardno();
        redirect.addAttribute("boardno", boardno);
		return "redirect:allboard.do";

		}

	
	
	
//부서게시판
	//영업팀 기술지원팀 경영지원팀 
	@RequestMapping("depart.do")
	public String selectdepartList(@RequestParam(value="currentPage" , required = false , defaultValue = "1")int currentPage, Model model
			){
		
		
		int listCount = BoardService.selecdeparttListCount();
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

	
		
		
          
		ArrayList<Board> conditions =BoardService.selectdeptnameList();
		
		ArrayList<Board> list = new ArrayList<Board>();
				
		list = BoardService.selectdeptList(pi);

		
		
		
		model.addAttribute("list",list);
		model.addAttribute("conditions",conditions);
		model.addAttribute("pi",pi);
		return "Board/deptlist";
	}
	
	@RequestMapping("standup.do")
	public String standup(@RequestParam(value="currentPage" , required = false , defaultValue = "1")int currentPage, Model model
			,@RequestParam("con") int con ,@RequestParam("nold") String nold){

		
		
		
		Board b = new Board();
		b.setDeptno(con);
		b.setStatus(nold);
		
		int listCount = BoardService.selectstandupListCount(con);
		
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
       
		ArrayList<Board> conditions =BoardService.selectdeptnameList();
		
		ArrayList<Board> list = new ArrayList<Board>();
				
		list = BoardService.selectstandupList(pi,b);

		
		
		
		model.addAttribute("list",list);
		model.addAttribute("conditions",conditions);
		model.addAttribute("pi",pi);
		model.addAttribute("con",con);
		model.addAttribute("nold",nold);
		return "Board/deptlist";
	
	
	}
	
	
	@RequestMapping("detailBoard.do")
    public String selectBoard(int bno ,@RequestParam(value="uno",required = false )int uno,Model model) {
		
		
		
		/*Board a = new Board();
		a.setWriteno(bno);	*/
		
		Board bo= new Board();
		bo.setWriteno(bno);
		bo.setEmpno(uno);
		BoardService.insertuser(bo);
		
		ArrayList<Board> list = BoardService.detailBoard(bno);
		Board b = BoardService.details(bno);
		
		model.addAttribute("list",list);
		model.addAttribute("b",b);
			    
	
		return "Board/boarddetail";

	
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
    public ModelAndView deletecoment(int cno, int bno ,@RequestParam(value="realbno",required = false , defaultValue = "1")int realbno, @RequestParam(value="uno",required = false ,defaultValue = "1")int uno, ModelAndView mv) {
		
		
		
		
		int result = BoardService.deletecoment(cno);
		
		
		if(result>0 && realbno == 4) {			
			mv.addObject("bno", bno).setViewName("redirect:detailanony.do");
		}else if(result>0) {		
			mv.addObject("bno", bno).addObject("uno", uno).setViewName("redirect:detailBoard.do");
			
		}else {
			mv.addObject("msg","댓글 삭제 실패").addObject("msgTitle", "댓글 삭제").setViewName("common/alert");
		}
		
		return mv;
	}   	
	
	@RequestMapping("updateFormBoard.do") 
	public ModelAndView updateForm(int bno, ModelAndView mv) {
			
		
		mv.addObject("b" , BoardService.details(bno))
		.setViewName("Board/boardupdate"); 
		
	
		
		return mv;
	}
	
	@RequestMapping("updateboard.do")
	public ModelAndView updatedetail(Board b , ModelAndView mv,@RequestParam(value="cf",required = false , defaultValue = "1")int cf, HttpServletRequest request
			,MultipartHttpServletRequest mtfRequest , Attachment a ,MultipartFile file) {
		
		BoardService.updatedetail(b);

		
		 
	  String resources = request.getSession().getServletContext().getRealPath("resources");
	
	   List<MultipartFile> fileList = mtfRequest.getFiles("file");
	   
	   
        String src = mtfRequest.getParameter("src");
        

        String path = resources+"\\upload_files\\";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            if(!originFileName.isEmpty()) {
            long fileSize = mf.getSize(); // 파일 사이즈

            
            

            String safeFile = path + System.currentTimeMillis() + originFileName;
            	     
            String currentTime = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
    		
    		String ext = originFileName.substring(originFileName.lastIndexOf(".")); 
    		
    		String changeName = currentTime + ext;
    	
    		try {
    			file.transferTo(new File(path + changeName));
    		} catch (IllegalStateException | IOException e) {
    			
    			e.printStackTrace();
    			throw new CommException("file Upload error");
    		}
    		
    		a.setChangeName(changeName);
            
            a.setOriginName(mf.getOriginalFilename());
            a.setLargeCat(b.getWriteno()); 	           	            
            BoardService.savefilesupdate(a);
        
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            }
        }
		
		
		
		if(cf == 1) {
		mv.addObject("bno",b.getWriteno()).addObject("uno",b.getEmpno()).setViewName("redirect:detailBoard.do");
		}else {
		mv.addObject("bno",b.getWriteno()).setViewName("redirect:detailanony.do");
		}
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
			}else if(boardno == 4){
				return "redirect:anonymous.do";
			}else {
				return "redirect:notice.do";
			}
			
			
		}
		private void deleteFile(String fileName, HttpServletRequest request) {
	        String resources = request.getSession().getServletContext().getRealPath("resources"); //웹 컨테이너 에서의 resources 경로를 뽑음 

		
			String savePath = resources+"\\upload_files\\";
			
			File deleteFile = new File(savePath + fileName); //지울 파일 가져오기 
			deleteFile.delete(); // 파일 지울떄 .delete
		}
		//임시보관함
		@RequestMapping("pbox.do")
       public String selectpbox(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model
    		   ,@RequestParam("userno") int userno) {
			
			
			
			int listCount = BoardService.selectpboxCount(userno);
			


			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

			ArrayList<Board> list = BoardService.selectpbox(pi,userno);

			

			model.addAttribute("list",list);
			model.addAttribute("pi",pi);
			return "Board/pbox";
		}
       @RequestMapping("detailpbox.do")
       public ModelAndView detailpbox(int pno, ModelAndView mv ) {
   		
   		
   		
   		
   		
   		pbox p = BoardService.detailpbox(pno);
   		
   		mv.addObject("p" , p).setViewName("Board/pboxdetail");
   		
   		return mv;

   	
   	}
        
        @RequestMapping("deletepbox.do")
        public String deletepbox(int userno,int pno, String fileName, HttpServletRequest request, Model model) {
        
         BoardService.deletepbox(pno);
         model.addAttribute("userno",userno);
        return "redirect:pbox.do";
        }
        @ResponseBody
        @RequestMapping(value="readuser.do" ,produces="application/json; charset=utf-8")
        public String readuser(Model model,int wno) {
        	
        	

    		ArrayList<Board> list = BoardService.readuser(wno);

    		

    		
    		return new GsonBuilder().create().toJson(list);
        	
        
}
        //익명게시판 
        @RequestMapping("anonymous.do")
    	public String selectanonymous(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

    		int listCount = BoardService.selectanonymousCount();
    		


    		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

    		ArrayList<Board> list = BoardService.selectanonymous(pi);

    		

    		model.addAttribute("list",list);
    		model.addAttribute("pi",pi);
    		return "Board/anonymous";
    	}
        @RequestMapping("anonymousold.do")
    	public String selectanonymousold(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage, Model model) {

    		int listCount = BoardService.selectanonymousCount();
    		


    		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

    		ArrayList<Board> list = BoardService.selectanonymousold(pi);

    		

    		model.addAttribute("list",list);
    		model.addAttribute("pi",pi);
    		return "Board/anonymous";
    	}
        
    	@RequestMapping("erollanonymous.do")
    	public ModelAndView erollanonymous(Board b ,ModelAndView mv) {
    		

    		mv.addObject("b" , b).setViewName("Board/enrollanony");

    		return mv;
    	}
    		@RequestMapping("insertanony.do")
    		public String insertanony(Board b ,HttpServletRequest request,MultipartHttpServletRequest mtfRequest , Attachment a ,MultipartFile file)  {
    			
  		        
    			BoardService.insertanony(b);
    			 
    				
    				 
    			  String resources = request.getSession().getServletContext().getRealPath("resources");
    			
    			   List<MultipartFile> fileList = mtfRequest.getFiles("file");
    			   
    			   
    		        String src = mtfRequest.getParameter("src");
    		        

    		        String path = resources+"\\upload_files\\";

    		        for (MultipartFile mf : fileList) {
    		            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
    		            if(!originFileName.isEmpty()) {
    		            long fileSize = mf.getSize(); // 파일 사이즈

    		            
    		            

    		            String safeFile = path + System.currentTimeMillis() + originFileName;
    		            	     
    		            String currentTime = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
    		    		
    		    		String ext = originFileName.substring(originFileName.lastIndexOf(".")); 
    		    		
    		    		String changeName = currentTime + ext;
    		    	
    		    		
    		    		a.setChangeName(changeName);
    		            
    		            a.setOriginName(mf.getOriginalFilename());
    		            	           	    
    		            try {
    		    			file.transferTo(new File(path + changeName)); //transferTo 파일 저장을 위해 사용 
    		    		} catch (IllegalStateException | IOException e) {
    		    			
    		    			e.printStackTrace();
    		    			throw new CommException("file Upload error");
    		    		}
    		            
    		            BoardService.savefiles(a);
    		        
    		            try {
    		                mf.transferTo(new File(safeFile));
    		            } catch (IllegalStateException e) {
    		                // TODO Auto-generated catch block
    		                e.printStackTrace();
    		            } catch (IOException e) {
    		                // TODO Auto-generated catch block
    		                e.printStackTrace();
    		            }
    		        }
    			   }
    			
    		

    			return "redirect:anonymous.do";

    			}
    		@RequestMapping("detailanony.do")
    	    public String detailanony(int bno ,Model model) {
    			
    			
    			
    			/*Board a = new Board();
    			a.setWriteno(bno);	*/
    			
    			 			
    			ArrayList<Board> list = BoardService.detailanonyfiles(bno);
    			Board b = BoardService.detailanony(bno);
    			
    			model.addAttribute("list",list);
    			model.addAttribute("b",b);
    				    
    		
    			return "Board/anonydetail";
    
        }
    		@ResponseBody
    		@RequestMapping(value = "insertcontentanony.do", produces="application/json; charset =utf-8")
    	       public String insertanonycoment(coment r ) {
    			
    			int result = BoardService.insertanonycoment(r);
    			
    			return String.valueOf(result);
    			
    			}
    		
    			@ResponseBody
    			@RequestMapping(value = "listcomentanony.do" , produces="application/json; charset =utf-8") 
    			public String listcomentanony(int bno) {
    				
    				ArrayList<coment> list = BoardService.listcomentanony(bno);
    				
    				return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list); 
    				
    			}
    			@RequestMapping("updateanony.do") 
    			public ModelAndView updateanony(int bno, ModelAndView mv) {
    				
    				mv.addObject("b" , BoardService.detailanony(bno)) 
    				.setViewName("Board/updateanony"); 
    				
    			
    				
    				return mv;
    			}
    			@ResponseBody
        		@RequestMapping(value = "allboardlist.do", produces="application/json; charset =utf-8")
        	       public String allbaordlist() {
        			
    				ArrayList<Board> blist  = BoardService.allboard(); 
    				
        			
        			return new Gson().toJson(blist);
        			
        			}
    			
    			 @RequestMapping("allboard.do")
    	    	public String alllistboard(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage,int boardno, Model model) {

    	    		int listCount = BoardService.alllistboardCount(boardno);
    	    		


    	    		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

    	    		ArrayList<Board> list = BoardService.alllistboard(pi,boardno);

    	    		
    	    		String bname = BoardService.bname(boardno);
                    
     	    		
    	    		model.addAttribute("bname",bname);
    	    		model.addAttribute("list",list);
    	    		model.addAttribute("boardno",boardno);
    	    		model.addAttribute("pi",pi);
    	    		return "Board/allboard";
    	    	}
    			
    				 
    			@RequestMapping("allboardold.do")
     	    	public String allboardold(@RequestParam(value="currentPage" , required = false , defaultValue = "1") int currentPage,int boardno, Model model) {

     	    		int listCount = BoardService.alllistboardCount(boardno);
     	    		


     	    		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

     	    		ArrayList<Board> list = BoardService.allboardold(pi,boardno);

     	    		
     	    		String bname = BoardService.bname(boardno);

     	    		model.addAttribute("bname",bname);
     	    		model.addAttribute("list",list);
     	    		model.addAttribute("boardno",boardno);
     	    		model.addAttribute("pi",pi);
     	    		
     	    		
     	    		return "Board/allboard";
     	    	}
}
