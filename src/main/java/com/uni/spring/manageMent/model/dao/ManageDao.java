package com.uni.spring.manageMent.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.common.Attachment;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.department.model.dto.Project;
import com.uni.spring.manageMent.model.dto.calendarWeek;
import com.uni.spring.manageMent.model.dto.manageDepart;
import com.uni.spring.manageMent.model.dto.vacationInfo;
import com.uni.spring.member.model.dto.Member;

@Repository
public class ManageDao {

	public ArrayList<Member> selectDepartInfo(SqlSessionTemplate sqlSession, Department d) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectDepartInfo",d);
	}

	public ArrayList<Member> selectInfofilter(SqlSessionTemplate sqlSession, manageDepart md) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectInfofilter",md);
	}

	public Attachment selectInfoEmployeeAtt(SqlSessionTemplate sqlSession, String empNo) {
		
		return sqlSession.selectOne("manageMapper.selectInfoEmployeeAtt", empNo);
	}

	public ArrayList<Project> selectListProject(SqlSessionTemplate sqlSession, String empNo) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectListProject",empNo);
	}

	public int countSelect(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("manageMapper.countSelect");
	}

	public AttendLog selectLogInfo(SqlSessionTemplate sqlSession , int empNo) {
		
		return sqlSession.selectOne( "manageMapper.selectLogInfo", empNo);
	}

	public int insertLogInfo(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.insert("manageMapper.insertLogInfo", empNo);
	}

	public String selectSatatusLog(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.selectOne("manageMapper.selectStatusLog", empNo);
	}

	public ArrayList<AttendLog> selectListAttendLog(SqlSessionTemplate sqlSession, calendarWeek cw) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectListAttendLog",cw);
	}

	public ArrayList<AttendLog> selectFilterInfo(SqlSessionTemplate sqlSession, manageDepart md) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectFilterInfo",md);
	}

	public String selectFirstday(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("manageMapper.selectFirstday");
	}

	public ArrayList<AttendLog> selectAttendAvg(SqlSessionTemplate sqlSession, calendarWeek cd) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectAttendAvg", cd);
	}

	public ArrayList<AttendLog> selectListAttendLogAVG(SqlSessionTemplate sqlSession, calendarWeek cw) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectListAttendLogAVG",cw);
	}

	public ArrayList<AttendLog> selectListAttendDetail(SqlSessionTemplate sqlSession, calendarWeek cw) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectListAttendDetail",cw);
	}

	public ArrayList<CmtUpdateForm> selectListEdittW(SqlSessionTemplate sqlSession, calendarWeek cw2) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectListEdittW",cw2);
	}

	public int updateCmtForm(SqlSessionTemplate sqlSession, CmtUpdateForm cf) {
		
		return sqlSession.update("manageMapper.updateCmtForm", cf);
	}

	public int updateAttendLogEdit(SqlSessionTemplate sqlSession, CmtUpdateForm cf) {
		
		return sqlSession.update("manageMapper.updateAttendLogEdit", cf);
	}

	public ArrayList<AttendLog> selectAttendAvgfilter(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectAttendAvgfilter", paramMap);
	}

	public ArrayList<AttendLog> selectListAttendLogAVGfilter(SqlSessionTemplate sqlSession,
			Map<String, Object> paramMap) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectListAttendLogAVGfilter", paramMap);
	}

	public Member selectInfo(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.selectOne("manageMapper.selectInfo", empNo);
	}

	public int updateStatusMember(SqlSessionTemplate sqlSession, AttendLog al) {
		
		return sqlSession.update("manageMapper.updateStatusMember", al);
	}

	public int updateLeaveTime(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.update("manageMapper.updateLeaveTime", empNo);
	}

	public int insertVacationForm(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("manageMapper.insertVacationForm", m);
	}

	public int updateVacation(SqlSessionTemplate sqlSession, LeaveForm leaveForm) {
		
		return sqlSession.update("manageMapper.updateVacation", leaveForm);
	}

	public int updatevacationYear(SqlSessionTemplate sqlSession, Member loginUser) {
		
		return sqlSession.update("manageMapper.updatevacationYear", loginUser);
	}

	public ArrayList<vacationInfo> selectListVacation(SqlSessionTemplate sqlSession, String departmentNo) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectListVacation", departmentNo);
	}

	public ArrayList<vacationInfo> filterListVacation(SqlSessionTemplate sqlSession, manageDepart md) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.filterListVacation", md);
	}

	public ArrayList<LeaveForm> selectListLeaveForm(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
		
		return (ArrayList)sqlSession.selectList("manageMapper.selectListLeaveForm", paramMap);
	}

}
