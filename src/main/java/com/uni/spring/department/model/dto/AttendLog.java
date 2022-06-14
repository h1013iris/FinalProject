package com.uni.spring.department.model.dto;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendLog {
	
	private int attendNo; // 근태 순번
	private int empNo; // 사원 번호
	private Date attendDate; // 출입 날짜
	private Date attendTime; // 출근 시간
	private Date leaveTime; // 퇴근 시간
	private String attendStatus; // 근무 상태
	private String status; // 상태값
	private String cal;
	private String empName;//이름
	
	private String attendTime2;
	private String leaveTime2; 
	
	//경영지원 값 가져올때 사용할 것
	private String emp;//사원명 
	private int mon;//월요일
	private int tue;//화요일
	private int wen;//수요일
	private int tur;//목요일
	private int fri;//금요일
	private String mon1;//월요일
	private String tue2;//화요일
	private String wen3;//수요일
	private String tur4;//목요일
	private String fri5;//금요일
	private String tot;//최종
	
	//받아온 값을 h m형식으로 변환
	public AttendLog attendList(AttendLog a) {
		String mon1 =null;String tue2 =null;String wen3 =null;String tur4 =null;String fri5 =null;
		mon1 = String.valueOf(Math.round(a.getMon()/60))+"H "+String.valueOf(a.getMon()%60)+"m";
		tue2 = String.valueOf(Math.round(a.getTue()/60))+"H "+String.valueOf(a.getTue()%60)+"m";
		wen3 = String.valueOf(Math.round(a.getWen()/60))+"H "+String.valueOf(a.getWen()%60)+"m";
		tur4 = String.valueOf(Math.round(a.getTur()/60))+"H "+String.valueOf(a.getTur()%60)+"m";
		fri5 = String.valueOf(Math.round(a.getFri()/60))+"H "+String.valueOf(a.getFri()%60)+"m";
		String tot = String.valueOf(Math.round((a.getMon()+a.getTue()+a.getWen()+a.getTur()+a.getFri())/60)) +"H "+
					String.valueOf((a.getMon()+a.getTue()+a.getWen()+a.getTur()+a.getFri())%60)+"m";
		AttendLog al = new AttendLog();
		al.setEmp(a.getEmp());
		al.setMon1(mon1);al.setTue2(tue2);al.setWen3(wen3);
		al.setTur4(tur4); al.setFri5(fri5);
		al.setTot(tot); al.setEmpNo(a.getEmpNo());
		return al;
	}
}
