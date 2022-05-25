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
	
		System.out.println(d.toString());
		if(!file.getOriginalFilename().equals("")) {//파일이 있을시에
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				a.setOriginName(file.getOriginalFilename());
				a.setChangeName(changeName);
				
			}
			d.setAttachStatus("Y");
			departService.insertAnnoDepart(d,a);
			
		}else {
			d.setAttachStatus("N");
			departService.insertAnnoDepartNoAttach(d);
		}
		
		
		
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
	private ModelAndView selectAnnoDepart(int adno,int userNo, int writerNo, ModelAndView mv) {
		if(userNo != writerNo) {//글 작성자와 지금 보고있는사람이 같지 않는 경우에 적용
			int count = departService.increaseCount(adno);//작성자가 아니면 조회수 증가
			if(count>0) {//조회수 증가되었을 시
				Department d = departService.selectDepartmentAnno(adno);
				if(d.getAttachStatus().equals("Y")) {
					Attachment a = departService.selectAttachmentAnno(adno);
					mv.addObject("d",d).addObject("a",a).setViewName("depart/annoDepartDetailView");
				}else {
					mv.addObject("d",d).setViewName("depart/annoDepartDetailView");
				}
				
			}else {
				mv.addObject("msg","상세 조회 실패").addObject("msgTitle", "공지사항 상세 페이지").setViewName("common/alert");
			}
		}else {
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
		}
		return mv;
	}
	

}
