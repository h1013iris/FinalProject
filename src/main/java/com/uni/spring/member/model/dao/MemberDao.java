package com.uni.spring.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.member.model.dto.WideMember;

@Repository
public class MemberDao {
	
	/*public Member selectLoginMember(SqlSessionTemplate sqlSession, Member m) {//로그인기능
		Member m1 = sqlSession.selectOne("memberMapper.selectLoginMember",m);
		return m1;
	}*/

	public int selectEmpNoCount(SqlSessionTemplate sqlSession, int empNo) {//사번이 있는지 확인
		
		return sqlSession.selectOne("memberMapper.selectEmpNoCount",empNo);//사번이 있으면 1 없으면 0이 전달될것
	}

	public WideMember selectNewMember(SqlSessionTemplate sqlSession, int empNo) {//사번이 있을시 그 사번으로 회원정보 조회해옴
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectNewMember",empNo);
	}
	//암호화 이전 로그인
	/*public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		Member m1= sqlSession.selectOne("memberMapper.selectLoginMember",m);
		return m1;
	}
	*/
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		Member m1= sqlSession.selectOne("memberMapper.selectLoginMember",m);
		return m1;
	}
	
	//아이디체크(중복확인)
	public int selectIdCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.selectIdCheck",userId);
		
	}
	//회원가입
	public int updateNewMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateNewMember",m);
	}

	public ArrayList<Dept> selectDeptTitle(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.selectDeptTitleList");
	
	}

	public String selectFindId(SqlSessionTemplate sqlSession, WideMember wm) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectFindId", wm);
	}
}