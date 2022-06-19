package com.uni.spring.admin.controller.approval;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.spring.admin.model.service.approval.AprvMgtService;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.SecurityDoc;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.Pagination;

@Controller
public class aprvMgtController {

	@Autowired
	public AprvMgtService aprvMgtService;
	
	
	// 보안 설정 메인
	@RequestMapping("securityMain.do")
	public ModelAndView securityMgtMain(ModelAndView mv) {
		
		mv.setViewName("admin/approval/securityMgtMain");
		
		return mv;
	}
	
	
	// 문서 서식 관리 메인
	@RequestMapping("formMgtMain.do")
	public ModelAndView formMgtMain(ModelAndView mv) {
		
		mv.setViewName("admin/approval/formMgtMain");
		
		return mv;
	}
	
	
	// 문서 보안 요청 리스트
	@ResponseBody
	@RequestMapping(value="docScrtyRequestList.do", produces="application/json; charset=utf-8")
	public String selectScrtyReqList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage) {
		
		int listCount = aprvMgtService.scrtyReqListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
				
		ArrayList<AprvDoc> list = aprvMgtService.selectScrtyReqList(pi);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	
	
	// 보안 요청 문서 상세 조회
	@RequestMapping("securityReqDetail.do")
	public ModelAndView detailSecurityReqDoc(int docNo, ModelAndView mv) {
		
		// 해당 문서의 서식 번호 가져오기
		int docType = aprvMgtService.selectDocTypeNo(docNo);
		
		mv.addObject("docNo", docNo)
		.addObject("docType", docType)
		.setViewName("admin/approval/securityReqDocDetailView");
		
		return mv;
	}
	
	
	
	// 보안 사유 조회
	@ResponseBody
	@RequestMapping(value="selectScrtyReason.do", produces="application/json; charset=utf-8")
	public String selectScrtyReason(int docNo) {
				
		SecurityDoc securityDoc = aprvMgtService.selectScrtyReason(docNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(securityDoc);
		
	}
	
	
	
	// 문서 보안 처리
	@ResponseBody
	@RequestMapping(value="docScrtySet.do", produces="application/json; charset=utf-8")
	public String docScrtySet(SecurityDoc securityDoc, AprvDoc aprvDoc) {
		
		System.out.println(securityDoc.toString());
		System.out.println(aprvDoc.toString());
		
		aprvMgtService.docScrtySet(securityDoc, aprvDoc);

		return new Gson().toJson("success");
	}
	
	
	
	// 보안 처리된 문서 리스트
	@ResponseBody
	@RequestMapping(value="scrtyDocList.do", produces="application/json; charset=utf-8")
	public String selectScrtyDocList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
								AprvDoc aprvDoc) {
		
		int listCount = aprvMgtService.scrtyDocListCount(aprvDoc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<AprvDoc> list = aprvMgtService.selectScrtyDocList(pi, aprvDoc);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	
	
	// 보안 처리된 문서 상세 조회
	@RequestMapping("securityDetail.do")
	public ModelAndView detailSecurityDoc(int docNo, ModelAndView mv) {
		
		// 해당 문서의 서식 번호 가져오기
		int docType = aprvMgtService.selectDocTypeNo(docNo);
		
		mv.addObject("docNo", docNo)
		.addObject("docType", docType)
		.setViewName("admin/approval/securityDocDetailView");
		
		return mv;
	}
	
	
	
	// 문서 보안 취소 처리
	@ResponseBody
	@RequestMapping(value="docScrtyCancel.do", produces="application/json; charset=utf-8")
	public String docScrtyCancel(SecurityDoc securityDoc, AprvDoc aprvDoc) {
		
		System.out.println(securityDoc.toString());
		System.out.println(aprvDoc.toString());
		
		aprvMgtService.docScrtyCancel(securityDoc, aprvDoc);

		return new Gson().toJson("success");
	}
	
	
	
}
