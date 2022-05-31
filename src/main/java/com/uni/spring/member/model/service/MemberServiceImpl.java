package com.uni.spring.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.uni.spring.addressBook.model.dto.Dept;
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
	/*@Override
	public Member loginMember(Member m) throws Exception {
		Member loginUser = memberDao.loginMember(sqlSession, m);
		if(loginUser == null) {
			throw new Exception("로그인정보를 확인해주세요");
		}	
		return loginUser;
	}*/
	//비밀번호 암호화된것 로그인
	@Override
	 public Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m){
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		if(loginUser == null) {
			
			System.out.println("없는 아이디");
			throw new CommException("로그인 정보를 다시 확인해주세요");
		}
		
		//mathes(입력한비번,암호화비번) ture, false로 반환
		if(!bCryptPasswordEncoder.matches(m.getUserPw(), loginUser.getUserPw())) {
			
			System.out.println("비밀번호 불일치");
			throw new CommException("로그인 정보를 다시 확인해주세요");
			
		}
		return loginUser;
		

	}
	

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

	//아이디찾기에 출력될 부서명
	@Override
	public ArrayList<Dept> findDept() {
		ArrayList<Dept> dtlist = memberDao.selectDeptTitle(sqlSession);
		return dtlist;
	}


	@Override
	public String selectFindId(WideMember wm) {
		String msg = memberDao.selectFindId(sqlSession, wm);
		System.out.println("아이디는"+msg);//아이디가 잘 담겼는지 확인
		if(msg.isEmpty()) {
			System.out.println("아이디가 없다.."+msg);//아이디가 잘 담겼는지 확인
			throw new CommException("입력정보를 다시 확인해주세요");
		}
		System.out.println("아이디는"+msg);//아이디가 잘 담겼는지 확인
		return msg;
		
	}

}
