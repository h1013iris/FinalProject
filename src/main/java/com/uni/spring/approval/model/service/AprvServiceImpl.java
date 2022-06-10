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
import com.uni.spring.approval.model.dto.ReturnDoc;
import com.uni.spring.approval.model.dto.SecurityDoc;
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
	
	

	
	@Override // 문서 등록 시 결재선 조회
	public ArrayList<Member> selectDeptApprover(Member loginUser) {
		
		return aprvDao.selectDeptApprover(sqlSession, loginUser);
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

	
	@Override // 결재 대기 리스트 개수
	public int waitingListCount(Member loginUser) {
		
		return aprvDao.waitingListCount(sqlSession, loginUser);
	}


	@Override // 결재 대기 리스트 조회
	public ArrayList<AprvDoc> selectWaitingList(PageInfo pi, Member loginUser) {
		
		return aprvDao.selectWaitingList(sqlSession, pi, loginUser);
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


	@Override // 해당 문서 결재자 조회
	public AprvDoc selectDocApprover(int docNo) {
		
		return aprvDao.selectDocApprover(sqlSession, docNo);
	}
	
	
	@Override // 휴가 신청서 상세 조회
	public LeaveForm selectLeaveForm(int docNo) {
		
		return aprvDao.selectLeaveForm(sqlSession, docNo);
	}


	@Override // 업무 협조문 상세 조회
	public BusCoopForm selectbusCoopForm(int docNo) {
		
		return aprvDao.selectbusCoopForm(sqlSession, docNo);
	}


	@Override // 업무 기안서 상세 조회
	public BusDraftForm selectbusDraftForm(int docNo) {
		
		return aprvDao.selectbusDraftForm(sqlSession, docNo);
	}


	@Override // 근태 기록 수정 신청서 조회
	public CmtUpdateForm selectCmtUpdateForm(int docNo) {
		
		return aprvDao.selectCmtUpdateForm(sqlSession, docNo);
	}

	
	@Override // 결재 반려
	public void aprvReturn(AprvHistory aprvHistory, AprvDoc aprvDoc, ReturnDoc returnDoc) {
		
		// 결재 기록 등록
		insertAprvHistory2(aprvHistory);
		
		updateDoc(aprvDoc);
		
		int result = aprvDao.aprvReturn(sqlSession, returnDoc);
		
		if(result < 1) {
			throw new CommException("결재 반려 요청 실패");
		}

	}

	
	@Override // 결재 승인 (중간 승인)
	public void aprvApprove(AprvHistory aprvHistory) {
		
		insertAprvHistory2(aprvHistory);
	}


	@Override // 결재 승인 (최종 승인)
	public void aprvApproveComplete(AprvHistory aprvHistory, AprvDoc aprvDoc) {
		
		insertAprvHistory2(aprvHistory);
		updateDoc(aprvDoc);
	}

	
	// 해당 문서 반려, 승인, 임시저장 기록 등록
	public void insertAprvHistory2(AprvHistory aprvHistory) {
		
		int result = aprvDao.insertAprvHistory2(sqlSession, aprvHistory);
		
		if(result < 1) {
			throw new CommException("반려 기록 등록 실패");
		}
	}
	
	
	// 문서 상태값 변경
	public void updateDoc(AprvDoc aprvDoc) {
		
		int result = aprvDao.updateDoc(sqlSession, aprvDoc);
		
		if(result < 1) {
			throw new CommException("해당 문서 반려로 업데이트 실패");
		}
	}


	@Override // 결재 반려 리스트 개수
	public int returnListCount(int empNo) {
		
		return aprvDao.returnListCount(sqlSession, empNo);
	}


	@Override // 결재 반려 리스트 조회
	public ArrayList<AprvDoc> selectReturnList(PageInfo pi, int empNo) {
		
		return aprvDao.selectReturnList(sqlSession, pi, empNo);
	}


	@Override // 반려 사유 조회
	public ReturnDoc selectReReason(int docNo) {
		
		return aprvDao.selectReReason(sqlSession, docNo);
	}


	@Override // 기안자 조회
	public int selectDrafter(int docNo) {
		
		return aprvDao.selectDrafter(sqlSession, docNo);
	}


	@Override // 반려 문서 삭제
	public void deleteReturnDoc(int docNo) {
		
		int result = aprvDao.deleteReturnDoc(sqlSession, docNo);
		
		if(result < 1) {
			throw new CommException("반려 문서 삭제 실패");
		}
	}
	

	@Override // 결재 완료 문서 리스트 개수
	public int completeListCount(int empNo) {
				
		return aprvDao.completeListCount(sqlSession, empNo);
	}


	@Override // 결재 완료 문서 리스트 조회
	public ArrayList<AprvDoc> selectCompleteList(PageInfo pi, int empNo) {
		
		return aprvDao.selectCompleteList(sqlSession, pi, empNo);
	}


	@Override // 보안 요청
	public void docScrtyRequest(SecurityDoc securityDoc) {
		
		int result = aprvDao.docScrtyRequest(sqlSession, securityDoc);
		
		if(result < 1) {
			throw new CommException("문서 보안 요청 실패");
		}
	}


	@Override // 보안 요청된 문서인지 조회
	public int docScrtyReqCheck(int docNo) {
		
		return aprvDao.docScrtyReqCheck(sqlSession, docNo);
	}


	@Override // 진행 상태 확인 리스트 개수
	public int statusListCount(int empNo) {
		
		return aprvDao.statusListCount(sqlSession, empNo);
	}


	@Override // 진행 상태 확인 리스트 조회
	public ArrayList<AprvDoc> selectStatusList(PageInfo pi, int empNo) {
		
		return aprvDao.selectStatusList(sqlSession, pi, empNo);
	}
	


	


	

	

}
