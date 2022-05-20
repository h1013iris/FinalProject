package com.uni.spring.common.exception;

public class CommException extends RuntimeException {//알아서 롤백처리를 해주기때문에 impl에서 에러가 뜨지 않는다.
	

	public CommException() {//기본 생성자 
		// TODO Auto-generated constructor stub
	}

	public CommException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}
	
	
}
