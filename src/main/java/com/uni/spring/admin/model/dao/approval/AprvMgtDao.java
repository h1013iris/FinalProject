package com.uni.spring.admin.model.dao.approval;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.approval.model.dto.SecurityDoc;
import com.uni.spring.common.PageInfo;

@Repository // DB에 접근하는 클래스
public class AprvMgtDao {

	public int selectDocTypeNo(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMgtMapper.selectDocTypeNo", docNo);
	}

	public int scrtyReqListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("aprvMgtMapper.scrtyReqListCount");
	}
	
	public ArrayList<AprvDoc> selectScrtyReqList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("aprvMgtMapper.selectScrtyReqList");
	}

	public SecurityDoc selectScrtyReason(SqlSessionTemplate sqlSession, int docNo) {
		
		return sqlSession.selectOne("aprvMgtMapper.selectScrtyReason", docNo);
	}

	public int docScrtySetUpdate(SqlSessionTemplate sqlSession, SecurityDoc securityDoc) {
		
		return sqlSession.update("aprvMgtMapper.docScrtySetUpdate", securityDoc);
	}

	public int aprvDocUpdate(SqlSessionTemplate sqlSession, AprvDoc aprvDoc) {
		
		return sqlSession.update("aprvMgtMapper.aprvDocUpdate", aprvDoc);
	}

	public int scrtyDocListCount(SqlSessionTemplate sqlSession, AprvDoc aprvDoc) {
		
		return sqlSession.selectOne("aprvMgtMapper.scrtyDocListCount", aprvDoc);
	}

	public ArrayList<AprvDoc> selectScrtyDocList(SqlSessionTemplate sqlSession, PageInfo pi, AprvDoc aprvDoc) {
		
		// 페이징처리 위해 오프셋, 로우바운즈
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("aprvMgtMapper.selectScrtyDocList", aprvDoc, rowBounds);
	}

	public int deleteScrtyDoc(SqlSessionTemplate sqlSession, SecurityDoc securityDoc) {
		
		return sqlSession.delete("aprvMgtMapper.deleteScrtyDoc", securityDoc);
	}

	

	
	
}
