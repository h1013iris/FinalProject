package com.uni.spring.calender.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.calender.model.dao.CalenderDao;
import com.uni.spring.calender.model.dto.Calender;
import com.uni.spring.member.model.dto.Member;

@Service
public class CalenderServiceImpl implements CalenderService {

	@Autowired
	public CalenderDao calenderDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void insertCalender(Calender calender, String startTime, String endTime) {
		
		calender = calender.changeDate(calender, startTime, endTime);
		
		int result = calenderDao.insertCalender(calender, sqlSession);
		
	}

	@Override
	public void insertCalender(Calender calender) {
		
		String startTime = "";
		String endTime = "";
		calender = calender.changeDate(calender, startTime, endTime);
		
		int result = calenderDao.insertCalender(calender, sqlSession);
	
	}

	@Override
	public ArrayList<Calender> selectList(Member loginUser) {
		ArrayList<Calender> list = new ArrayList<Calender>();
		
		// 내 할일 만 띄울 때(필터)
		
		list = calenderDao.selectList(loginUser, sqlSession);
		return list;
	}

}
