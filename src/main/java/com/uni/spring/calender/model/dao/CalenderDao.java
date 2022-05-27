package com.uni.spring.calender.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.calender.model.dto.Calender;
import com.uni.spring.member.model.dto.Member;

@Repository
public class CalenderDao {

	public int insertCalender(Calender calender, SqlSession sqlSession) {
		return sqlSession.insert("calenderMapper.insertCalender", calender);
	}

	public ArrayList<Calender> selectList(Member loginUser, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("calenderMapper.selectList", loginUser);
	}
	
	
	
}
