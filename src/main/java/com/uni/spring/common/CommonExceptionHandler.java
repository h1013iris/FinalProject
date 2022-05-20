package com.uni.spring.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("com.uni.spring")//sping안에있는 모든 부분에서 적용이 될수있도록 설정을 해준다.
public class CommonExceptionHandler {//공통으로 사용할 핸들러를 하나 만든다 
	
	@ExceptionHandler(value = Exception.class)//모든 익셉션에 대한 것을 여기로 주게되면 메소드마다 에러 처리를 안해줘도 되는데 컨드롤로 부분에서 또 따로 따로 계속 적어야 한다. 공통된 부분이 아니기때문에

	public ModelAndView controllerExceptionHandler(Exception e) {
		e.printStackTrace();
		return new ModelAndView("common/alert").addObject("msg",e.getMessage());
	}

}
