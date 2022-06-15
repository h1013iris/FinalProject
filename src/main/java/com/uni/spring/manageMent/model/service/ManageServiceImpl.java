package com.uni.spring.manageMent.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.common.Attachment;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.department.model.dto.Project;
import com.uni.spring.manageMent.model.dao.ManageDao;
import com.uni.spring.manageMent.model.dto.calendarWeek;
import com.uni.spring.manageMent.model.dto.manageDepart;
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
}
