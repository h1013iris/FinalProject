package com.uni.spring.calender.model.service;

import java.util.ArrayList;

import com.uni.spring.calender.model.dto.Calender;
import com.uni.spring.member.model.dto.Member;

public interface CalenderService {

	void insertCalender(Calender calender);

	void insertCalender(Calender calender, String startTime, String endTime);

	ArrayList<Calender> selectList(Member loginUser);

	
}
