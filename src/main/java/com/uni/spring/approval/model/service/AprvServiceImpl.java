package com.uni.spring.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.approval.model.dao.AprvDao;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.AprvHistory;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.member.model.dto.Member;

@Service // 먼저 등록
public class AprvServiceImpl implements AprvService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AprvDao aprvDao;
	

	
	@Override // 결재 완료 문서 리스트 개수
	public int completeListCount() {
				
		return aprvDao.completeListCount(sqlSession);
	}


	@Override // 결재 완료 문서 리스트
	public ArrayList<AprvDoc> completeSelectList(PageInfo pi) {
		
		return aprvDao.completeSelectList(sqlSession, pi);
	}

	

	@Override // 결재자 조회
	public ArrayList<Member> selectApprover(String deptNo) {
		
		return aprvDao.selectApprover(sqlSession, deptNo);
	}


	@Override
	public void insertDoc(AprvDoc aprvDoc, AprvHistory aprvHistory) {
		
		// 결재 문서 등록
		int result1 = aprvDao.insertAprvDoc(sqlSession, aprvDoc);
		
		int result2 = 0;
		
		if(result1 > 0) {
			// 결재 문서 등록 성공 시 결재 기록 남기기
			result2 = aprvDao.insertAprvHistory(sqlSession, aprvHistory);

		} else {
			throw new CommException("결재 문서 등록 실패");
		}
		
		if(result1 * result2 < 1) {
			throw new CommException("결재 기록 저장 실패");
		}
	}
	
	
	@Override // 휴가 신청서 등록
	public void insertLeaveApp(LeaveForm leaveForm) {
		// 결재 문서 서식 내용 저장
		int result = aprvDao.insertLeaveApp(sqlSession, leaveForm);
		
		if(result < 1) {
			throw new CommException("문서 저장 실패");
		}
	}

	

}
