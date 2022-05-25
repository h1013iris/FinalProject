package com.uni.spring.department.model.dao;

import java.util.ArrayList;

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

	public int insertAnnoDepartNoAttach(SqlSessionTemplate sqlSession, Department d) {
		
		return sqlSession.insert("departMapper.insertAnnoDepartNoAttach", d);
	}

	public ArrayList<Department> selectAnnoDepartList(SqlSessionTemplate sqlSession, int adno) {
		
		return (ArrayList)sqlSession.selectList("departMapper.selectAnnoDepartList", adno);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int adno) {
		
		return sqlSession.update("departMapper.increaseCount",adno);
	}

	public Department selectDepartmentAnno(SqlSessionTemplate sqlSession, int adno) {
		
		return sqlSession.selectOne("departMapper.selectDepartmentAnno",adno);
	}

	public Attachment selectAttachmentAnno(SqlSessionTemplate sqlSession, int adno) {
		
		return sqlSession.selectOne("departMapper.selectAttachmentAnno", adno);
	}

}
