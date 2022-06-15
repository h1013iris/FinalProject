package com.uni.spring.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.AprvHistory;
import com.uni.spring.approval.model.dto.AprvStatus;
import com.uni.spring.approval.model.dto.BusCoopForm;
import com.uni.spring.approval.model.dto.BusDraftForm;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
import com.uni.spring.approval.model.dto.DocOutbox;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.approval.model.dto.ReturnDoc;
import com.uni.spring.approval.model.dto.SecurityDoc;
import com.uni.spring.common.PageInfo;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.member.model.dto.Member;

@Repository // DB에 접근하는 클래스
public class AprvDao {

	public ArrayList<Member> selectDeptApprover(SqlSessionTemplate sqlSession, Member loginUser) {
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectDeptApprover", loginUser);
	}
	
	public String selectDeptName(SqlSessionTemplate sqlSession, String deptNo) {
		
		return sqlSession.selectOne("aprvMapper.selectDeptName", deptNo);
	}

	public int insertAprvDoc(SqlSessionTemplate sqlSession, AprvDoc aprvDoc) {
		
		return sqlSession.insert("aprvMapper.insertAprvDoc", aprvDoc);
	}

	public int insertAprvHistory(SqlSessionTemplate sqlSession, AprvHistory aprvHistory) {
		
		return sqlSession.insert("aprvMapper.insertAprvHistory", aprvHistory);
	}

	public int insertLeaveApp(SqlSessionTemplate sqlSession, LeaveForm leaveForm) {
		
		return sqlSession.insert("aprvMapper.insertLeaveApp", leaveForm);
	}

	public AttendLog selectCmt(SqlSessionTemplate sqlSession, AttendLog attendLog) {
		
		System.out.println("Dao =========" + attendLog.toString());
		
		return sqlSession.selectOne("aprvMapper.selectCmt", attendLog);
	}

	public int insertCmtUpdateApp(SqlSessionTemplate sqlSession, CmtUpdateForm cmtUpdateForm) {
		
		return sqlSession.insert("aprvMapper.insertCmtUpdateApp", cmtUpdateForm);
	}

	public ArrayList<Department> selectDeptList(SqlSessionTemplate sqlSession, int deptNo) {
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectDeptList", deptNo);
	}

	public int insertBusDraft(SqlSessionTemplate sqlSession, BusDraftForm busDraftForm) {
		
		return sqlSession.insert("aprvMapper.insertBusDraft", busDraftForm);
	}

	public int insertBusCoop(SqlSessionTemplate sqlSession, BusCoopForm busCoopform) {
		
		return sqlSession.insert("aprvMapper.insertBusCoop", busCoopform);
	}

	public int waitingListCount(SqlSessionTemplate sqlSession, Member loginUser) {
		
		return sqlSession.selectOne("aprvMapper.waitingListCount", loginUser);
	}

	public ArrayList<AprvDoc> selectWaitingList(SqlSessionTemplate sqlSession, PageInfo pi, Member loginUser) {
		
		// 페이징처리 위해 오프셋, 로우바운즈
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectWaitingList", loginUser, rowBounds);
	}
	
	public int requestListCount(SqlSessionTemplate sqlSession, Member loginUser) {
		
		return sqlSession.selectOne("aprvMapper.requestListCount", loginUser);
	}

	public ArrayList<AprvDoc> selectRequestList(SqlSessionTemplate sqlSession, PageInfo pi, Member loginUser) {
		
		// 페이징처리 위해 오프셋, 로우바운즈
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectRequestList", loginUser, rowBounds);
	}

	public int selectDocTypeNo(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.selectDocTypeNo", docNo);
	}

	public LeaveForm selectLeaveForm(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.selectLeaveForm", docNo);
	}

	public AprvDoc selectDocApprover(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.selectDocApprover", docNo);
	}

	public BusCoopForm selectbusCoopForm(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.selectbusCoopForm", docNo);
	}

	public BusDraftForm selectbusDraftForm(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.selectbusDraftForm", docNo);
	}

