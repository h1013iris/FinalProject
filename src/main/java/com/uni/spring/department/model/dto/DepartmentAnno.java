package com.uni.spring.department.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data//setter, getter, tostring생성
@NoArgsConstructor//파라미터가 없는 기본생성자 생성
@AllArgsConstructor//모든 파라미터가 있는 기본 생성자 생성
public class DepartmentAnno {

	private int annoNo;//게시판 번호
	private int refDepart;//참조 부서 코드 
	private int annoWR;//작성자 사원 번호 
	private String writerName;//작성자 이름
	private String writerJo;//직위
	private String annoTitle;//공지사항 제목
	private String annoContent;//공지사항 내용
	private String accessReply;//댓글 사용 여부
	private Date annoDate;//작성일
	private String annoChangeDate;//작성일 두번째
	private String status;//상태값
	private int count;//조회수
	private String attachStatus;//첨부파일 상태값
	
	/*이전 게시판 , 이후 게시판 번호*/
	private int nextNo;//이후게시판(현재꺼 다음꺼)
	private int prevNo;//이전 게시판(현재꺼 이전꺼)
}
