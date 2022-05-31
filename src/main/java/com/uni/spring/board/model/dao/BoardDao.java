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

   // 노티스
   public int selectListCount(SqlSessionTemplate sqlSession) {

      return sqlSession.selectOne("boardMapper.selectListCount");
   }

   public ArrayList<Board> selectListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectList", null, rowBounds);
      // 파라미터값 null
   }

   public ArrayList<Board> selectsearchnoti(SqlSessionTemplate sqlSession, PageInfo pi, searchcon sc) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectnotiList", sc, rowBounds);
   }

   public int selectsearchnotiCount(SqlSessionTemplate sqlSession, searchcon sc) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("boardMapper.selectsearchnotiCount", sc);
   }

   public ArrayList<Board> selectoldListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectoldList", null, rowBounds);

   }

   //자유 게시판
   public int selectfreeListCount(SqlSessionTemplate sqlSession) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("boardMapper.selectfreeListCount");
   }

   public ArrayList<Board> selectfreeList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectfreeList", null, rowBounds);
   }

   public int selectsearchfreeCount(SqlSessionTemplate sqlSession, searchcon sc) {

      return sqlSession.selectOne("boardMapper.selectsearchfreeCount", sc);
   }

   public ArrayList<Board> selectsearchfree(SqlSessionTemplate sqlSession, PageInfo pi, searchcon sc) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectsearchfree", sc, rowBounds);
   }

   public ArrayList<Board> selectfreeoldList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectfreeoldList", null, rowBounds);
   }

   // 글작성
   public int insertnotice(SqlSessionTemplate sqlSession, Board b) {

      return sqlSession.insert("boardMapper.insertnotice", b);

   }

   public int insertfree(SqlSessionTemplate sqlSession, Board b) {

      return sqlSession.insert("boardMapper.insertfree", b);

   }

   public int selecdeparttListCount(SqlSessionTemplate sqlSession, int de) {
      
      return sqlSession.selectOne("boardMapper.selecdeparttListCount",de);
   }

   public ArrayList<Board> selectdepartList(SqlSessionTemplate sqlSession, PageInfo pi) {
      
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectdepartList", null, rowBounds);
   }

   public int selecttecListCount(SqlSessionTemplate sqlSession) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("boardMapper.selecttecListCount");
   }

   public ArrayList<Board> selecttecList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selecttecList", null, rowBounds);
   }

   public int selectoperListCount(SqlSessionTemplate sqlSession) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("boardMapper.selectoperListCount");
   }

   public ArrayList<Board> selectoperList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectoperList", null, rowBounds);
   }

public int selectdeoldCount(SqlSessionTemplate sqlSession) {
	// TODO Auto-generated method stub
	 return sqlSession.selectOne("boardMapper.selectdeoldCount");
}


public ArrayList<Board> selectdeptnameList(SqlSessionTemplate sqlSession) {
	// TODO Auto-generated method stub
	return (ArrayList)sqlSession.selectList("boardMapper.selectdeptnameList");
}

public ArrayList<Board> selectdeptList(SqlSessionTemplate sqlSession, PageInfo pi, Board b) {
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
    return (ArrayList) sqlSession.selectList("boardMapper.selectdeptList", b, rowBounds);
}

public Board detailBoard(SqlSessionTemplate sqlSession, int bno) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("boardMapper.detailBoard" , bno);
}





   
   }

   
   

