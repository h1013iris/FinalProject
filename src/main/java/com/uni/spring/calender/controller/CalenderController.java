package com.uni.spring.calender.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uni.spring.calender.model.dto.Calender;
import com.uni.spring.calender.model.dto.DateData;
import com.uni.spring.calender.model.service.CalenderService;
import com.uni.spring.member.model.dto.Member;

@Controller
public class CalenderController {
	
	@Autowired
	public CalenderService calenderService;

	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData){
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		
		//검색 날짜(첫 시작은 오늘날짜이다. 이후 화살표표시 클릭시 이동할 검색날짜로 된다)
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		
		//검색 날짜 end
		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
				
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return "calender/calender";
	}
	
	@RequestMapping(value = "enrollFormCalender.do")
	public String enrollFormCalender() {
		return "calender/calenderEnrollForm";
	}
	
	@RequestMapping(value = "insertCalender.do", method = RequestMethod.POST)
	public String insertCalender(Calender calender, String startTime, String endTime) {
		System.out.println("controller 캘린더 insert ==> "+calender);
		System.out.println("시작 시간 ==> "+startTime+" 종료시간 ==> " +endTime);
		System.out.println(calender.getOneday());
		if(calender.getOneday() == null) {
			System.out.println("들어와라");
			calenderService.insertCalender(calender, startTime, endTime);
		}else {
			calenderService.insertCalender(calender);
		}
		return "redirect:calendar.do";
	}
}
