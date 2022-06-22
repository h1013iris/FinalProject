package com.uni.spring.department.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.common.Attachment;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.department.model.dto.DepartmentAnno;
import com.uni.spring.department.model.dto.DepartmentReply;
import com.uni.spring.department.model.dto.Project;
import com.uni.spring.department.model.dto.ProjectClass;
import com.uni.spring.department.model.dto.SemiCheckList;
import com.uni.spring.department.model.dto.SemiProject;
import com.uni.spring.department.model.service.DepartService;
import com.uni.spring.member.model.dto.Member;

@Controller
public class DepartController {

	@Autowired
	public DepartService departService;
	
	//부서별 메인페이지로 전환
	@RequestMapping("departmentPage.do")
	public ModelAndView departmentPage(String userNo,String departmentNo, ModelAndView mv) {
		ArrayList<DepartmentAnno> dlist = departService.selectAnnoDepartListMain(Integer.parseInt(departmentNo));//부서 공지사항 5개
		ArrayList<Board> blist = departService.selectBoardDepartListMain(Integer.parseInt(departmentNo));//부서 페이지
		ArrayList<Project> plist = departService.selectProjectList(Integer.parseInt(userNo));
		ArrayList<Member> mlist = departService.selectPInfoList(departmentNo);
		mv.addObject("dlist",dlist).addObject("blist",blist).addObject("plist",plist).addObject("mlist", mlist).setViewName("depart/departmentMainPage");
		return mv;
	}
	
	//공지사항 등록하러 화면 전환
	@RequestMapping("enrollFormAnnoDepart.do")
	public String enrollForm() {
		return "depart/annoDepartEnrollForm";
	}
	
	//공지사항 등록(첨부파일 있을시, 없을시 분류해서)
	@RequestMapping("insertAnnoDepart.do")
	public ModelAndView insertAnnoDepart(DepartmentAnno d, HttpServletRequest request, @RequestParam(name="uploadFile", required = false) MultipartFile file, Attachment a, ModelAndView mv) {
		d.setAnnoContent(d.getAnnoContent().replaceAll("\u0020", "&nbsp;").replaceAll("\n", "<br>"));
		if(!file.getOriginalFilename().equals("")) {//파일이 있을시에
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				a.setOriginName(file.getOriginalFilename());
				a.setChangeName(changeName);
				
			}
			d.setAttachStatus("Y");
		}else {
			d.setAttachStatus("N");
		}
		
		departService.insertAnnoDepart(d,a);
		mv.addObject("departmentNo",d.getRefDepart()).addObject("userNo",d.getAnnoWR());
		if(d.getRefDepart() != 3) {
			mv.setViewName("redirect:departmentPage.do");
		}else if(d.getRefDepart() ==3) {
			mv.setViewName("redirect:manangeMain.do");
		}
		return mv;
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		//업로드 할 때 지정 경로가 필요하다 
		String resources = request.getSession().getServletContext().getRealPath("resources");//웹 컨테이너에서의 resources 폴더까지의 경로 추출
		
