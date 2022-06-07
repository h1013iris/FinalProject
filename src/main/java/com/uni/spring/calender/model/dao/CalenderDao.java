package com.uni.spring.calender.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.calender.model.dto.Calender;
import com.uni.spring.common.DepartmentManagement;

@Repository
public class CalenderDao {

	public int insertCalender(Calender calender, SqlSession sqlSession) {
		return sqlSession.insert("calenderMapper.insertCalender", calender);
	}

	public ArrayList<Calender> selectList(Map<String, String> data, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("calenderMapper.selectList", data);
	}

	public DepartmentManagement selectDepartment(String departmentNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("calenderMapper.selectDepartment", departmentNo);
	}

	public Calender selectCalenderDetailView(Map<String, String> data, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("calenderMapper.selectCalenderDetailView", data);
	}

	public int deleteCalender(Map<String, String> data, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.update("calenderMapper.deleteCalender", data);
	}

	public String selectColor(String selectColor, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("calenderMapper.selectColor", selectColor);
	}

	public int updateCalender(Calender calender, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.update("calenderMapper.updateCalender", calender);
	}

	public ArrayList<Calender> selectCalenderSearchList(String searchWord, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("calenderMapper.selectCalenderSearchList", searchWord);
	}
	
	
	
}
