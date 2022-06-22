package com.uni.spring.calender.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.calender.model.dao.CalenderDao;
import com.uni.spring.calender.model.dto.Calender;
import com.uni.spring.common.DepartmentManagement;
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
	public ArrayList<Calender> selectList(Member m, Map<String, Integer> today_info) {
		ArrayList<Calender> list = new ArrayList<Calender>();
		
		// 필요한 데이터 값을 담기
		Map<String, String> data = new HashMap<String, String>();
		data.put("year", String.valueOf(today_info.get("search_year")));
		data.put("month", String.valueOf(today_info.get("search_month")));
		data.put("empNo", String.valueOf(m.getEmpNo()));
		data.put("departmentNo", m.getDepartmentNo());
		
		list = calenderDao.selectList(data, sqlSession);
		
		return list;
	}

	@Override
	public DepartmentManagement selectDepartment(String departmentNo) {
		DepartmentManagement department = new DepartmentManagement();
		department = calenderDao.selectDepartment(departmentNo, sqlSession);
		return department;
	}

	@Override
	public Calender selectCalenderDetailView(String startDate, String endDate, String writerNo) {
		Calender calender = new Calender();
		Map<String, String> data = new HashMap<String, String>();
		
		startDate = startDate.replaceAll("-", "/").substring(0, 16);
		endDate = endDate.replaceAll("-", "/").substring(0, 16);
		
		data.put("startDate", startDate);
		data.put("endDate", endDate);
		data.put("writerNo", writerNo);
		calender = calenderDao.selectCalenderDetailView(data, sqlSession);
		
		return calender;
	}

	@Override
	public int deleteCalender(String startDate, String endDate, String realWriter) {
		Map<String, String> data = new HashMap<String, String>();
		
		startDate = startDate.replaceAll("-", "/").substring(0, 16);
		endDate = endDate.replaceAll("-", "/").substring(0, 16);
		
		data.put("startDate", startDate);
		data.put("endDate", endDate);
		data.put("realWriter", realWriter);
		int result = calenderDao.deleteCalender(data, sqlSession);
		return result;
	}

	@Override
	public String selectColor(String selectColor) {
		return calenderDao.selectColor(selectColor, sqlSession);
	}

	@Override
	public void updateCalender(Calender calender, String startTime, String endTime) {
		calender = calender.changeDate(calender, startTime, endTime);
		
		int result = calenderDao.updateCalender(calender, sqlSession);
	}

	@Override
	public void updateCalender(Calender calender) {
		String startTime = "";
		String endTime = "";
		calender = calender.changeDate(calender, startTime, endTime);
		
		int result = calenderDao.updateCalender(calender, sqlSession);
	}

	@Override
	public ArrayList<Calender> selectCalenderSearchList(String searchWord, Member loginUser) {
		
		searchWord = searchWord.replaceAll(" ", "&nbsp");
		Map<String, String> data = new HashMap<String, String>();
		data.put("searchWord", searchWord);
		data.put("empNo", String.valueOf(loginUser.getEmpNo()));
		data.put("departmentNo", loginUser.getDepartmentNo());
		
		ArrayList<Calender> cList = calenderDao.selectCalenderSearchList(data, sqlSession);
		
		return cList;
	}


}
