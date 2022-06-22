package com.uni.spring.manageMent.model.dto;

import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class calculateSalary {
	private int salary;//급여
	private String gukmin;//국민연금 
	private String gukHalf;//국민연금 반
	private String gungan;//건강보험
	private String gunHalf;//건강보험 반
	private String gunGangi;//건강보험(장기요양)
	private String gunGHalf;//건강보험 장기요양 반
	private String goyoung;//고용보험(근로자)
	private String goyoungH;//고용보험(사업주)
	private String gyAgyh;//고용보험 합
	private String totalV;//합계(보험료 총액)
	private String emptot;//근로자 합계
	private String imtot;//사업주 합계
	
	public calculateSalary calcugukmin(int salary, int count) {
		DecimalFormat formatter = new DecimalFormat("###,###,###,###");
		double gukmin = 0; double gungan, gunGangi, goyoung, goyoungH, totalV, emptot, imtot  =0;
		//국민연금 계산
		if(salary <330000){
			gukmin=330000*0.09;
		}else if(salary >=330000 && salary <=5240000) {
			gukmin = salary*0.09;
		}else if(salary > 5240000) {
			gukmin = 5240000*0.09;
		}
		
		//건강보험 계산
		gungan = salary *0.0699;
		
		//건강보험(장기요양)
		gunGangi = gungan*0.1227;
		
		//고용보험
		goyoung = salary * 0.008;
		if(count < 150) {
			goyoungH = salary *(0.008+0.0025);
		}else if(count >= 150 && count <1000) {
			goyoungH = salary *(0.008+0.0065);
		}else {
			goyoungH = salary *(0.008+0.0085);
		}
		emptot = gukmin/2+gungan/2+gunGangi/2+goyoung;
		imtot = gukmin/2+gungan/2+gunGangi/2+goyoungH;
		totalV = emptot+imtot;
		String guk = String.valueOf(formatter.format(gukmin));//국민연금
		String gukHalf =String.valueOf(formatter.format(gukmin/2));//국민연금 반
		String gun = String.valueOf(formatter.format(gungan));//건강보험 계산
		String gunHalf = String.valueOf(formatter.format(gungan/2));//건강보험 반
		String gg = String.valueOf(formatter.format(gunGangi));//건강보험(장기요양)
		String gunGHalf = String.valueOf(formatter.format(gunGangi/2));//건강보험 요양 반
		String gy = String.valueOf(formatter.format(goyoung));//고용보험(근로자)
		String gyh = String.valueOf(formatter.format(goyoungH));//고용보험(사업주)
		String gyAgyh = String.valueOf(formatter.format(goyoung+goyoungH));//고용보험 합
		String ttv = String.valueOf(formatter.format(totalV));//합계(보험료 총액)
		String ept = String.valueOf(formatter.format(emptot));//근로자 합계
		String imt = String.valueOf(formatter.format(imtot));//사업주 합계
		
		
		calculateSalary cs = new calculateSalary(salary, guk, gukHalf, gun, gunHalf, gg, gunGHalf, gy, gyh, gyAgyh , ttv, ept, imt );
		return cs;
	}
}
