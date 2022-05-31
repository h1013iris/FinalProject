package com.uni.spring.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.admin.model.dao.adminDao;
import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.admin.model.dto.Job;
import com.uni.spring.admin.model.dto.employee;
import com.uni.spring.common.exception.CommException;

@Service
public class adminServiceImpl implements adminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private adminDao admindao;

	@Override
	public ArrayList<Department> selectAllDeptList() {
		// TODO Auto-generated method stub
		return admindao.selectAllDeptList(sqlSession);
	}

	@Override
	public ArrayList<Job> selectAllJobList() {
		// TODO Auto-generated method stub
		return admindao.selectAllJobList(sqlSession);
	}

	@Override
	public employee insertEmp(employee emp) {
		int result = admindao.insertEmp(sqlSession, emp);
		employee empInfo;
		if(result < 0) {
			throw new CommException("사원 추가 실패");
		} else {
			empInfo = admindao.insertUserSelect(sqlSession, emp.getCityNo());
		}
		
		return empInfo;
	}

}
