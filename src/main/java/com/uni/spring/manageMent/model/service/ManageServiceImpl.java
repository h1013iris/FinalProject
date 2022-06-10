package com.uni.spring.manageMent.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.manageMent.model.dao.ManageDao;

@Service
public class ManageServiceImpl implements ManageService {
	
	//@Autowired
	//private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManageDao manageDao;
}
