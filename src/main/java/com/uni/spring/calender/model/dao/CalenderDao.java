package com.uni.spring.calender.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.uni.spring.calender.model.dto.Calender;

@Repository
public class CalenderDao {

	public int insertCalender(Calender calender, SqlSession sqlSession) {
		return sqlSession.insert("calenderMapper.insertCalender", calender);
	}
	
	
	
}
