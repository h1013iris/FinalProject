package com.uni.spring.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.board.model.dao.BoardDao;
import com.uni.spring.board.model.dto.Board;
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
	public void insertnotice(Board b) {
		String con = b.getContent();
		con = con.replaceAll("<p>", "").replaceAll("</p>", "\n");
        b.setContent(con);
		int result = BoardDao.insertnotice(sqlSession, b);
		if(result < 0) {
			throw new CommException("게시글 추가 실패");
		}
	}

	@Override
	public void insertfree(Board b) {
		String con = b.getContent();
		con = con.replaceAll("<p>", "").replaceAll("</p>", "\n");
        b.setContent(con);
		int result = BoardDao.insertfree(sqlSession, b);

		if(result < 0) {
			throw new CommException("게시글 추가 실패");
		}
	}

	@Override
	public int selecdeparttListCount() {
		// TODO Auto-generated method stub
		return BoardDao.selecdeparttListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectdepartList(PageInfo pi) {
		// TODO Auto-generated method stub
		return BoardDao.selectdepartList(sqlSession , pi);
	}

	@Override
	public int selecttectListCount() {
		// TODO Auto-generated method stub
		return BoardDao.selecttecListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selecttecList(PageInfo pi) {
		// TODO Auto-generated method stub
		return BoardDao.selecttecList(sqlSession , pi);
	}

	@Override
	public int selectoperListCount() {
		// TODO Auto-generated method stub
		return BoardDao.selectoperListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectoperList(PageInfo pi) {
		// TODO Auto-generated method stub
		return BoardDao.selectoperList(sqlSession , pi);
	}

	@Override
	public int selectdeoldCount() {
		// TODO Auto-generated method stub
		return BoardDao.selectdeoldCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectdeoldList(PageInfo pi, int de) {
		// TODO Auto-generated method stub
		return BoardDao.selectdeoldList(sqlSession , pi ,de);
	}

	@Override
	public ArrayList<Board> selectdeptnameList() {
		// TODO Auto-generated method stub
		return BoardDao.selectdeptnameList(sqlSession);
	}



}









