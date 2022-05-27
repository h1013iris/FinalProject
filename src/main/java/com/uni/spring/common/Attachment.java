package com.uni.spring.common;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Attachment {
	private int fileNo;//파일번호
	private int refListCatNo;//참조 분류 번호  
	private int largeCat;//게시글 번호
	private String originName;//파일 원본명
	private String changeName;//파일 수정명
	private Date uploadDate;//파일 업로드일
	private String status;//파일 상태값
	

	public Attachment(int fileNo, String originName, String changeName) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
	}
	
	public Attachment(int fileNo, String originName) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
	}
}
