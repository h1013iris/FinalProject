package com.uni.spring.common;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Alarm {

	private int alm_no;//알림 번호
	private int refCatNo;//참조 분류 순서
	private int sender;//발신자
	private int receiver;//수신자
	private String almContent;//알림 내용
	private Date createDate;//생성시간
	private String almCheck;//알림 확인 유무
}
