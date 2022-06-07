package com.uni.spring.calender.model.dto;

import lombok.Data;

@Data
public class Calender {

	private String startDate;		// 시작일시 - not null
	private String endDate;			// 종료일시 - not null
	private String writerNo;		// 작성자번호 - not null
	private String department;		// 부서명
	private String sectionOption;	// 구분번호(업무,외근,회의,휴가,기타) - not null
	private String selectColor;		// 범주번호(색상) - not null
	private String title;			// 일정명 - not null
	private String openOption;		// 공개여부 - not null
	private String alarm;			// 알림(안함, 10분전, 15분전, 30분전) - null
	private String place;			// 장소 - null
	private String memo;			// 메모 - null
	private String status;			// 상태값(Y,N) - not null(default 'Y')
	private String realWriter;		// 진짜작성자
	
	private String oneday;			// 하루종일 체크여부
	private String sectionName;		// 구분이름
	private String editStartDate;	// 수정전 시작일
	private String editEndDate;		// 수정전 종료일
	private String editWriterNo;	// 수정전 공개여부 작성자번호

	
	/*	START_DATE
		END_DATE
		WRITER_NO
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
		
		// 수정하기여서 존재하면
		if(!calender.getEditEndDate().isEmpty() && !calender.getEditStartDate().isEmpty() && !calender.getEditWriterNo().isEmpty()) {

			System.out.println(day.getEditStartDate());
			System.out.println(day.getEditEndDate());
			
			day.setEditStartDate(calender.getEditStartDate().replace("-", "/").replace(":00.0", ""));
			day.setEditEndDate(calender.getEditEndDate().replace("-", "/").replace(":00.0", ""));
			day.setEditWriterNo(calender.getEditWriterNo().replace("-", "/"));
			
			System.out.println(day.getEditStartDate());
			System.out.println(day.getEditEndDate());
		}
		
		if(!startTime.isEmpty() && !endTime.isEmpty()) {
			day.setStartDate(calender.getStartDate().replace("-", "/").concat(" "+startTime));
			day.setEndDate(calender.getEndDate().replace("-", "/").concat(" "+endTime));
		}else {
			startTime = "00:00";
			endTime = "11:59";
			String date = calender.getStartDate();
			day.setStartDate(date.replace("-", "/").concat(" "+startTime));
			day.setEndDate(date.replace("-", "/").concat(" "+endTime));
		}
		
		System.out.println(day);
		
		return day;
	}
	
	// 년도,월,일, 시간 분리 하는 메소드
	public DateData decDate(String calender) {
		DateData dec = new DateData(); // 생성자 생성
		
		String date; // 일자
		String[] day; // 년,월,일 나누기 위한 것
		
		date = calender; // (시간포함)

		// 일자 분리
		day = date.split(" ");
		
		// 날짜담음
		date = day[0];
		
		// 년 월 일 분리
		day = date.split("-");
		
		//임의 값 확인
		for(int i = 0 ; i < day.length ; i++) {
			System.out.println("년 월 일 확인 ==> "+day[i]);
		}
		
		// deteDeta에 년월일 담기
		dec.setYear(day[0]);
		dec.setMonth(day[1]);
		dec.setDate(day[2]);
		
		return dec;
	}
	
}