	public CmtUpdateForm selectCmtUpdateForm(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.selectCmtUpdateForm", docNo);
	}

	public int insertAprvHistory2(SqlSessionTemplate sqlSession, AprvHistory aprvHistory) {
		
		return sqlSession.insert("aprvMapper.insertAprvHistory2", aprvHistory);
	}

	public int updateDoc(SqlSessionTemplate sqlSession, AprvDoc aprvDoc) {
		
		return sqlSession.update("aprvMapper.updateDoc", aprvDoc);
	}

	public int aprvReturn(SqlSessionTemplate sqlSession, ReturnDoc returnDoc) {
		
		return sqlSession.insert("aprvMapper.aprvReturn", returnDoc);
	}

	public int returnListCount(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.selectOne("aprvMapper.returnListCount", empNo);
	}

	public ArrayList<AprvDoc> selectReturnList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo) {
		
		// 페이징처리 위해 오프셋, 로우바운즈
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectReturnList", empNo, rowBounds);
	}

	public ReturnDoc selectReReason(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.selectReReason", docNo);
	}

	public int selectDrafter(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.selectDrafter", docNo);
	}

	public int deleteReturnDoc(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.update("aprvMapper.deleteReturnDoc", docNo);
	}


	public int completeListCount(SqlSessionTemplate sqlSession, int empNo) {
				
		return sqlSession.selectOne("aprvMapper.completeListCount", empNo);
	}

	public ArrayList<AprvDoc> selectCompleteList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo) {
		
		// 페이징처리 위해 오프셋, 로우바운즈
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectCompleteList", empNo, rowBounds);
	}

	public int docScrtyRequest(SqlSessionTemplate sqlSession, SecurityDoc securityDoc) {
		
		return sqlSession.insert("aprvMapper.docScrtyRequest", securityDoc);
	}

	public int docScrtyReqCheck(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.docScrtyReqCheck", docNo);
	}

	public int statusListCount(SqlSessionTemplate sqlSession, AprvDoc aprvDoc) {
		
		return sqlSession.selectOne("aprvMapper.statusListCount", aprvDoc);
	}

	public ArrayList<AprvDoc> selectStatusList(SqlSessionTemplate sqlSession, PageInfo pi, AprvDoc aprvDoc) {
		
		// 페이징처리 위해 오프셋, 로우바운즈
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectStatusList", aprvDoc, rowBounds);
	}

	public String selectApprover(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.selectApprover", docNo);
	}

	public int selectAprvStatus(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.selectAprvStatus", docNo);
	}

	public ArrayList<AprvStatus> aprvStatusList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("aprvMapper.aprvStatusList");
	}

	public int saveLeaveFormOutbox(SqlSessionTemplate sqlSession, LeaveForm leaveForm) {
		
		return sqlSession.insert("aprvMapper.saveLeaveFormOutbox", leaveForm);
	}

	public int saveDocOutbox(SqlSessionTemplate sqlSession, DocOutbox docOutbox) {
		
		return sqlSession.insert("aprvMapper.saveDocOutbox", docOutbox);
	}

	public int updateDateOutbox(SqlSessionTemplate sqlSession, DocOutbox docOutbox) {
		
		return sqlSession.update("aprvMapper.updateDateOutbox", docOutbox);
	}

	public int updateLeaveFormOutbox(SqlSessionTemplate sqlSession, LeaveForm leaveForm) {
		
		return sqlSession.update("aprvMapper.updateLeaveFormOutbox", leaveForm);
	}

	public int saveCmpUdpFormOutbox(SqlSessionTemplate sqlSession, CmtUpdateForm cmtUpdateForm) {
		
		return sqlSession.insert("aprvMapper.saveCmpUdpFormOutbox", cmtUpdateForm);
	}

	public int saveDraftFormOutbox(SqlSessionTemplate sqlSession, BusDraftForm busDraftForm) {
		
		return sqlSession.insert("aprvMapper.saveDraftFormOutbox", busDraftForm);
	}

	public int saveCoopFormOutbox(SqlSessionTemplate sqlSession, BusCoopForm busCoopForm) {
		
		return sqlSession.insert("aprvMapper.saveCoopFormOutbox", busCoopForm);
	}

	public int outboxListCount(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.selectOne("aprvMapper.outboxListCount", empNo);
	}

	public ArrayList<DocOutbox> selectOutboxList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo) {
		
		// 페이징처리 위해 오프셋, 로우바운즈
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectOutboxList", empNo, rowBounds);
	}

	public int selectOutboxDocTypeNo(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.selectOne("aprvMapper.selectOutboxDocTypeNo", outboxNo);
	}

	public LeaveForm selectLeaveFormOutbox(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.selectOne("aprvMapper.selectLeaveFormOutbox", outboxNo);
	}

	public CmtUpdateForm selectCmtUdtFormOutbox(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.selectOne("aprvMapper.selectCmtUdtFormOutbox", outboxNo);
	}

	public BusDraftForm selectDraftFormOutbox(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.selectOne("aprvMapper.selectDraftFormOutbox", outboxNo);
	}

	public BusCoopForm selectCoopFormOutbox(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.selectOne("aprvMapper.selectCoopFormOutbox", outboxNo);
	}

	public int deleteOutboxDoc(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.delete("aprvMapper.deleteOutboxDoc", outboxNo);
	}

	public int deleteLeaveApp(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.delete("aprvMapper.deleteLeaveApp", outboxNo);
	}

	public int deleteCmtUpdateApp(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.delete("aprvMapper.deleteCmtUpdateApp", outboxNo);
	}

	public int deleteBusDraft(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.delete("aprvMapper.deleteBusDraft", outboxNo);
	}

	public int deleteBusCoop(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.delete("aprvMapper.deleteBusCoop", outboxNo);
	}

	public int updateLeaveApp(SqlSessionTemplate sqlSession, LeaveForm leaveForm) {
		
		return sqlSession.update("aprvMapper.updateLeaveApp", leaveForm);
	}

	public int updateLastUpdateDate(SqlSessionTemplate sqlSession, int outboxNo) {
		
		return sqlSession.update("aprvMapper.updateLastUpdateDate", outboxNo);
	}

	public int updateCmtUpdateApp(SqlSessionTemplate sqlSession, CmtUpdateForm cmtUpdateForm) {
		
		return sqlSession.update("aprvMapper.updateCmtUpdateApp", cmtUpdateForm);
	}

	public int updateBusDraft(SqlSessionTemplate sqlSession, BusDraftForm busDraftForm) {
		
		return sqlSession.update("aprvMapper.updateBusDraft", busDraftForm);
	}

	public int updateBusCoop(SqlSessionTemplate sqlSession, BusCoopForm busCoopForm) {
		
		return sqlSession.update("aprvMapper.updateBusCoop", busCoopForm);
	}

	public int oboxAprvReqLeaveApp(SqlSessionTemplate sqlSession, LeaveForm leaveForm) {
		
		return sqlSession.update("aprvMapper.oboxAprvReqLeaveApp", leaveForm);
	}

	public int oboxAprvReqCmtApp(SqlSessionTemplate sqlSession, CmtUpdateForm cmtUpdateForm) {
		
		return sqlSession.update("aprvMapper.oboxAprvReqCmtApp", cmtUpdateForm);
	}

	public int oboxAprvReqBusDft(SqlSessionTemplate sqlSession, BusDraftForm busDraftForm) {
		
		return sqlSession.update("aprvMapper.oboxAprvReqBusDft", busDraftForm);
	}

	public int oboxAprvReqBusCoop(SqlSessionTemplate sqlSession, BusCoopForm busCoopForm) {
		
		return sqlSession.update("aprvMapper.oboxAprvReqBusCoop", busCoopForm);
	}

	public AprvDoc lastAprvHistory(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMapper.lastAprvHistory", docNo);
	}

	

}