		System.out.println(resources);
		//savePath 만들기
		String savePath = resources + "\\upload_files\\";
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());//년월일시분초
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		System.out.println(savePath);
		String changeName = currentTime+ext;
		
		//try-catch와 try-multicatch의 차이점을 알아보자
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file Upload error");
		}
		return changeName;
	}
	
	//공지사항 클릭했을 시 나오는 모달창에 보이는 것
	@ResponseBody
	@RequestMapping(value="annoDepartListView.do", produces="application/json; charset=utf-8")
	private String selectAnnoDepartList(int adno) {
		ArrayList<DepartmentAnno> list = departService.selectAnnoDepartList(adno);
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	//공지사항 상세 페이지로이동
	@RequestMapping("detailAnnoDepart.do")
	private ModelAndView selectAnnoDepart(int adno, @RequestParam(name = "userNo", required = false) String userNo, @RequestParam(name = "writerNo", required = false) String writerNo, ModelAndView mv) {
		if(userNo != null && writerNo != null) {
			if(!userNo.equals(writerNo)) {//글 작성자와 지금 보고있는사람이 같지 않는 경우에 적용
				int count = departService.increaseCount(adno);//작성자가 아니면 조회수 증가
			}
		}
		

		DepartmentAnno d = departService.selectDepartmentAnno(adno);
		Attachment at = departService.selectAttachmentProfile(writerNo);
		if(d!= null) {
			if(d.getAttachStatus().equals("Y")) {
				Attachment a = departService.selectAttachmentAnno(adno);
				mv.addObject("d",d).addObject("a",a).addObject("at",at).setViewName("depart/annoDepartDetailView");
			}else if(!d.getAttachStatus().equals("Y")) {
				mv.addObject("d",d).addObject("at",at).setViewName("depart/annoDepartDetailView");
			}
		}else {
			mv.addObject("msg","상세 조회 실패").addObject("msgTitle", "공지사항 상세 페이지").setViewName("common/alert");
		}	
		return mv;
	}
	
	/*공지사항 삭제*/
	@RequestMapping("deleteAnnoDepart.do")
	public String deleteAnnoDepart(String userNo,String departmentNo,int adno, @RequestParam(name = "rlcn", required = false)  String rlcn,  @RequestParam(name = "fileName", required = false) String fileName, HttpServletRequest request, Model m) {
		//adno -> 공지사항, rlcn -> 참조 분류 다 삭제
		//공지사항 상태값을 N으로 변경 파일번호 상태값 N으로 변경 참조 분류 삭제
			departService.deletAnnoDepart(adno, rlcn);
			
			if(!fileName.equals("")) {//파일이 있을 시
				deleteFile(fileName, request);
			}
			m.addAttribute("userNo", userNo);
			m.addAttribute("departmentNo", departmentNo);
		return "redirect:departmentPage.do";
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");//웹 컨테이너에서의 resources 폴더까지의 경로 추출
		
		//savePath 만들기
		String savePath = resources + "\\upload_files\\";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();//파일 삭제 삭제 하는것
		
	}
	
	/*수정하기 페이지 전환*/
	@RequestMapping("updateAnnoDepartForm.do")
	private ModelAndView updateAnnoDepart(int adno, ModelAndView mv) {
		DepartmentAnno d = departService.selectDepartmentAnno(adno);
		d.setAnnoContent(d.getAnnoContent().replaceAll("&nbsp;", "\u0020").replaceAll("<br>", "\n"));
		if(d.getAttachStatus().equals("Y")) {
			Attachment a = departService.selectAttachmentAnno(adno);
			mv.addObject("d",d).addObject("a",a).setViewName("depart/updateAnnoDepart");
		}else if(!d.getAttachStatus().equals("Y")) {
			mv.addObject("d",d).setViewName("depart/updateAnnoDepart");
		}
		return mv;
	}
	
	/*수정내용 들고온것*/
	@RequestMapping("updateAnnoDepart.do")
	private ModelAndView updateAnnoDepart(DepartmentAnno d, ModelAndView mv, HttpServletRequest request, @RequestParam(name="reUploadFile", required = false) MultipartFile file, Attachment a ) {
		String orgChangeName = a.getChangeName();//기존 파일의 수정명
		
		if(!file.getOriginalFilename().equals("")) {//새로 넘어온 파일이 있는 경우
			
			String changeName = saveFile(file, request);//changeNme을 제대로 받아오면 아래의 것이 수행이 된다. 
			a.setOriginName(file.getOriginalFilename());//originName을 넣어주고 
			a.setChangeName(changeName);//받아온 changeName을 넣어준다 
			d.setAttachStatus("Y");
			
		}
	
		d.setAnnoContent(d.getAnnoContent().replaceAll("\u0020", "&nbsp;").replaceAll("\n", "<br>"));
		if(orgChangeName ==null &&file.getOriginalFilename().equals("")) {
			d.setAttachStatus("N");
		}
		if(orgChangeName == null&&!file.getOriginalFilename().equals("")) {
			a.setRefListCatNo(60);
			a.setLargeCat(d.getAnnoNo());
			departService.insertAtta(a);
		}else {
			d.setAttachStatus("Y");
			departService.updateAnnoDepart(d,a);
		}
		
		
		if(orgChangeName != null) {//새로 넘어온 파일이 있는데 기존의 파일이 있는 경우 --> 서버에 업로드 된 기존 파일을 삭제 한 후에 거기에 새로 넘어온 파일을 넣어주어야 한다.
			deleteFile(orgChangeName, request);
		}
		
		mv.addObject("adno",d.getAnnoNo()).setViewName("redirect:detailAnnoDepart.do");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("annoReplyInsert.do")
	public String insertAnnoReply(DepartmentReply dr,String refDepartNo, String replyWriter) {
		System.out.println(dr.toString());
		dr.setRefDepartNo(Integer.parseInt(refDepartNo));
		dr.setReplyWriter(Integer.parseInt(replyWriter));
		int result = departService.insertAnnoReply(dr);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="annoRList.do", produces="application/json; charset=utf-8")
	public String selectAnnoReplyList(int adno) {
		ArrayList<DepartmentReply> list = departService.selectAnnoReplyList(adno);
		return new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm:ss").create().toJson(list);
	}
	
	/*댓글 삭제*/
	@RequestMapping("deleteAnnoDepartReply.do")
	public ModelAndView deleteAnnoDepartReply(int adro, int adno, ModelAndView mv) {
		
		int result = departService.deleteAnnoDepartReply(adro);
		
		if(result>0) {
			mv.addObject("adno", adno).setViewName("redirect:detailAnnoDepart.do");
		}else {
			mv.addObject("msg","댓글 삭제 실패").addObject("msgTitle", "댓글 삭제").setViewName("common/alert");
		}
		
		return mv;
	}
	
	/*간편 프로젝트 생성 상세에서 클릭시 */
	@RequestMapping("insertDepartProject.do")
	public String insertDPSimple(Project p) {
		departService.insertDPSimple(p);
		return "redirect:gotoProjectPage.do";
	}
	
	/*프로젝트 페이지로 이동*/
	@RequestMapping("gotoProjectPage.do")
	public String projectPage() {
		return "depart/ProjectList";
	}
	
	@ResponseBody
	@RequestMapping(value="selectProjectList.do", produces="application/json; charset=utf-8")
	public String selectProjectList(int emno) {
		ArrayList<Project> list = departService.selectProjectList(emno);
		
		return new Gson().toJson(list);
	}
	
	/*프로젝트 즐겨찾기 추가*/
	@ResponseBody
	@RequestMapping(value="insertProjectFav.do")
	public String insertFavProject(int prno, int emno) {
		Project p = new Project();
		p.setProNo(prno);
		p.setProWriter(emno);
		int result = departService.insertFavProject(p);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="selectFavProjectList.do", produces="application/json; charset=utf-8")
	public String selectFavProjectList(int emno) {
		ArrayList<Project> list = departService.selectFavProjectList(emno);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("deleteProjectFav.do")
	public String deleteProjectFav(int prno, int emno) {
		Project p = new Project();
		p.setProNo(prno);
		p.setProWriter(emno);
		int result = departService.deleteProjectFav(p);
		return String.valueOf(result) ;
	}
	
	@RequestMapping("detailProject.do")
	public ModelAndView selectDetailProject(int pjno, ModelAndView mv, @RequestParam(required=false, value="sp") SemiProject sp) {
		
		Project p = departService.selectDetailProject(pjno);//프로젝트
		if(p!= null) {
			ProjectClass pc = departService.selectPC(pjno);//프로젝트 분류
			ArrayList<Member> list = departService.selectPW(pjno);//참가자
			ArrayList<SemiProject> slist = departService.selectSP(pjno);//세부 프로젝트
			//멤버 전체 
			ArrayList<Member> tlist = departService.selectTL(pjno);
			
			if(pc != null && list != null && slist != null && tlist != null) {
				mv.addObject("p",p).addObject("pc",pc).addObject("list",list).addObject("slist",slist).addObject("tlist", tlist).setViewName("depart/detailProject");
			}else if(pc != null && list != null && slist == null && tlist != null) {
				mv.addObject("p",p).addObject("pc",pc).addObject("list",list).addObject("tlist", tlist).setViewName("depart/detailProject");
			}else {
				mv.addObject("msg","화면 전환 실패").addObject("msgTitle", "프로젝트 상세").setViewName("common/alert");
			}
		}else {
			mv.addObject("msg","화면 전환 실패").addObject("msgTitle", "프로젝트 상세").setViewName("common/alert");
		}
		if(sp != null) {
			mv.addObject("sp",sp);
		}

		return mv;
	}
	
	@RequestMapping("insertSemiPro.do")
	public String insertSemiPro(SemiProject sp, Model model) {
		departService.insertSemiPro(sp);
		model.addAttribute("pjno",sp.getRefPro());
		return "redirect:detailProject.do";
	}
	
	@RequestMapping("updateprjectClass.do")
	public String updateprjectClass(ProjectClass pc, Model model) {
		departService.updateprjectClass(pc);
		model.addAttribute("pjno", pc.getRefPro());
		return "redirect:detailProject.do";
	}
	
	//분류 delete
	@RequestMapping("deleteTargetName.do")
	public String deleteTargetName(int pcno, int sec, int pjno,String target, Model model) {
		ProjectClass pc = new ProjectClass();
		pc.setPcNo(pcno);
		pc.setSec(sec);//바꿀 번호명
		pc.setOriginpc(target);//원래 분류 명
		departService.deleteTargetName(pc);
		model.addAttribute("pjno", pjno);
		return "redirect:detailProject.do";
	}
	
	//세부 프로젝트 내용 select
	@ResponseBody
	@RequestMapping(value="selectSemiDetailPro.do" , produces="application/json; charset=utf-8")
	public String selectSemiDetailPro(int sino) {
		SemiProject sp = departService.selectSemiDetailPro(sino);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(sp);
	}
	
	//세부 프로젝트 기한일, 제목 update
	@ResponseBody
	@RequestMapping(value="updateSemi.do", produces="application/json; charset=utf-8")
	public String updateSemiPro(SemiProject sp) {
		departService.updateSemiPro(sp);
		return String.valueOf("1") ;
	}
	
	//세부 프로젝트 기한일 null update
	@ResponseBody
	@RequestMapping(value="updateSemiDueNull.do", produces="application/json; charset=utf-8")
	public String updateSemiDueNull(int semiNo) {
		departService.updateSemiDueNull(semiNo);
		return String.valueOf("1") ;
	}
	
	//체크 리스트 입력후 등록
	@ResponseBody
	@RequestMapping(value="insertChecklist.do", produces="application/json; charset=utf-8")
	public String insertCheckList(SemiCheckList scl) {
		departService.insertCheckList(scl);
		return String.valueOf("1") ;
	}
	
	//체크리스트 목록 가져오기
	@ResponseBody
	@RequestMapping(value="selectCheckList.do", produces="application/json; charset=utf-8")
	public String selectCheckList(SemiCheckList scl) {
		ArrayList<SemiCheckList> list = departService.selectCheckList(scl);
		return new Gson().toJson(list);
	}
	
	//자신이 작성한 체크리스트 삭제 
	@ResponseBody
	@RequestMapping(value="deletecheckList.do", produces="application/json; charset=utf-8")
	public String deletecheckList(int ckeckNo) {
		departService.deletecheckList(ckeckNo);
		return String.valueOf("1") ;
	}
	
	//자신이 작성한 체크리스트 전체 삭제
	@ResponseBody
	@RequestMapping(value="deleteTotcheckList.do", produces="application/json; charset=utf-8")
	public String deleteTotcheckList(int refSemi) {
		departService.deleteTotcheckList(refSemi);
		return String.valueOf("1") ;
	}
	
	//체크했을시 작동
	@ResponseBody
	@RequestMapping(value="updateckeckList.do", produces="application/json; charset=utf-8")
	public String updateckeckList(int ckeckNo) {
		departService.updateckeckList(ckeckNo);
		
		return String.valueOf("1") ;
	}
	
	//체크 제거했을시 작동
	@ResponseBody
	@RequestMapping(value="updatereckeckList.do", produces="application/json; charset=utf-8")
	public String updatereckeckList(int ckeckNo) {
		departService.updatereckeckList(ckeckNo);
		
		return String.valueOf("1") ;
	}
	
	//프로젝트 참여자 삭제
	@RequestMapping("deleteWatcher.do")
	public String deleteWatcher(Project p, Model model) {
		departService.deleteWatcher(p);
		
		model.addAttribute("pjno", p.getProNo());
		return "redirect:detailProject.do";
	}
	
	//프로젝트 참여자 추가 
	@RequestMapping("insertWatcherP.do")
	public String insertWatcherP(Project p, Model model) {
		departService.insertWatcherP(p);
		
		model.addAttribute("pjno", p.getProNo());
		return "redirect:detailProject.do";
	}
	
	//등록 버튼을 눌렀을 시에 설명 업데이트 및 삭제 
	@ResponseBody
	@RequestMapping(value="updateComment.do", produces="application/json; charset=utf-8")
	public String updateComment(SemiProject sp) {
		if(sp.getSemiContent() != null) {
			sp.setSemiContent(sp.getSemiContent().replaceAll("\u0020", "&nbsp;").replaceAll("\n", "<br>"));
		}
		
		departService.updateComment(sp);
		
		return String.valueOf("1") ;
	}
	
	//세부 프로젝트 댓글 달기
	@ResponseBody
	@RequestMapping(value="insertSemiReply.do", produces="application/json; charset=utf-8")
	public String insertSemiReply(DepartmentReply sr) {
		int result = departService.insertSemiReply(sr);
		return String.valueOf(result);
	}
	
	//세부 프로젝트 댓글 가져오기
	@ResponseBody
	@RequestMapping(value="selectSemiReplyList.do", produces="application/json; charset=utf-8")
	public String selectSemiReplyList(int refDepartNo) {
		ArrayList<DepartmentReply> list = departService.selectSemiReplyList(refDepartNo);
		return new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm:ss").create().toJson(list);
	}
	
	//세부프로젝트 댓글 삭제 
	@ResponseBody
	@RequestMapping(value="deleteReplySemi.do", produces="application/json; charset=utf-8")
	public String deleteReplySemi(DepartmentReply sr) {
		
		departService.deleteReplySemi(sr);
		
		return String.valueOf("1") ;
	}
	
	//세부프로젝트 첨부파일 저장
	@ResponseBody
	@RequestMapping(value="insertSemiFileUpload.do", produces="application/json; charset=utf-8")
	public String insertSemiFileUpload(HttpServletRequest request, @RequestParam("uploadFile") MultipartFile file, Attachment a ) {
		if(!file.getOriginalFilename().equals("")) {//파일이 있을시에
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				a.setOriginName(file.getOriginalFilename());
				a.setChangeName(changeName);
				
			}
			
		}
		departService.insertSemiFileUpload(a);
		return String.valueOf("1") ;
	}
	
	//세부 프로젝트 삭제 
	@RequestMapping("deleteSemiPro.do")
	public String deleteSemiProject(SemiProject sp, Model model, HttpServletRequest request) {
		ArrayList<Attachment> list = departService.selectAttachList(sp.getSemiNo());
		if(list != null) {
			for (Attachment attachment : list) {
				deleteFile(attachment.getChangeName(), request);
			}
		}
		departService.deleteSemiProject(sp);
		model.addAttribute("pjno",sp.getRefPro());
		return "redirect:detailProject.do";
	}
	
	//첨부파일 리스트 
	@ResponseBody
	@RequestMapping(value="selectlListAttach.do", produces="application/json; charset=utf-8")
	public String selectListAttach(int largeCat) {
		ArrayList<Attachment> list = departService.selectAttachList(largeCat);
		return new GsonBuilder().setDateFormat("yyyy/MM/dd").create().toJson(list);
	}
	
	//개별 첨부파일 삭제 
	@ResponseBody
	@RequestMapping(value="deleteAttachOne.do", produces="application/json; charset=utf-8")
	public String deleteAttachOne( Attachment a,  HttpServletRequest request) {
		deleteFile(a.getChangeName(), request);
		departService.deleteAttachOne(a);
		return String.valueOf("1") ;
	}
	
	@RequestMapping("updateTagSemi.do")
	public String updateTagSemi(SemiProject sp, Model model) {
		departService.updateTagSemi(sp);
		model.addAttribute("pjno",sp.getRefPro());
		return "redirect:detailProject.do";
	}
	//상세 리스트에서 전자 명함
	@ResponseBody
	@RequestMapping(value="selectListMemberList.do", produces="application/json; charset=utf-8")
	public String selectListMemberList(String departmentNo) {
		ArrayList<Member> mlist = departService.selectPInfoList(departmentNo);
		
		return new Gson().toJson(mlist);
	}
	
	//프로젝트 명 수정
	@RequestMapping("updateProjectName.do")
	public String updateProjectName(Project p, Model m) {
		departService.updateProjectName(p);
		System.out.println("p의 값"+ p);
		m.addAttribute("pjno",p.getProNo());
		return "redirect:detailProject.do";
	}
	
	//프로젝트 삭제 
	@RequestMapping("deleteProject.do")
	public String deleteProject(String userNo, String departmentNo, int proNo, Model m, HttpServletRequest request) {
		//세부프로젝트의 첨부파일들 리스트
		ArrayList<Attachment> list = departService.selectAttachListProject(proNo);
		if(list != null) {//리스트 삭제 
			for (Attachment attachment : list) {
				deleteFile(attachment.getChangeName(), request);
			} 
		}
		departService.deleteProject(proNo);
		
	
		return "redirect:gotoProjectPage.do";
	}
}
	
	
	

