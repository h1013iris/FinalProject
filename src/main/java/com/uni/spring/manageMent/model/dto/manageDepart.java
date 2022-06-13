package com.uni.spring.manageMent.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class manageDepart {
	private String dep;//부서명
	private int depNo;//부서번호
	private String fil;//순서 필터 (직급순, 이름순, 입사순)
	private String ord;//검색분류(이름, 사원번호)
	private String searchli;//검색 내용
}
 