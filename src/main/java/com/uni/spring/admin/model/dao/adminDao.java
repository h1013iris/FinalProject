package com.uni.spring.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.admin.model.dto.Job;
import com.uni.spring.admin.model.dto.employee;

@Repository
public class adminDao {

	public ArrayList<Department> selectAllDeptList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("adminMapper.selectAllDeptList");
	}

	public ArrayList<Job> selectAllJobList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("adminMapper.selectAllJobList");
	}

	public int insertEmp(SqlSessionTemplate sqlSession, employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertEmp",emp);
	}

	public employee insertUserSelect(SqlSessionTemplate sqlSession, String cityNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.insertUserSelect",cityNo);
	}

}
