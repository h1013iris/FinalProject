package com.uni.spring.calender.model.service;

import com.uni.spring.calender.model.dto.Calender;

public interface CalenderService {

	void insertCalender(Calender calender);

	void insertCalender(Calender calender, String startTime, String endTime);

	
}
