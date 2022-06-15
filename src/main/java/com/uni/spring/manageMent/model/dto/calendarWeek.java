package com.uni.spring.manageMent.model.dto;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import lombok.Data;

@Data
public class calendarWeek {
	private String monWeek;//이번주의 월요일 &&첫주 시작날짜
	private String tueWeek;//이번주의 화요일 &&두번째주 시작 날짜
	private String wenWeek;//이번주의 수요일 && 세번째주 시작날짜
	private String thiWeek;//이번주의 목요일 &&네번째주 시작 날짜
	private String friWeek;//이번주의 금요일 &&다섯번째주 시작 날짜
	private String weeko;//이번주의 월요일 일월년
	private String weekt;
	private String weekh;
	private String weeku;
	private String weekf;//이번주의 월요일 일월년
	
	public calendarWeek() {
		// TODO Auto-generated constructor stub
	}
	public calendarWeek(String monWeek, String tueWeek) {
		super();
		this.monWeek = monWeek;
		this.tueWeek = tueWeek;
	}
	
	
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
	
	//첫날 나중에날 가져오기
	public calendarWeek changeList(String fd) {
		calendarWeek cw = new calendarWeek();
		SimpleDateFormat sdd = new SimpleDateFormat("yy/MM/dd");
		SimpleDateFormat std = new SimpleDateFormat("yyyy-MM-dd");
		
		
		/*for (String s : fd) {
			Date date = new Date();
			try {
				date = std.parse(s);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			date = new Date(date.getTime() + (1000 * 60 * 60 * 24 - 1)); 
			ca.setTime(date);
			ca.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);//금요일날자
			String  a = sdd.format(ca.getTime());//첫번째주 금요일
			cw.add(new calendarWeek(sdd.format(s),a));
		}*/
		String[] sl = fd.split(",");
		cw.setMonWeek(sl[0]);cw.setTueWeek(sl[1]);cw.setWenWeek(sl[2]);
		cw.setThiWeek(sl[3]);cw.setFriWeek(sl[4]);
		
		System.out.println(cw.toString());
		
		Calendar ca = Calendar.getInstance(); //캘린더 객체 생성
		Date date = new Date();
		Date date1 = new Date();
		Date date2 = new Date();
		Date date3 = new Date();
		Date date4 = new Date();
		try {
			date = sdd.parse(cw.getMonWeek());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			date1 = sdd.parse(cw.getTueWeek());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			date2 = sdd.parse(cw.getWenWeek());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			date3 = sdd.parse(cw.getThiWeek());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			date4 = sdd.parse(cw.getFriWeek());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		date = new Date(date.getTime() + (1000 * 60 * 60 * 24 - 1)); 
		date1 = new Date(date1.getTime() + (1000 * 60 * 60 * 24 - 1)); 
		date2 = new Date(date2.getTime() + (1000 * 60 * 60 * 24 - 1)); 
		date3 = new Date(date3.getTime() + (1000 * 60 * 60 * 24 - 1)); 
		date4 = new Date(date4.getTime() + (1000 * 60 * 60 * 24 - 1));
		System.out.println(date);
		System.out.println(date1);
		System.out.println(date2);
		System.out.println(date3);
		System.out.println(date4);
		ca.setTime(date);
		ca.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);//금요일날자
		String  a = sdd.format(ca.getTime());//첫번째주 금요일
		ca.setTime(date1);
		ca.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);//금요일날자
		String  a1 = sdd.format(ca.getTime());//두번째주 금요일
		ca.setTime(date2);
		ca.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);//금요일날자
		String  a2 = sdd.format(ca.getTime());//세번째주 금요일
		ca.setTime(date3);
		ca.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);//금요일날자
		String  a3 = sdd.format(ca.getTime());//네번째주 금요일
		ca.setTime(date4);
		ca.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);//금요일날자
		String  a4 = sdd.format(ca.getTime());//다번째주 금요일
		cw.setWeeko(a);cw.setWeekt(a1);cw.setWeekh(a2);cw.setWeeku(a3);cw.setWeekf(a4);
		
		return cw;
	}


	public calendarWeek(String monWeek, String tueWeek, String wenWeek, String thiWeek, String friWeek, String weeko,
			String weekt, String weekh, String weeku, String weekf) {
		super();
		this.monWeek = monWeek;
		this.tueWeek = tueWeek;
		this.wenWeek = wenWeek;
		this.thiWeek = thiWeek;
		this.friWeek = friWeek;
		this.weeko = weeko;
		this.weekt = weekt;
		this.weekh = weekh;
		this.weeku = weeku;
		this.weekf = weekf;
	}

	
}
