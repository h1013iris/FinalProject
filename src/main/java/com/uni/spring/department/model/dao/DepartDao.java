package com.uni.spring.department.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.common.Attachment;
import com.uni.spring.department.model.dto.Department;

@Repository
public class DepartDao {
	
	//공지사항 넣는 부분
	public int insertAnnoDepart(SqlSessionTemplate sqlSession, Department d) {
		return sqlSession.insert("departMapper.insertAnnoDepart", d);
	}

	//첨부파일 넣는 부분
	public int insertAnnoDepartAttach(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("departMapper.insertAnnoDepartAttach",a);
	}

	//통합분류에 넣는 부분
	public int insertAnnoNum(SqlSessionTemplate sqlSession, Department d) {
		
		return sqlSession.insert("departMapper.insertAnnoNum", d);
	}

}
