package com.uni.spring.calender.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	public ArrayList<Calender> selectList(Member loginUser, Map<String, Integer> today_info) {
		ArrayList<Calender> list = new ArrayList<Calender>();
		
		// 필요한 데이터 값을 담기
		Map<String, String> data = new HashMap<String, String>();
		data.put("year", String.valueOf(today_info.get("search_year")));
		data.put("month", String.valueOf(today_info.get("search_month")));
		data.put("empNo", String.valueOf(loginUser.getEmpNo()));
		data.put("departmentNo", loginUser.getDepartmentNo());
		
		list = calenderDao.selectList(data, sqlSession);
		
		return list;
	}


}
