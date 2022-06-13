package com.uni.spring.member.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.member.model.dto.WideMember;

public interface MemberService {

	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m);

	WideMember selectNewMember(int empNo);//회원가입전 사원번호로 회원정보 조회해오기

	//아이디 중복확인
	int logincheck(String userId);

	void updateNewMember(Member m);
	
	//아이디비번찾기로 이동시 부서별 리스트를 뽑아 가기위함
	ArrayList<Dept> findDept();

	//아이디 찾기위함
	String selectFindId(WideMember wm);

	int insertMemberAttachFile(MultipartFile file, HttpServletRequest request, int empNo);

	//비밀번호찾기_이메일인증번호 보내기전 사원정보유무확인
	int selectFindUser(Member m);

	int updatePw(Member m);
	

	
	

}
