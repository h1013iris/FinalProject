package com.uni.spring.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.approval.model.dao.AprvDao;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.AprvHistory;
import com.uni.spring.approval.model.dto.BusCoopForm;
import com.uni.spring.approval.model.dto.BusDraftForm;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.department.model.dto.AttendLog;
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

	
	@Override // 문서 등록 시 결재선 조회
	public ArrayList<Member> selectDeptApprover(String deptNo) {
		
		return aprvDao.selectDeptApprover(sqlSession, deptNo);
	}
	
	
	@Override // 로그인 유저 소속 부서명 조회
	public String selectDeptName(String deptNo) {
		
		return aprvDao.selectDeptName(sqlSession, deptNo);
	}

	
	// 결재 문서 등록
	public void insertDoc(AprvDoc aprvDoc) {
		
		int result = 0;
		
		result = aprvDao.insertAprvDoc(sqlSession, aprvDoc);
				
		if(result < 1) {
			throw new CommException("결재 문서 등록 실패");
		}
	}
	
	
	// 결재 기록 등록
	public void insertAprvHistory(AprvHistory aprvHistory) {
		
		int result = 0;
		
		result = aprvDao.insertAprvHistory(sqlSession, aprvHistory);
		
		if(result < 1) {
			throw new CommException("결재 기록 등록 실패");
		}
	}
	
	
	@Override // 휴가 신청서 등록
	public void insertLeaveApp(AprvDoc aprvDoc, AprvHistory aprvHistory, LeaveForm leaveForm) {
		
		int result = 0;
		
		// 결재 문서 서식 내용 저장
		result = aprvDao.insertLeaveApp(sqlSession, leaveForm);
		
		if(result < 1) {
			throw new CommException("문서 저장 실패");
		}
		
		insertDoc(aprvDoc); // 결재 문서 저장
		insertAprvHistory(aprvHistory); // 결재 기록 저장
	}
	
	
	@Override // 해당 날짜 근태 기록 조회
	public AttendLog selectCmt(AttendLog attendLog) {
		
		AttendLog userAttendLog = aprvDao.selectCmt(sqlSession, attendLog);
		
		return userAttendLog;
	}


	@Override // 근태 기록 수정 신청서
	public void insertCmtUpdateApp(AprvDoc aprvDoc, AprvHistory aprvHistory, CmtUpdateForm cmtUpdateForm) {
		
		int result = 0;
		
		// 결재 문서 서식 내용 저장
		result = aprvDao.insertCmtUpdateApp(sqlSession, cmtUpdateForm);
		
		if(result < 1) {
			throw new CommException("문서 저장 실패");
		
		} else {
			insertDoc(aprvDoc);
			insertAprvHistory(aprvHistory);
		}
	}


	@Override // 부서 리스트 조회
	public ArrayList<Department> selectDeptList() {
		
		return aprvDao.selectDeptList(sqlSession);
	}


	@Override // 업무 기안서 등록
	public void insertBusDraft(AprvDoc aprvDoc, AprvHistory aprvHistory, BusDraftForm busDraftForm) {
		
		int result = 0;
		
		// 결재 문서 서식 내용 저장
		result = aprvDao.insertBusDraft(sqlSession, busDraftForm);
		
		if(result < 1) {
			throw new CommException("문서 저장 실패");
		
		} else {
			insertDoc(aprvDoc);
			insertAprvHistory(aprvHistory);
		}
	}


	@Override // 업무 협조문 등록
	public void insertBusCoop(AprvDoc aprvDoc, AprvHistory aprvHistory, BusCoopForm busCoopform) {
		
		int result = 0;
		
		// 결재 문서 서식 내용 저장
		result = aprvDao.insertBusCoop(sqlSession, busCoopform);
		
		if(result < 1) {
			throw new CommException("문서 저장 실패");
		
		} else {
			insertDoc(aprvDoc);
			insertAprvHistory(aprvHistory);
		}
	}


	@Override // 결재 요청 문서 리스트 개수
	public int requestListCount(Member loginUser) {
		
		return aprvDao.requestListCount(sqlSession, loginUser);
	}


	@Override // 결재 요청 문서 리스트
	public ArrayList<AprvDoc> selectRequestList(PageInfo pi, Member loginUser) {
		
		return aprvDao.selectRequestList(sqlSession, pi, loginUser);
	}


	@Override // 문서의 서식 번호 가져오기
	public int selectDocTypeNo(int docNo) {
		
		return aprvDao.selectDocTypeNo(sqlSession, docNo);
	}


	@Override // 휴가 신청서 상세 조회
	public LeaveForm selectLeaveForm(int docNo) {
		
		return aprvDao.selectLeaveForm(sqlSession, docNo);
	}


	@Override // 해당 문서 결재자 조회
	public AprvDoc selectDocApprover(int docNo) {
		
		return aprvDao.selectDocApprover(sqlSession, docNo);
	}


	


	

	

}
