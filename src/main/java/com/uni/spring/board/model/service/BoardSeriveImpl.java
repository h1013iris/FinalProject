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

@Service
public class BoardSeriveImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao BoardDao;
	
	@Override
	public int selectListCount() {
		
		return BoardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		return BoardDao.selectListCount(sqlSession , pi);
	}

	@Override
	public int selecfreetListCount() {
		// TODO Auto-generated method stub
		return BoardDao.selectfreeListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectfreeList(PageInfo pi) {
		// TODO Auto-generated method stub
		return BoardDao.selectfreeListCount(sqlSession , pi);
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


	}

	
	

	
	
