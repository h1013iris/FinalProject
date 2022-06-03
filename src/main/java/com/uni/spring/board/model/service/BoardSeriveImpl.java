package com.uni.spring.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.board.model.dao.BoardDao;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.coment;
import com.uni.spring.board.model.dto.searchcon;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.exception.CommException;

@Service
public class BoardSeriveImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private BoardDao BoardDao;

	//notice
	@Override
	public int selectListCount() {

		return BoardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {

		return BoardDao.selectListCount(sqlSession , pi);
	}
	@Override
	public ArrayList<Board> selectsearchnoti(PageInfo pi, searchcon sc) {

		return BoardDao.selectsearchnoti(sqlSession,pi ,sc);
	}

	@Override
	public int selectsearchnotiCount(searchcon sc) {
		// TODO Auto-generated method stub
		return BoardDao.selectsearchnotiCount(sqlSession, sc);
	}



	@Override
	public ArrayList<Board> selectoldList(PageInfo pi) {

		return BoardDao.selectoldListCount(sqlSession , pi);
	}

	//freeboard
	@Override
	public int selecfreetListCount() {
		// TODO Auto-generated method stub
		return BoardDao.selectfreeListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectfreeList(PageInfo pi) {
		// TODO Auto-generated method stub
		return BoardDao.selectfreeList(sqlSession , pi);
	}

	@Override
	public int selectsearchfreeCount(searchcon sc) {
		// TODO Auto-generated method stub
		return BoardDao.selectsearchfreeCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Board> selectsearchfree(PageInfo pi, searchcon sc) {
		// TODO Auto-generated method stub
		return BoardDao.selectsearchfree(sqlSession,pi ,sc);
	}



	@Override
	public ArrayList<Board> selectfreeoldList(PageInfo pi) {
		// TODO Auto-generated method stub
		return BoardDao.selectfreeoldList(sqlSession , pi);
	}

	//글작성
	@Override
	public void insertboard(Board b) {
	
		
		String con = b.getContent();
		con = con.replaceAll("<p>", "").replaceAll("</p>", "\n");
	    b.setContent(con);	    
		int result = BoardDao.insertboard(sqlSession, b );
		if(result < 0) {
			throw new CommException("게시글 추가 실패");
		}
		
	}
	@Override
	public void insertdept(Board b, int deno) {

		String con = b.getContent();
		con = con.replaceAll("<p>", "").replaceAll("</p>", "\n");
	    b.setContent(con);
	    b.setDeptno(deno);
		int result = BoardDao.insertdept(sqlSession, b );
		if(result < 0) {
			throw new CommException("게시글 추가 실패");
		}
		
	}
	
    
	//부서게시판
	@Override
	public int selecdeparttListCount() {
		// TODO Auto-generated method stub
		return BoardDao.selecdeparttListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectdeptList(PageInfo pi) {
		
		return BoardDao.selectdeptList(sqlSession,pi);
	}


	@Override
	public ArrayList<Board> selectdeptnameList() {
		// TODO Auto-generated method stub
		return BoardDao.selectdeptnameList(sqlSession);
	}

	@Override
	public Board detailBoard(int bno) {
		
		return BoardDao.detailBoard(sqlSession, bno);
	}

	@Override
	public int selectstandupListCount(int con) {
		
		return BoardDao.selectstandupListCount(sqlSession,con);
	}

	@Override
	public ArrayList<Board> selectstandupList(PageInfo pi, Board b) {
		
		return BoardDao.selectstandupList(sqlSession, pi,b);
	}
  //댓글
	@Override
	public int insertReply(coment r) {		
			
			int result = BoardDao.insertReply(sqlSession, r);
			if(result < 0) {
				throw new CommException("댓글등록 실패");
			}
			return  result;
		}

	@Override
	public ArrayList<coment> selectcomentList(int bno) {
		// TODO Auto-generated method stub
		return BoardDao.selectcomentList(sqlSession, bno);
	}

	@Override
	public int deletecoment(int cno) {
		
	    return BoardDao.deletecoment(sqlSession, cno);
	}

	@Override
	public void updatedetail(Board b) {
		int result = BoardDao.updatedetail(sqlSession, b);
		
	     if(result < 0) {
		throw new CommException("게시글 수정 실패");
				}
		
	}
	}



	

	

	
	













