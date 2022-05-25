package com.uni.spring.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.approval.model.dao.AprvDao;
import com.uni.spring.approval.model.dto.AprvDoc;
import com.uni.spring.common.PageInfo;

@Service // 먼저 등록
public class AprvServiceImpl implements AprvService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AprvDao aprvDao;
	

	
	@Override
	public int selectListCount() {
				
		return aprvDao.selectListCount(sqlSession);
	}


	@Override // 
	public ArrayList<AprvDoc> selectList(PageInfo pi) {
		
		return aprvDao.selectList(sqlSession, pi);
	}

}
