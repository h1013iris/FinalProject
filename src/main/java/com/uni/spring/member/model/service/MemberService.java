package com.uni.spring.member.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.uni.spring.member.model.dto.Member;
import com.uni.spring.member.model.dto.WideMember;

public interface MemberService {

	Member selectLoginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m);

	WideMember selectNewMember(int empNo);//회원가입전 사원번호로 회원정보 조회해오기

	Member loginMember(Member m) throws Exception;//암호화 하기이전 로그인
	//아이디 중복확인
	int logincheck(String userId);

	void updateNewMember(Member m);

	
	

}
