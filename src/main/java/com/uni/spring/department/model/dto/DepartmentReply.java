package com.uni.spring.department.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DepartmentReply {

	//공지사항 댓글과 세미 프로젝트 댓글을 저장하는 곳
	private int replyNo;//댓글 번호 
	private int refDepartNo;//참조 공지사항 번호, 참조 세부 프로젝트 번호 
	private int replyWriter;//댓글 작성자 
	private String writerName;//작성자 이름
	private String writerJo;//직위
	private String replyTitle;//댓글 내용
	private Date createDate;//작성일
	private String wrDate;//작성일 
	private String status;//상태값(디폴트 'y
}
