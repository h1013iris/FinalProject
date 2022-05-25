package com.uni.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.board.model.dao.BoardDao;
import com.uni.spring.board.model.dto.Board;
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

	
	
}
