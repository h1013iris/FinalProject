package com.uni.spring.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.approval.model.dao.AprvDao;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.AprvHistory;
import com.uni.spring.approval.model.dto.AprvStatus;
import com.uni.spring.approval.model.dto.BusCoopForm;
import com.uni.spring.approval.model.dto.BusDraftForm;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
import com.uni.spring.approval.model.dto.DocOutbox;
import com.uni.spring.approval.model.dto.DocType;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.approval.model.dto.ReturnDoc;
import com.uni.spring.approval.model.dto.SecurityDoc;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.manageMent.model.dao.ManageDao;
import com.uni.spring.member.model.dto.Member;

@Service // 먼저 등록
public class AprvServiceImpl implements AprvService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AprvDao aprvDao;
	
	@Autowired
	private ManageDao manageDao;

	
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
		}else {
			int result1 = manageDao.updateVacation(sqlSession, leaveForm);
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
	public ArrayList<Department> selectDeptList(int deptNo) {
		
		return aprvDao.selectDeptList(sqlSession, deptNo);
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
	public int waitingListCount(AprvDoc aprvDoc) {
		
		return aprvDao.waitingListCount(sqlSession, aprvDoc);
	}


	@Override // 결재 대기 리스트 조회
	public ArrayList<AprvDoc> selectWaitingList(PageInfo pi, AprvDoc aprvDoc) {
		
		return aprvDao.selectWaitingList(sqlSession, pi, aprvDoc);
	}
	

	@Override // 결재 요청 문서 리스트 개수
	public int requestListCount(AprvDoc aprvDoc) {
		
		return aprvDao.requestListCount(sqlSession, aprvDoc);
	}


	@Override // 결재 요청 문서 리스트
	public ArrayList<AprvDoc> selectRequestList(PageInfo pi, AprvDoc aprvDoc) {
		
		return aprvDao.selectRequestList(sqlSession, pi, aprvDoc);
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
	public int returnListCount(AprvDoc aprvDoc) {
		
		return aprvDao.returnListCount(sqlSession, aprvDoc);
	}


	@Override // 결재 반려 리스트 조회
	public ArrayList<AprvDoc> selectReturnList(PageInfo pi, AprvDoc aprvDoc) {
		
		return aprvDao.selectReturnList(sqlSession, pi, aprvDoc);
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
	public int completeListCount(AprvDoc aprvDoc) {
				
		return aprvDao.completeListCount(sqlSession, aprvDoc);
	}


	@Override // 결재 완료 문서 리스트 조회
	public ArrayList<AprvDoc> selectCompleteList(PageInfo pi, AprvDoc aprvDoc) {
		
		return aprvDao.selectCompleteList(sqlSession, pi, aprvDoc);
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
	public int statusListCount(AprvDoc aprvDoc) {
		
		return aprvDao.statusListCount(sqlSession, aprvDoc);
	}


	@Override // 진행 상태 확인 리스트 조회
	public ArrayList<AprvDoc> selectStatusList(PageInfo pi, AprvDoc aprvDoc) {
		
		return aprvDao.selectStatusList(sqlSession, pi, aprvDoc);
	}


	@Override // 상태값이 진행 중인 경우 현재 결재자 조회
	public String selectApprover(int docNo) {
		
		return aprvDao.selectApprover(sqlSession, docNo);
	}


	@Override // 해당 문서 상태값 조회
	public int selectAprvStatus(int docNo) {
		
		return aprvDao.selectAprvStatus(sqlSession, docNo);
	}


	@Override // 결재 문서 상태값 리스트 조회
	public ArrayList<AprvStatus> aprvStatusList() {
		
		return aprvDao.aprvStatusList(sqlSession);
	}


	@Override // 휴가 신청서 임시 보관함에 처음으로 저장
	public void saveLeaveFormOutbox(DocOutbox docOutbox, LeaveForm leaveForm) {
		
		saveDocOutbox(docOutbox);
		
		int result = aprvDao.saveLeaveFormOutbox(sqlSession, leaveForm);
		
		if(result < 1) {
			throw new CommException("문서 서식 저장 실패");
		}
	}
	
	
	// 임시 보관함에 저장
	public void saveDocOutbox(DocOutbox docOutbox) {
		
		int result = aprvDao.saveDocOutbox(sqlSession, docOutbox);
		
		if(result < 1) {
			throw new CommException("임시 보관함 저장 실패");
		}
	}

	
	// 임시 보관 문서 최근 수정일 업데이트
	public void updateDateOutbox(DocOutbox docOutbox) {
		
		int result = aprvDao.updateDateOutbox(sqlSession, docOutbox);
		
		if(result < 1) {
			throw new CommException("임시 보관 문서 최근 수정일 업데이트 실패");
		}
	}
	
	
	


	@Override // 근태 기록 수정 신청서 임시 보관함에 저장
	public void saveCmpUdpFormOutbox(DocOutbox docOutbox, CmtUpdateForm cmtUpdateForm) {

		saveDocOutbox(docOutbox);
		
		int result = aprvDao.saveCmpUdpFormOutbox(sqlSession, cmtUpdateForm);
		
		if(result < 1) {
			throw new CommException("문서 서식 저장 실패");
		}
	}


	@Override // 업무 기안서 임시 보관함에 저장
	public void saveDraftFormOutbox(DocOutbox docOutbox, BusDraftForm busDraftForm) {
		
		saveDocOutbox(docOutbox);
		
		int result = aprvDao.saveDraftFormOutbox(sqlSession, busDraftForm);
		
		if(result < 1) {
			throw new CommException("문서 서식 저장 실패");
		}
	}


	@Override // 업무 협조문 신청서 임시 보관함에 저장
	public void saveCoopFormOutbox(DocOutbox docOutbox, BusCoopForm busCoopForm) {
		
		saveDocOutbox(docOutbox);
		
		int result = aprvDao.saveCoopFormOutbox(sqlSession, busCoopForm);
		
		if(result < 1) {
			throw new CommException("문서 서식 저장 실패");
		}
	}


	@Override // 임시 보관 리스트 개수
	public int outboxListCount(AprvDoc aprvDoc) {
		
		return aprvDao.outboxListCount(sqlSession, aprvDoc);
	}


	@Override // 임시 보관 리스트 조회
	public ArrayList<DocOutbox> selectOutboxList(PageInfo pi, AprvDoc aprvDoc) {
		
		return aprvDao.selectOutboxList(sqlSession, pi, aprvDoc);
	}


	@Override // 임시 보관 문서 타입 조회
	public int selectOutboxDocTypeNo(int outboxNo) {
		
		return aprvDao.selectOutboxDocTypeNo(sqlSession, outboxNo);
	}


	@Override // 휴가 신청서 임시 보관함 상세 조회
	public LeaveForm selectLeaveFormOutbox(int outboxNo) {
		
		return aprvDao.selectLeaveFormOutbox(sqlSession, outboxNo);
	}


	@Override // 근태 기록 수정 신청서 임시 보관함 상세 조회
	public CmtUpdateForm selectCmtUdtFormOutbox(int outboxNo) {
		
		return aprvDao.selectCmtUdtFormOutbox(sqlSession, outboxNo);
	}


	@Override // 업무 기안서 임시 보관함 상세 조회
	public BusDraftForm selectDraftFormOutbox(int outboxNo) {
		
		return aprvDao.selectDraftFormOutbox(sqlSession, outboxNo);
	}


	@Override // 업무 협조문 상세 조회
	public BusCoopForm selectCoopFormOutbox(int outboxNo) {
		
		return aprvDao.selectCoopFormOutbox(sqlSession, outboxNo);
	}


	@Override // 임시 저장 문서 삭제
	public void deleteOutboxDoc(int outboxNo, int docType, Integer docNo) {
		
		int result = 0, result2 = 0;
		
		// 문서 서식 삭제
		if(docType == 10) {
			result = aprvDao.deleteLeaveApp(sqlSession, outboxNo);
		
		} else if(docType == 11) {
			result = aprvDao.deleteCmtUpdateApp(sqlSession, outboxNo);
		
		} else if(docType == 20) {
			result = aprvDao.deleteBusDraft(sqlSession, outboxNo);
		
		} else if(docType == 30) {
			result = aprvDao.deleteBusCoop(sqlSession, outboxNo);
		}
		
		if(result < 1) {
			throw new CommException("임시 저장 문서 서식 삭제 실패");
		}
		
		// 임시 보관함에서 삭제
		deleteOutboxDoc(outboxNo);
		
		System.out.println("Service docNo ==========> " + docNo);
		// 결재 취소한 문서의 경우 결재 정보 삭제
		if(docNo != null) {
			result2 = aprvDao.deleteAprvDocument(sqlSession, docNo);
			
			if(result2 < 1) {
				throw new CommException("결재 정보 삭제 실패");
			}
		}
	}
	
	
	// 임시 보관함에서 삭제
	public void deleteOutboxDoc(int outboxNo) {
		
		int result = aprvDao.deleteOutboxDoc(sqlSession, outboxNo);
		
		if(result < 1) {
			throw new CommException("임시 저장 문서 삭제 실패");
		}
	}


	@Override // 휴가 신청서 업데이트
	public void updateLeaveApp(LeaveForm leaveForm, int outboxNo) {
		
		int result = aprvDao.updateLeaveApp(sqlSession, leaveForm);
		
		if(result < 1) {
			throw new CommException("휴가 신청서 업데이트 실패");
		
		} else {
			updateLastUpdateDate(outboxNo);
		}
	}

	
	// 임시 저장 문서 최근 수정일 업데이트
	private void updateLastUpdateDate(int outboxNo) {
		
		int result = aprvDao.updateLastUpdateDate(sqlSession, outboxNo);
		
		if(result < 1) {
			throw new CommException("임시 보관 문서 최근 수정일 업데이트 실패");
		}
	}


	@Override // 근태 기록 수정 신청서 업데이트
	public void updateCmtUpdateApp(CmtUpdateForm cmtUpdateForm, int outboxNo) {
		
		int result = aprvDao.updateCmtUpdateApp(sqlSession, cmtUpdateForm);
		
		if(result < 1) {
			throw new CommException("근태 기록 수정 신청서 업데이트 실패");
		
		} else {
			updateLastUpdateDate(outboxNo);
		}
	}


	@Override // 업무 기안서 업데이트
	public void updateBusDraft(BusDraftForm busDraftForm, int outboxNo) {
		
		int result = aprvDao.updateBusDraft(sqlSession, busDraftForm);
		
		if(result < 1) {
			throw new CommException("근태 기록 수정 신청서 업데이트 실패");
		
		} else {
			updateLastUpdateDate(outboxNo);
		}
	}


	@Override // 업무 협조문 업데이트
	public void updateBusCoop(BusCoopForm busCoopForm, int outboxNo) {
		
		int result = aprvDao.updateBusCoop(sqlSession, busCoopForm);
		
		if(result < 1) {
			throw new CommException("근태 기록 수정 신청서 업데이트 실패");
		
		} else {
			updateLastUpdateDate(outboxNo);
		}
	}


	@Override // 임시 저장 문서 - 휴가 신청서 결재 요청
	public void oboxAprvReqLeaveApp(AprvDoc aprvDoc, AprvHistory aprvHistory, 
									LeaveForm leaveForm, int outboxNo) {
		
		// 결재 문서 서식 내용 저장
		int result = aprvDao.oboxAprvReqLeaveApp(sqlSession, leaveForm);
				
		if(result < 1) {
			throw new CommException("휴가 신청서 문서 번호 업데이트 실패");
		
		} else {
			// 임시 보관함에서 삭제
			deleteOutboxDoc(outboxNo);
			// 결재 문서 저장
			insertDoc(aprvDoc);
			// 결재 기록 저장
			insertAprvHistory(aprvHistory);
		}

	}


	@Override // 임시 저장 문서 - 근태 기록 수정 신청서 결재 요청
	public void oboxAprvReqCmtApp(AprvDoc aprvDoc, AprvHistory aprvHistory, 
									CmtUpdateForm cmtUpdateForm, int outboxNo) {
		
		// 결재 문서 서식 내용 저장
		int result = aprvDao.oboxAprvReqCmtApp(sqlSession, cmtUpdateForm);
				
		if(result < 1) {
			throw new CommException("휴가 신청서 문서 번호 업데이트 실패");
		
		} else {
			// 임시 보관함에서 삭제
			deleteOutboxDoc(outboxNo);
			// 결재 문서 저장
			insertDoc(aprvDoc);
			// 결재 기록 저장
			insertAprvHistory(aprvHistory);
		}
	}


	@Override // 임시 저장 문서 - 업무 기안서 결재 요청
	public void oboxAprvReqBusDft(AprvDoc aprvDoc, AprvHistory aprvHistory, 
								BusDraftForm busDraftForm, int outboxNo) {
		
		// 결재 문서 서식 내용 저장
		int result = aprvDao.oboxAprvReqBusDft(sqlSession, busDraftForm);
				
		if(result < 1) {
			throw new CommException("휴가 신청서 문서 번호 업데이트 실패");
		
		} else {
			// 임시 보관함에서 삭제
			deleteOutboxDoc(outboxNo);
			// 결재 문서 저장
			insertDoc(aprvDoc);
			// 결재 기록 저장
			insertAprvHistory(aprvHistory);
		}
	}


	@Override // 임시 저장 문서 - 업무 협조문 결재 요청
	public void oboxAprvReqBusCoop(AprvDoc aprvDoc, AprvHistory aprvHistory, 
								BusCoopForm busCoopForm, int outboxNo) {
		
		// 결재 문서 서식 내용 저장
		int result = aprvDao.oboxAprvReqBusCoop(sqlSession, busCoopForm);
		
		if(result < 1) {
			throw new CommException("휴가 신청서 문서 번호 업데이트 실패");
		
		} else {
			// 임시 보관함에서 삭제
			deleteOutboxDoc(outboxNo);
			// 결재 문서 저장
			insertDoc(aprvDoc);
			// 결재 기록 저장
			insertAprvHistory(aprvHistory);
		}
	}


	@Override // 결재 취소 위해 해당 문서 가장 최근 기록 조회
	public AprvDoc lastAprvHistory(int docNo) {
		
		return aprvDao.lastAprvHistory(sqlSession, docNo);
	}


	// 결재 취소
	@Override
	public void aprvCancle(int docNo, int docType, DocOutbox docOutbox) {
		
		int result = aprvDao.deleteDocHistory(sqlSession, docNo);
		
		if(result < 1) {
			throw new CommException("결재 기록 삭제 실패");
			
		} else {
			saveDocOutbox(docOutbox);
			
			int result1 = 0;
			
			// 서식에 임시 저장 번호 추가
			if(docType == 10) {
				result1 = aprvDao.updateLeaveAppOboxNo(sqlSession, docNo);
			
			} else if(docType == 11) {
				result1 = aprvDao.updateCmtAppOboxNo(sqlSession, docNo);
				
			} else if(docType == 20) {
				result1 = aprvDao.updateBusDraftOboxNo(sqlSession, docNo);
				
			} else if(docType == 30) {
				result1 = aprvDao.updateBusCoopOboxNo(sqlSession, docNo);			
			}
			
			if(result1 < 1) {
				throw new CommException("결재 취소 실패");
			}
		}
		
	}
	
	
	// 결재 취소 문서 결재 재요청
	@Override
	public void aprvReRequest(int docType, int outboxNo, LeaveForm leaveForm,
								CmtUpdateForm cmtUpdateForm, BusDraftForm busDraftForm,
								BusCoopForm busCoopForm, AprvHistory aprvHistory, AprvDoc aprvDoc) {
		
		// 문서 서식 update, 임시 보관 번호 null
		int result = 0;
		
		if(docType == 10) {
			result = aprvDao.oboxAprvReqLeaveApp(sqlSession, leaveForm);
		
		} else if(docType == 11) {
			result = aprvDao.oboxAprvReqCmtApp(sqlSession, cmtUpdateForm);
		
		} else if(docType == 20) {
			result = aprvDao.oboxAprvReqBusDft(sqlSession, busDraftForm);
		
		} else if(docType == 30) {
			result = aprvDao.oboxAprvReqBusCoop(sqlSession, busCoopForm);
		}
		
		if(result < 1) {
			throw new CommException("문서 번호 업데이트 실패");
		}
		
		// 임시 보관함에서 delete
		deleteOutboxDoc(outboxNo);
		
		// 결재 기록 insert
		insertAprvHistory(aprvHistory);
		
		// 결재 문서 정보 update
		int result2 = aprvDao.updateAprvDoc(sqlSession, aprvDoc);
		
		if(result2 < 1) {
			throw new CommException("결재 문서 정보 업데이트 실패");
		}
	}


	// 문서 타입 리스트 조회
	@Override
	public ArrayList<DocType> selectDocTypeList() {
		
		return aprvDao.selectDocTypeList(sqlSession);
	}
	
	
	// 문서 전체 검색 리스트 개수
	@Override
	public int searchAllDocListCount(AprvDoc aprvDoc) {
		
		return aprvDao.searchAllDocListCount(sqlSession, aprvDoc);
	}


	// 문서 전체 검색 리스트 조회
	@Override
	public ArrayList<AprvDoc> searchAllDocList(PageInfo pi, AprvDoc aprvDoc) {
		
		return aprvDao.searchAllDocList(sqlSession, pi, aprvDoc);
	}


	// 결재자 조회
	@Override
	public ArrayList<Member> selectDocEnrollApprover(Member loginUser) {
		
		return aprvDao.selectDocEnrollApprover(sqlSession, loginUser);
	}


	// 결재 취소 문서 결재자 조회
	@Override
	public AprvDoc selectCancleDocApprover(int docNo) {
		
		return aprvDao.selectCancleDocApprover(sqlSession, docNo);
	}


	


	


	


	

	

}
