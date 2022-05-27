package com.uni.spring.department.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.uni.spring.common.Attachment;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.department.model.dto.Department;
import com.uni.spring.department.model.dto.DepartmentReply;
import com.uni.spring.department.model.dto.Project;
import com.uni.spring.department.model.service.DepartService;

@Controller
public class DepartController {

	@Autowired
	public DepartService departService;
	
	//부서별 메인페이지로 전환
	@RequestMapping("departmentPage.do")
	public String departmentPage() {
		return "depart/departmentMainPage";
	}
	
	//공지사항 등록하러 화면 전환
	@RequestMapping("enrollFormAnnoDepart.do")
	public String enrollForm() {
		return "depart/annoDepartEnrollForm";
	}
	
	//공지사항 등록(첨부파일 있을시, 없을시 분류해서)
	@RequestMapping("insertAnnoDepart.do")
	public String insertAnnoDepart(Department d, HttpServletRequest request, @RequestParam(name="uploadFile", required = false) MultipartFile file, Attachment a) {
	
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
		
		return "redirect:departmentPage.do";
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
		ArrayList<Department> list = departService.selectAnnoDepartList(adno);
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
		

		Department d = departService.selectDepartmentAnno(adno);
		if(d!= null) {
			if(d.getAttachStatus().equals("Y")) {
				Attachment a = departService.selectAttachmentAnno(adno);
				mv.addObject("d",d).addObject("a",a).setViewName("depart/annoDepartDetailView");
			}else if(!d.getAttachStatus().equals("Y")) {
				mv.addObject("d",d).setViewName("depart/annoDepartDetailView");
			}
		}else {
			mv.addObject("msg","상세 조회 실패").addObject("msgTitle", "공지사항 상세 페이지").setViewName("common/alert");
		}	
		return mv;
	}
	
	/*공지사항 삭제*/
	@RequestMapping("deleteAnnoDepart.do")
	public String deleteAnnoDepart(int adno, @RequestParam(name = "rlcn", required = false)  String rlcn,  @RequestParam(name = "fileName", required = false) String fileName, HttpServletRequest request) {
		//adno -> 공지사항, rlcn -> 참조 분류 다 삭제
		//공지사항 상태값을 N으로 변경 파일번호 상태값 N으로 변경 참조 분류 삭제
			departService.deletAnnoDepart(adno, rlcn);
			
			if(!fileName.equals("")) {//파일이 있을 시
				deleteFile(fileName, request);
			}

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
		Department d = departService.selectDepartmentAnno(adno);
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
	private ModelAndView updateAnnoDepart(Department d, ModelAndView mv, HttpServletRequest request, @RequestParam(name="reUploadFile", required = false) MultipartFile file, Attachment a ) {
		String orgChangeName = a.getChangeName();//기존 파일의 수정명
		
		if(!file.getOriginalFilename().equals("")) {//새로 넘어온 파일이 있는 경우
			
			String changeName = saveFile(file, request);//changeNme을 제대로 받아오면 아래의 것이 수행이 된다. 
			a.setOriginName(file.getOriginalFilename());//originName을 넣어주고 
			a.setChangeName(changeName);//받아온 changeName을 넣어준다 
			d.setAttachStatus("Y");
			
		}
	
		
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
}
