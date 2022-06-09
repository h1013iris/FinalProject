package com.uni.spring.admin.model.service.approval;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.admin.model.dao.approval.AprvMgtDao;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.common.PageInfo;



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
	public ArrayList<AprvDoc> selectScrtyReqList(PageInfo pi) {
		
		return aprvMgtDao.selectScrtyReqList(sqlSession, pi);
	}


	@Override // 보안 처리된 문서인지 조회
	public int docScrtyCheck(int docNo) {
		
		return aprvMgtDao.docScrtyCheck(sqlSession, docNo);
	}


	@Override // 보안 처리된 문서 리스트 개수
	public int scrtyListCount() {
		
		return 0;
	}
	
	
	@Override // 보안 처리된 문서 리스트 조회
	public ArrayList<AprvDoc> selectDocScrtyList(PageInfo pi) {
		
		return null;
	}


	

	
	
	
}
