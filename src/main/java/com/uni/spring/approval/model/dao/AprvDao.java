package com.uni.spring.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.AprvHistory;
import com.uni.spring.approval.model.dto.BusCoopForm;
import com.uni.spring.approval.model.dto.BusDraftForm;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
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

	public ArrayList<Department> selectDeptList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectDeptList");
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

	public int statusListCount(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.selectOne("aprvMapper.statusListCount", empNo);
	}

	public ArrayList<AprvDoc> selectStatusList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo) {
		
		// 페이징처리 위해 오프셋, 로우바운즈
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectStatusList", empNo, rowBounds);
	}
	
	

}
