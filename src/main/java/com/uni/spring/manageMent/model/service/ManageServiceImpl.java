package com.uni.spring.manageMent.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.approval.model.dto.CmtUpdateForm;
import com.uni.spring.approval.model.dto.LeaveForm;
import com.uni.spring.common.Attachment;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.department.model.dto.Project;
import com.uni.spring.manageMent.model.dao.ManageDao;
import com.uni.spring.manageMent.model.dto.calendarWeek;
import com.uni.spring.manageMent.model.dto.manageDepart;
import com.uni.spring.manageMent.model.dto.vacationInfo;
import com.uni.spring.member.model.dto.Member;

@Service
public class ManageServiceImpl implements ManageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManageDao manageDao;

	@Override
	public ArrayList<Member> selectDepartInfo(Department d) {
		
		return manageDao.selectDepartInfo(sqlSession, d);
	}

	@Override
	public ArrayList<Member> selectInfofilter(manageDepart md) {
		
		return manageDao.selectInfofilter(sqlSession, md);
	}

	@Override
	public Attachment selectInfoEmployeeAtt(String empNo) {
		
		return  manageDao.selectInfoEmployeeAtt(sqlSession, empNo);
	}

	@Override
	public ArrayList<Project> selectListProject(String empNo) {
		
		return manageDao.selectListProject(sqlSession, empNo);
	}

	@Override
	public int countSelect() {
		
		return manageDao.countSelect(sqlSession);
	}

	@Override
	public void insertAttendlog(int empNo) {
		AttendLog m = manageDao.selectLogInfo(sqlSession,empNo);
		if(m == null) {
			int result = manageDao.insertLogInfo(sqlSession, empNo);
			if(result <0) {
				throw new CommException("게시글 추가 실패");
			}
		}
	}

	@Override
	public String selectSatatusLog(int empNo) {
		
		return manageDao.selectSatatusLog(sqlSession,empNo);
	}

	@Override
	public ArrayList<AttendLog> selectListAttendLog(calendarWeek cw) {
		
		return manageDao.selectListAttendLog(sqlSession, cw);
	}

	@Override
	public ArrayList<AttendLog> selectFilterInfo(manageDepart md) {
		
		return manageDao.selectFilterInfo(sqlSession, md);
	}

	@Override
	public String selectFirstday() {
		
		return manageDao.selectFirstday(sqlSession);
	}

	@Override
	public ArrayList<AttendLog> selectAttendAvg(calendarWeek cd) {
		
		return manageDao.selectAttendAvg(sqlSession, cd);
	}

	@Override
	public ArrayList<AttendLog> selectListAttendLogAVG(calendarWeek cw) {
		
		return manageDao.selectListAttendLogAVG(sqlSession, cw);
	}

	@Override
	public ArrayList<AttendLog> selectListAttendDetail(calendarWeek cw) {
		
		return manageDao.selectListAttendDetail(sqlSession, cw);
	}

	@Override
	public ArrayList<CmtUpdateForm> selectListEdittW(calendarWeek cw2) {
		
		return manageDao.selectListEdittW(sqlSession, cw2);
	}

	@Override
	public void updateAttendLogEdit(CmtUpdateForm cf) {
		int result = manageDao.updateCmtForm(sqlSession, cf);//cmt테이블 업데이트 
		if(result >0) {
			int result2 = manageDao.updateAttendLogEdit(sqlSession, cf);
		}
		
	}

	@Override
	public ArrayList<AttendLog> selectAttendAvgfilter(calendarWeek cw, manageDepart md) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cw", cw); //날짜 모음
		paramMap.put("md", md); //필터 모음
		return manageDao.selectAttendAvgfilter(sqlSession, paramMap);
	}

	@Override
	public ArrayList<AttendLog> selectListAttendLogAVGfilter(calendarWeek cw2, manageDepart md) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cw2", cw2); //날짜 모음
		paramMap.put("md", md); //필터 모음
		return manageDao.selectListAttendLogAVGfilter(sqlSession, paramMap);
	}

	@Override
	public Member selectInfo(int empNo) {
		
		return manageDao.selectInfo(sqlSession, empNo);
	}

	@Override
	public void updateStatusMember(AttendLog al) {
		int result = manageDao.updateStatusMember(sqlSession, al);
		
	}

	@Override
	public int updateLeaveTime(int empNo) {
		
		return manageDao.updateLeaveTime(sqlSession, empNo);
	}

	@Override
	public void insertVacationForm(Member m) {
		int result = manageDao.insertVacationForm(sqlSession, m);
	}

	@Override
	public void updatevacationaYear(Member loginUser) {
		int result = manageDao.updatevacationYear(sqlSession, loginUser);
		
	}

	@Override
	public ArrayList<vacationInfo> selectListVacation(String departmentNo) {
		
		return manageDao.selectListVacation(sqlSession, departmentNo);
	}

	@Override
	public ArrayList<vacationInfo> filterListVacation(manageDepart md) {
		
		return manageDao.filterListVacation(sqlSession, md);
	}

	@Override
	public ArrayList<LeaveForm> selectListLeaveForm(manageDepart md, calendarWeek cw2) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cw2", cw2); //날짜 모음
		paramMap.put("md", md); //필터 모음
		return manageDao.selectListLeaveForm(sqlSession, paramMap);
	}

}
