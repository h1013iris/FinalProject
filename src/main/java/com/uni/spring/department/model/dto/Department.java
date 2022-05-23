package com.uni.spring.department.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data//setter, getter, tostring생성
@NoArgsConstructor//파라미터가 없는 기본생성자 생성
@AllArgsConstructor//모든 파라미터가 있는 기본 생성자 생성
public class Department {

	private int annoNo;//게시판 번호
	private int refDepart;//참조 부서 코드 
	private int annoWR;//작성자 사원 번호 
	private String writerName;//작성자 이름
	private String annoTitle;//공지사항 제목
	private String annoContent;//공지사항 내용
	private String accessReply;//댓글 사용 여부
	private Date annoDate;//작성일
	private String status;//상태값
	
}
