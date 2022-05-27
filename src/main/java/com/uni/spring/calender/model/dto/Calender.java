package com.uni.spring.calender.model.dto;

import lombok.Data;

@Data
public class Calender {

	private String startDate;		// 시작일시 - not null
	private String endDate;			// 종료일시 - not null
	private String writerNo;		// 작성자번호 - not null
	private String sectionOption;	// 구분번호(업무,외근,회의,휴가,기타) - not null
	private String selectColor;		// 범주번호(색상) - not null
	private String title;			// 일정명 - not null
	private String openOption;		// 공개여부 - not null
	private String alarm;			// 알림(안함, 10분전, 15분전, 30분전) - null
	private String place;			// 장소 - null
	private String memo;			// 메모 - null
	private String status;			// 상태값(Y,N) - not null(default 'Y')
	
	private String oneday;			// 하루종일 체크여부

	
	/*	START_DATE
		END_DATE
		EMP_NO
		SECTION_NUM
		COLOR_NUM
		DATE_NAME
		PUBLIC_RANGE
		NOTICE_TIME
		PLACE
		MEMO
		STATUS	*/
	
	// 시작일에 시간 합치고 종료일에 시간 합치기
	public Calender changeDate(Calender calender, String startTime, String endTime) {
		
		//Calender day = date.replace("-", "/").concat(" "+time);
		
		Calender day = calender;
		
		if(!startTime.isEmpty() && !endTime.isEmpty()) {
			day.setStartDate(calender.getStartDate().replace("-", "/").concat(" "+startTime));
			day.setEndDate(calender.getEndDate().replace("-", "/").concat(" "+endTime));
		}else {
			startTime = "00:00";
			endTime = "11:59";
			day.setStartDate(calender.getStartDate().replace("-", "/").concat(" "+startTime));
			day.setEndDate(calender.getStartDate().replace("-", "/").concat(" "+endTime));
		}
		
		System.out.println(day);
		
		return day;
	}
	
	
}
