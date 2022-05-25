package com.uni.spring.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.common.PageInfo;

@Repository // DB에 접근하는 클래스
public class AprvDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
				
		return sqlSession.selectOne("aprvMapper.selectListCount");
	}

	public ArrayList<AprvDoc> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		// 페이징처리 위해 오프셋, 로우바운즈
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aprvMapper.selectList", null, rowBounds);
	}
	
	

}
