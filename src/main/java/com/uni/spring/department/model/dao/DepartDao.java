package com.uni.spring.department.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.department.model.dto.Department;

@Repository
public class DepartDao {

	public int insertAnnoDepart(SqlSessionTemplate sqlSession, Department d) {
		return sqlSession.insert("departMapper.insertAnnoDepart", d);
	}

}
