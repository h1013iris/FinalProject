package com.uni.spring.calender.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.calender.model.dto.Calender;

@Repository
public class CalenderDao {

	public int insertCalender(Calender calender, SqlSession sqlSession) {
		return sqlSession.insert("calenderMapper.insertCalender", calender);
	}

	public ArrayList<Calender> selectList(Map<String, String> data, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("calenderMapper.selectList", data);
	}
	
	
	
}
