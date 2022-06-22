package com.uni.spring.admin.model.service.approval;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.admin.model.dao.approval.AprvMgtDao;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.SecurityDoc;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.exception.CommException;



@Service // 먼저 등록
public class AprvMgtServiceImpl implements AprvMgtService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AprvMgtDao aprvMgtDao;

	
	
	
	
	@Override // 보안 요청 문서 상세 조회 위한 해당 문서 서식 조회
	public int selectDocTypeNo(int docNo) {
		
		return aprvMgtDao.selectDocTypeNo(sqlSession, docNo);
	}


	@Override // 문서 보안 요청 리스트 개수
	public int scrtyReqListCount() {
		
		return aprvMgtDao.scrtyReqListCount(sqlSession);
	}

	
	@Override // 문서 보안 요청 리스트 조회
	public ArrayList<AprvDoc> selectScrtyReqList() {
		
		return aprvMgtDao.selectScrtyReqList(sqlSession);
	}


	@Override // 보안 사유 조회
	public SecurityDoc selectScrtyReason(int docNo) {
		
		return aprvMgtDao.selectScrtyReason(sqlSession, docNo);
	}
	
	
	@Override // 문서 보안 처리
	public void docScrtySet(SecurityDoc securityDoc, AprvDoc aprvDoc) {
		
		// 보안 문서 상태값 변경 - 보안 설정
		docScrtySetUpdate(securityDoc);
		
		// 결재 문서 상태값 변경
		aprvDocUpdate(aprvDoc);
	}
	
	
	// 보안 문서 상태값 변경 - 보안 설정
	public void docScrtySetUpdate(SecurityDoc securityDoc) {
		
		int result = aprvMgtDao.docScrtySetUpdate(sqlSession, securityDoc);
		
		if(result < 1) {
			throw new CommException("보안 문서 상태값 변경 실패");
		}
	}
	
	
	// 결재 문서 상태값 변경
	public void aprvDocUpdate(AprvDoc aprvDoc) {
		
		int result = aprvMgtDao.aprvDocUpdate(sqlSession, aprvDoc);
		
		if(result < 1) {
			throw new CommException("보안 문서 상태값 변경 실패");
		}
	}


	@Override // 보안 처리된 문서 리스트 개수
	public int scrtyDocListCount(AprvDoc aprvDoc) {
		
		return aprvMgtDao.scrtyDocListCount(sqlSession, aprvDoc);
	}


	@Override // 보안 처리된 문서 리스트 조회
	public ArrayList<AprvDoc> selectScrtyDocList(PageInfo pi, AprvDoc aprvDoc) {
		
		return aprvMgtDao.selectScrtyDocList(sqlSession, pi, aprvDoc);
	}


	@Override // 보안 설정 취소
	public void docScrtyCancel(SecurityDoc securityDoc, AprvDoc aprvDoc) {
		
		// 보안 문서 목록에서 삭제 - 보안 취소
		deleteScrtyDoc(securityDoc);
				
		// 결재 문서 상태값 변경
		aprvDocUpdate(aprvDoc);
	}


	// 보안 문서 목록에서 삭제 - 보안 취소
	public void deleteScrtyDoc(SecurityDoc securityDoc) {
		
		int result = aprvMgtDao.deleteScrtyDoc(sqlSession, securityDoc);
		
		if(result < 1) {
			throw new CommException("보안 문서 상태값 변경 실패");
		}
	}


	

	
	
	
}
