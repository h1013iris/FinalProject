package com.uni.spring.manageMent.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.common.Attachment;
import com.uni.spring.department.model.dto.Project;
import com.uni.spring.manageMent.model.dto.AttendlogMana;
import com.uni.spring.manageMent.model.dto.manageDepart;
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

	public AttendlogMana selectLogInfo(SqlSessionTemplate sqlSession , int empNo) {
		
		return sqlSession.selectOne( "manageMapper.selectLogInfo", empNo);
	}

	public int insertLogInfo(SqlSessionTemplate sqlSession, int empNo) {
		
		return sqlSession.insert("manageMapper.insertLogInfo", empNo);
	}

}
