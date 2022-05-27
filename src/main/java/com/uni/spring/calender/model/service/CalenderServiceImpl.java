package com.uni.spring.calender.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.calender.model.dao.CalenderDao;
import com.uni.spring.calender.model.dto.Calender;

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

}
