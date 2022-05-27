package com.uni.spring.calender.model.dto;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
public class DateData {

	String year = ""; 		// 년도
	String month = "";		// 월
	String date = "";		// 일
	String value = "";		// today, nomaldate
	String schedule = "";	// 
	String schedule_detail = "";	// 상세

	public DateData() {
	}

	// 달력만 사용시 사용될 생성자
	public DateData(String year, String month, String date, String value) {
		if ((month != null && month != "") && (date != null && date != "")) {
			this.year = year;
			this.month = month;
			this.date = date;
			this.value = value;
		}
	}
	
	// 스케줄 사용시 사용될 생성자
	public DateData(String year, String month, String date, String value, String schedule, String schedule_detail) {

		this.year = year;
		this.month = month;
		this.date = date;
		this.value = value;
		this.schedule = schedule;
		this.schedule_detail = schedule_detail;

	}
	
	// 날짜에 관련된 달력정보를 가지는 메서드
	public Map<String, Integer> today_info(DateData dateData) {
		
		// 날짜 캘린더 함수에 삽입.
		Map<String, Integer> today_Data = new HashMap<String, Integer>();
		Calendar cal = Calendar.getInstance(); // 생성
		cal.set(Integer.parseInt(dateData.getYear()), Integer.parseInt(dateData.getMonth()), 1); // ㅇ

		// 시작하는 일자
		int startDay = cal.getMinimum(java.util.Calendar.DATE);
		// 끝나는 일자
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		// 시작하는 요일
		int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
		
		// 오늘 생성
		Calendar todayCal = Calendar.getInstance();
		// 년도와 월을 포맷함  
		SimpleDateFormat ysdf = new SimpleDateFormat("yyyy");
		SimpleDateFormat msdf = new SimpleDateFormat("M");

		// 오늘자의 년도
		int today_year = Integer.parseInt(ysdf.format(todayCal.getTime()));
		// 오늘자의 월
		int today_month = Integer.parseInt(msdf.format(todayCal.getTime()));

		// 검색 년도(첫 시작은 오늘 년도이다. 이후 화살표표시 클릭시 이동할 검색날짜)
		int search_year = Integer.parseInt(dateData.getYear());
		// 검색 월(첫 시작은 오늘 년도이다. 이후 화살표표시 클릭시 이동할 검색날짜)
		int search_month = Integer.parseInt(dateData.getMonth()) + 1;

		int today = -1; // 오늘 일자(dd) 생성
		
		// 오늘 년도와 검색년도가 같고 오늘 월과 검색 월이 같으면 
		if (today_year == search_year && today_month == search_month) {
			// 포맷을 일자만 생성
			SimpleDateFormat dsdf = new SimpleDateFormat("dd");
			// 오늘에 오늘 일자 넣음(dd)
			today = Integer.parseInt(dsdf.format(todayCal.getTime()));
		}
		
		// 검색 월에 -1한 값 넣기
		search_month = search_month-1; 
		
		Map<String, Integer> before_after_calendar = before_after_calendar(search_year,search_month);
		
		//날짜 관련
		System.out.println("search_month : " + search_month);
		// 캘린더 함수 end
		today_Data.put("start", start);
		today_Data.put("startDay", startDay);
		today_Data.put("endDay", endDay);
		today_Data.put("today", today);
		today_Data.put("search_year", search_year);
		today_Data.put("search_month", search_month+1);
		today_Data.put("before_year", before_after_calendar.get("before_year"));
		today_Data.put("before_month", before_after_calendar.get("before_month"));
		today_Data.put("after_year", before_after_calendar.get("after_year"));
		today_Data.put("after_month", before_after_calendar.get("after_month"));
		return today_Data;
	}
	
	//이전달 다음달 및 이전년도 다음년도
	private Map<String, Integer> before_after_calendar(int search_year, int search_month){
		Map<String, Integer> before_after_data = new HashMap<String, Integer>();
		int before_year = search_year;
		int before_month = search_month-1;
		int after_year = search_year;
		int after_month = search_month+1;

		if(before_month<0){
			before_month=11;
			before_year=search_year-1;
		}
		
		if(after_month>11){
			after_month=0;
			after_year=search_year+1;
		}
		
		before_after_data.put("before_year", before_year);
		before_after_data.put("before_month", before_month);
		before_after_data.put("after_year", after_year);
		before_after_data.put("after_month", after_month);
		
		return before_after_data;
	}

	@Override
	public String toString() {
		return "DateData [year=" + year + ", month=" + month + ", date=" + date + ", value=" + value + "]";
	}

}
