package com.uni.spring.department.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.uni.spring.common.Attachment;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.department.model.dto.Department;
import com.uni.spring.department.model.service.DepartService;

@Controller
public class DepartController {

	@Autowired
	public DepartService departService;
	
	//공지사항 등록하러 화면 전환
	@RequestMapping("enrollFormAnnoDepart.do")
	public String enrollForm() {
		return "depart/annoDepartEnrollForm";
	}
	
	
	@RequestMapping("insertAnnoDepart.do")
	public String insertAnnoDepart(Department d, HttpServletRequest request, @RequestParam(name="uploadFile", required = false) MultipartFile file, Attachment a) {
		d.setAnnoWR(100000);//일단은 임의로 사원번호를 준다 
		d.setRefDepart(1);//임의로 참조 부서 넣어줬다
	
		if(!file.getOriginalFilename().equals("")) {//파일이 있을시에
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				a.setOriginName(file.getOriginalFilename());
				a.setChangeName(changeName);
			}
			departService.insertAnnoDepart(d,a);
			
		}
		

		
		return "redirect:/";
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
	

}
