package com.uni.spring.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.searchcon;
import com.uni.spring.common.PageInfo;

@Repository
public class BoardDao {

        public  int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Board> selectListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList" , null , rowBounds);
		//파라미터값 null
	}

	public int selectfreeListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectfreeListCount");
	}

	public ArrayList<Board> selectfreeListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectfreeList" , null , rowBounds);
	}



	public ArrayList<Board> selectsearchnoti(SqlSessionTemplate sqlSession, PageInfo pi, searchcon sc) {
        int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectnotiList" , sc , rowBounds);
	}

	

	public int selectsearchnotiCount(SqlSessionTemplate sqlSession, searchcon sc) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectsearchnotiCount",sc);
	}



	public ArrayList<Board> selectoldListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectoldList" , null , rowBounds);
	}


}


