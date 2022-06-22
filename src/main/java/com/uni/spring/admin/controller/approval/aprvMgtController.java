package com.uni.spring.admin.controller.approval;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	public String selectScrtyReqList() {
				
		ArrayList<AprvDoc> list = aprvMgtService.selectScrtyReqList();
		
		// SimpleDateformat 으로 날짜 형식
	    for(int i = 0; i < list.size(); i++) {
	         
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		         
	    	// java.util.Date 선언
	    	java.util.Date date = new java.util.Date();
			 
	    	try {
	    		// Date 형식으로 지정해준 건가?
	    		date = sdf.parse(list.get(i).getDraftDate());
	    	} catch (ParseException e) {
	    		e.printStackTrace();
	    	}
	 
	    	date = new Date(date.getTime());   // util.Date 를 sal.Date로 변환
	    	String dftDate = sdf.format(date);   // sdf 형식 지정
	    	list.get(i).setDraftDate(dftDate);   // set 해주기
	    	
	    	try {
	           date = sdf.parse(list.get(i).getProDate());
	        } catch (ParseException e) {
	           e.printStackTrace();
	        }
	        
	        date = new Date(date.getTime());   // util.Date 를 sal.Date로 변환
	        String proDate = sdf.format(date);   // sdf 형식 지정
	        list.get(i).setProDate(proDate);   // set 해주기
	    }
	    

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
		
		aprvMgtService.docScrtySet(securityDoc, aprvDoc);

		return new Gson().toJson("success");
	}
	
	
	
	// 보안 처리된 문서 리스트
	@ResponseBody
	@RequestMapping(value="scrtyDocList.do", produces="application/json; charset=utf-8")
	public Map<String, Object> selectScrtyDocList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
								AprvDoc aprvDoc) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		int listCount = aprvMgtService.scrtyDocListCount(aprvDoc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<AprvDoc> list = aprvMgtService.selectScrtyDocList(pi, aprvDoc);
		
		// SimpleDateformat 으로 날짜 형식
		for(int i = 0; i < list.size(); i++) {
     
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 
			// java.util.Date 선언
			java.util.Date date = new java.util.Date();
 
			try {
				// Date 형식으로 지정해준 건가?
				date = sdf.parse(list.get(i).getDraftDate());
			} catch (ParseException e) {
				e.printStackTrace();
			}
 
			date = new Date(date.getTime());   	// util.Date 를 sal.Date로 변환
			String dftDate = sdf.format(date);  // sdf 형식 지정
			list.get(i).setDraftDate(dftDate);  // set 해주기
			
			try {
				date = sdf.parse(list.get(i).getProDate());
			} catch (ParseException e) {
				e.printStackTrace();
			}
 
			date = new Date(date.getTime());   // util.Date 를 sal.Date로 변환
			String proDate = sdf.format(date); // sdf 형식 지정
			list.get(i).setProDate(proDate);   // set 해주기
		}
    
		result.put("list", list);
		result.put("currentPage",  pi.getCurrentPage());
		result.put("startPage",  pi.getStartPage());
		result.put("endPage",  pi.getEndPage());
		result.put("maxPage",  pi.getMaxPage());

		return result;
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
		
		aprvMgtService.docScrtyCancel(securityDoc, aprvDoc);

		return new Gson().toJson("success");
	}
	
	
	
}
