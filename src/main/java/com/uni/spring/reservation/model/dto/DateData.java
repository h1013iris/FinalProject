package com.uni.spring.reservation.model.dto;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
		Calendar cal = GregorianCalendar.getInstance(); // 생성
		cal.set(Integer.parseInt(dateData.getYear()), Integer.parseInt(dateData.getMonth()), 1); // ㅇ

		// 시작하는 일자
		int startDay = cal.getMinimum(java.util.Calendar.DATE);
		// 끝나는 일자
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		// 시작하는 요일
		int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
		
		
		// 오늘 생성
		GregorianCalendar todayCal = new GregorianCalendar();
		// 년도와 월을 포맷함  
		SimpleDateFormat ysdf = new SimpleDateFormat("yyyy");
		SimpleDateFormat msdf = new SimpleDateFormat("M");

		// 오늘자의 년도
		int todayYear = Integer.parseInt(ysdf.format(todayCal.getTime()));
		// 오늘자의 월
		int todayMonth = Integer.parseInt(msdf.format(todayCal.getTime()));

		// 검색 년도(첫 시작은 오늘 년도이다. 이후 화살표표시 클릭시 이동할 검색날짜로바뀜)
		int searchYear = Integer.parseInt(dateData.getYear());
		// 검색 월(첫 시작은 오늘 년도이다. 이후 화살표표시 클릭시 이동할 검색날짜)
		int searchMonth = Integer.parseInt(dateData.getMonth()) + 1;

		int today = 0; // 오늘 일자(dd) 생성
		
		// 오늘 년도와 검색년도가 같고 오늘 월과 검색 월이 같으면 
		if (todayYear == searchYear && todayMonth == searchMonth) {
			// 포맷을 일자만 생성
			SimpleDateFormat dsdf = new SimpleDateFormat("dd");
			// 오늘에 오늘 일자 넣음(dd)
			today = Integer.parseInt(dsdf.format(todayCal.getTime()));
		}
		
		// 검색 일(첫 시작은 오늘 년도이다. 이후 화살표표시 클릭시 이동할 검색날짜로바뀜)
		int searchDate = Integer.parseInt(dateData.getDate());
		
		
		// 검색 월에 -1한 값 넣기
		searchMonth = searchMonth-1; 
		
		// 이전달 다음달 및 이전년도 다음년도 리턴값 받기
		Map<String, Integer> before_after_calendar = before_after_calendar(searchYear,searchMonth, searchDate, endDay);
		
		//날짜 관련
		System.out.println("searchDate : " + searchDate);
		// 캘린더 함수 end
		today_Data.put("start", start); //시작요앨
		today_Data.put("startDay", startDay); // 시작하는 일자
		today_Data.put("endDay", endDay); // 끝나는 일자
		today_Data.put("today", today); // 오늘
		today_Data.put("searchYear", before_after_calendar.get("searchYear")); // 검색년도 -> 1월에서 12월로, 12월에서 1월로 위해
		today_Data.put("searchMonth", searchMonth+1); // 검색달
		today_Data.put("searchDate", searchDate); // 검색달
		today_Data.put("beforeYear", before_after_calendar.get("beforeYear")); // 이전 년도 
		today_Data.put("beforeMonth", before_after_calendar.get("beforeMonth")); // 이전 달
		today_Data.put("beforeDate", before_after_calendar.get("beforeDate")); // 다음 일
		today_Data.put("afterYear", before_after_calendar.get("afterYear")); // 다음 년도
		today_Data.put("afterMonth", before_after_calendar.get("afterMonth")); // 다음 달
		today_Data.put("afterDate", before_after_calendar.get("afterDate")); // 다음 일
		return today_Data;
	}
	
	//이전달 다음달 및 이전년도 다음년도
	private Map<String, Integer> before_after_calendar(int searchYear, int searchMonth, int searchDate, int endDay){
		Map<String, Integer> before_after_data = new HashMap<String, Integer>();
		int beforeYear = searchYear-1; // 이전년도
		int beforeMonth = searchMonth-1; // 이전 달
		int beforeDate = searchDate-1;	// 이전 일
		int afterYear = searchYear+1; // 다음 년도
		int afterMonth = searchMonth+1; // 다음 달
		int afterDate = searchDate+1; // 다음일

		System.out.println("거치기 전 searchYear : " + searchYear);
		System.out.println("거치기 전 searchMonth : " + searchMonth);
		System.out.println("거치기 전 searchDate : " + searchDate);
		System.out.println("거치기 전 beforeYear : " + beforeYear);
		System.out.println("거치기 전 beforeMonth : " + beforeMonth);
		System.out.println("거치기 전 beforeDate : "+ beforeDate);
		System.out.println("거치기 전 afterYear : " + afterYear);
		System.out.println("거치기 전 afterMonth : "+ afterMonth);
		System.out.println("거치기 전 afterDate : "+ afterDate);
		

		// 일이 넘어갔다? 그럼 달 바꾸기
		
		// 다음일이 마지막일을 넘어서면 ( 다음달로 넘어가면 )
		if(afterDate > endDay) {
			System.out.println("다음일이 이번달의 마지막일을 넘어섬");
			
			// 다음 일을 1로
			afterDate = 1;
			// 다음 월을 검색일 +1
			afterMonth = searchMonth+1;
		}
		

		// ex) 현재일 : 3월 31일
		// 전월의 마지막날 = 2월의 마지막 날
		// ex) 현재일 : 1월 31일
		// --> 이전달이 0이됨 -1이자너 그럼 에러가 남
		// ㄴ> 이걸 막으려면 먼저 월 체크 부터 해야함
		
		// 검색월의 이전달 마지막일
		int beforeMonthEndDay = 0;
		// 검색월이 2월과 12월 사이이면 
		if(searchMonth >= 1 && searchMonth <= 11) {
			// 생성
			Calendar cal = new GregorianCalendar(searchYear, beforeMonth, 1); // 이전달
			// 검색월의 이전달 마지막일 초기화
			beforeMonthEndDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			System.out.println((beforeMonth+1)+"월의 이전 달 마지막 일 : " + beforeMonthEndDay);
		}else if(searchMonth == 0){ 
			// 1월로 넘어가면 12월의 마지막 날을 구하기
			Calendar cal = new GregorianCalendar(searchYear-1, 11, 1); // 이전달
			// 검색월의 이전달 마지막일 초기화
			beforeMonthEndDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			System.out.println(12+"월의 이전 달 마지막 일 : " + beforeMonthEndDay);
		}
		
		// 이전일이 1일보다 적으면 ( 이전달로 넘어가면 )
		// ex) 3월 31일 -> 2월 28일
		if(beforeDate < 1) {
			System.out.println("이전일이 검색달의 첫 일보다 작음");
			// 이전일에 마지막 일을 넣고
			beforeDate = beforeMonthEndDay;
		}
		
		// 이전달이 0보다 작거나 12보다 크면
		// 12 -> 1
		if(beforeMonth < 0){
			// 12월로 넘어가기
			beforeMonth=11;
		}
		

		// 만약 다음 달이 1월보다 작거나 다음 달이 12월보다 크면
		// 1 -> 12
		if(afterMonth>11){
			// 다음달에 1월로 세팅
			afterMonth = 0;
		}
		

		System.out.println();
		System.out.println("거친 후 searchYear : " + searchYear);
		System.out.println("거친 후 beforeYear : " + beforeYear);
		System.out.println("거친 후 beforeMonth : " + beforeMonth);
		System.out.println("거친 후 beforeDate : "+ beforeDate);
		System.out.println("거친 후 afterYear : " + afterYear);
		System.out.println("거친 후 afterMonth : "+afterMonth);
		System.out.println("거친 후 afterDate : "+afterDate);
		
		
		// 이전년도 이전달, 다음년도 다음달 넣고
		before_after_data.put("searchYear", searchYear);
		before_after_data.put("searchMonth", searchMonth);
		before_after_data.put("searchDate", searchDate);
		before_after_data.put("beforeYear", beforeYear);
		before_after_data.put("beforeMonth", beforeMonth);
		before_after_data.put("beforeDate", beforeDate);
		before_after_data.put("afterYear", afterYear);
		before_after_data.put("afterMonth", afterMonth);
		before_after_data.put("afterDate", afterDate);
		
		//리턴
		return before_after_data;
	}

	@Override
	public String toString() {
		return "DateData [year=" + year + ", month=" + month + ", date=" + date + ", value=" + value + "]";
	}

}
