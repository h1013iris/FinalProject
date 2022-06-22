package com.uni.spring.calender.model.dto;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
public class DateData {

	private String year; 			// 년도
	private String month;			// 월
	private String date;			// 일
	private String value;			// today, nomaldate
	private String schedule;		// 일정명
	private String todaySchedule;	// 오늘 일정

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
	public DateData(String year, String month, String date, String value, String schedule, String todaySchedule) {

		this.year = year;
		this.month = month;
		this.date = date;
		this.value = value;
		this.schedule = schedule;
		this.todaySchedule = todaySchedule;

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

		// 검색 년도(첫 시작은 오늘 년도이다. 이후 화살표표시 클릭시 이동할 검색날짜로바뀜)
		int search_year = Integer.parseInt(dateData.getYear());
		// 검색 월(첫 시작은 오늘 년도이다. 이후 화살표표시 클릭시 이동할 검색날짜)
		int search_month = Integer.parseInt(dateData.getMonth()) + 1;

		int today = 0; // 오늘 일자(dd) 생성
		
		// 오늘 년도와 검색년도가 같고 오늘 월과 검색 월이 같으면 
		if (today_year == search_year && today_month == search_month) {
			// 포맷을 일자만 생성
			SimpleDateFormat dsdf = new SimpleDateFormat("dd");
			// 오늘에 오늘 일자 넣음(dd)
			today = Integer.parseInt(dsdf.format(todayCal.getTime()));
		}
		
		// 검색 월에 -1한 값 넣기
		search_month = search_month-1; 
		
		// 이전달 다음달 및 이전년도 다음년도 리턴값 받기
		Map<String, Integer> before_after_calendar = before_after_calendar(search_year,search_month);
		
		// 캘린더 함수 end
		today_Data.put("start", start); //시작요앨
		today_Data.put("startDay", startDay); // 시작하는 일자
		today_Data.put("endDay", endDay); // 끝나는 일자
		today_Data.put("today", today); // 오늘
		today_Data.put("search_year", search_year); // 검색년도
		today_Data.put("search_month", search_month+1); // 검색달
		today_Data.put("before_year", before_after_calendar.get("before_year")); // 이전 년도 
		today_Data.put("before_month", before_after_calendar.get("before_month")); // 이전 달
		today_Data.put("after_year", before_after_calendar.get("after_year")); // 다음 년도
		today_Data.put("after_month", before_after_calendar.get("after_month")); // 다음 달
		return today_Data;
	}
	
	//이전달 다음달 및 이전년도 다음년도
	private Map<String, Integer> before_after_calendar(int search_year, int search_month){
		Map<String, Integer> before_after_data = new HashMap<String, Integer>();
		int before_year = search_year; // 이전년도
		int before_month = search_month-1; // 이전 달
		int after_year = search_year; // 다음 년도
		int after_month = search_month+1; // 다음 달

		// 만약 이전 달이 0보다 작으면
		if(before_month<0){
			before_month=11; // 12월로 넘어가기
			before_year=search_year-1; // 검색 년도에서 -1 을 해 이전 년도에 넣기
		}
		
		// 만약 다음 달이 12월보다 크면
		if(after_month>11){
			after_month=0; // 다음달에 0을 담고
			after_year=search_year+1; // 다음 년도에 +1해 다음년도에 넣기
		}
		
		// 이전년도 이전달, 다음년도 다음달 넣고
		before_after_data.put("before_year", before_year);
		before_after_data.put("before_month", before_month);
		before_after_data.put("after_year", after_year);
		before_after_data.put("after_month", after_month);
		
		//리턴
		return before_after_data;
	}

	@Override
	public String toString() {
		return "DateData [year=" + year + ", month=" + month + ", date=" + date + ", value=" + value + "]";
	}

}
