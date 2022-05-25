package com.uni.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.member.model.dao.MemberDao;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.member.model.dto.WideMember;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	//비밀번호 암호화 이전
	@Override
	public Member loginMember(Member m) throws Exception {
		Member loginUser = memberDao.loginMember(sqlSession, m);
		if(loginUser == null) {
			throw new Exception("로그인정보를 확인해주세요");
		}	
		return loginUser;
	}
	/*비밀번호 암호화
	@Override
	 * public Member selectLoginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m){
		
		Member loginUser = memberDao.selectLoginMember(sqlSession, m);
		
		if(loginUser == null) {
			throw new CommException("loginUser 확인");
		}
		
		//mathes(입력한비번,암호화비번) ture, false로 반
		if(!bCryptPasswordEncoder.matches(m.getUserPw(), loginUser.getUserPw())) {
			throw new CommException("암호불일치");
		}
		return loginUser;
		

	}
	*/

	@Override
	public WideMember selectNewMember(int empNo) {
		
		WideMember m =  null;
		
		int result = memberDao.selectEmpNoCount(sqlSession, empNo);
		System.out.println("사번조회"+result);
		if(result < 1){//조회한 사번이 조회되지 않으면 count한게 0 이라면
			throw new CommException("사번을 확인해주세요");
		}
		else {//조회한 사번이 있다면
			m = memberDao.selectNewMember(sqlSession,empNo);
		}
		return m;
	}

	/*@Override
	public Member selectLoginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) {
		// TODO Auto-generated method stub
		return null;
	}
*/
	
	//아이디 중복체크
	@Override
	public int logincheck(String userId){
		int idno = memberDao.selectIdCheck(sqlSession, userId);
		return idno;
	}

	@Override
	public void updateNewMember(Member m){
		int result = memberDao.updateNewMember(sqlSession, m);
		if(result < 0) {//왜 여기 1이 아니고 0일까..?? 내일물어보자
			throw new CommException("회원가입에 실패했습니다");
		}
		
	}

	//암호화 된거 로그인
	@Override
	public Member selectLoginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m) {
		// TODO Auto-generated method stub
		return null;
	}
}
