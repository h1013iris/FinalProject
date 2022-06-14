package com.uni.spring.manageMent.model.dto;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class calendarWeek {
	private String monWeek;//이번주의 월요일
	private String tueWeek;//이번주의 화요일
	private String wenWeek;//이번주의 수요일
	private String thiWeek;//이번주의 목요일
	private String friWeek;//이번주의 금요일
	private String weeko;//이번주의 월요일 일월년
	private String weekt;
	private String weekh;
	private String weeku;
	private String weekf;//이번주의 월요일 일월년
	
	//이번주 구하는 것
	public calendarWeek selectThisWeek() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd"); //타입을 맞추기위한 객체
		SimpleDateFormat sdd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar ca = Calendar.getInstance(); //캘린더 객체 생성
		
		
		ca.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);//월요일날자
		String monWeek = sdf.format(ca.getTime()) ;//월요일날짜
		ca.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);//화요일
		String tueWeek = sdf.format(ca.getTime());//이번주의 화요일
		ca.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);//수요일
		String wenWeek = sdf.format(ca.getTime()) ;//수요일
		ca.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);//목요일
		String thiWeek = sdf.format(ca.getTime());//이번주의 목요일
		ca.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);//금요일날자
		String friWeek = sdf.format(ca.getTime());//이번주의 금요일
		
		ca.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);//월요일날자
		String weeko = sdd.format(ca.getTime());
		ca.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);//월요일날자
		String weekt = sdd.format(ca.getTime());
		ca.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);//월요일날자
		String weekh = sdd.format(ca.getTime());
		ca.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);//월요일날자
		String weeku = sdd.format(ca.getTime());
		ca.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);//금요일날자
		String weekf = sdd.format(ca.getTime());
		
		ca.add(Calendar.DATE, -7);
		ca.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		String weekq = sdd.format(ca.getTime());
		System.out.println("저번주"+weekq);
		calendarWeek cw = new calendarWeek(monWeek, tueWeek, wenWeek, thiWeek, friWeek, weeko, weekt, weekh, weeku, weekf);
		System.out.println(cw.toString());
		System.out.println((ca.get(Calendar.WEEK_OF_MONTH)-1));
		return cw;
	}
}
