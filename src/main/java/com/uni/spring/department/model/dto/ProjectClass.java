package com.uni.spring.department.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProjectClass {
	private int pcNo;//분류번호
	private int refPro;//참조 프로젝트 번호 
	private String pcOne;//분류 1
	private String pcTwo;//분류 2
	private String pcThree;//분류 3
	private String pcFour;//분류 4
	private String pcStatus;//상태값
}
