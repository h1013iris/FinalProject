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
import com.uni.spring.common.PageInfo;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.member.model.dto.Member;

@Repository // DB에 접근하는 클래스
public class AprvDao {

	public int completeListCount(SqlSessionTemplate sqlSession) {
				
		return sqlSession.selectOne("aprvMapper.selectListCount");
	}

	public ArrayList<AprvDoc> completeSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		// 페이징처리 위해 오프셋, 로우바운즈
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectList", null, rowBounds);
	}

	public ArrayList<Member> selectApprover(SqlSessionTemplate sqlSession, String deptNo) {
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectApprover", deptNo);
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
	
	

}
