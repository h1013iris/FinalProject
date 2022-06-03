package com.uni.spring.calender.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.spring.calender.model.dto.Calender;
import com.uni.spring.common.DepartmentManagement;
import com.uni.spring.member.model.dto.Member;

public interface CalenderService {

	void insertCalender(Calender calender);

	void insertCalender(Calender calender, String startTime, String endTime);

	ArrayList<Calender> selectList(Member loginUser, Map<String, Integer> today_info);

	DepartmentManagement selectDepartment(String departmentNo);

	Calender selectCalenderDetailView(String startDate, String endDate, String writerNo);

	
}
