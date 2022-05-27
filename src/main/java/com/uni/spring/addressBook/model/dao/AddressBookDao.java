package com.uni.spring.addressBook.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.member.model.dto.WideMember;

@Repository
public class AddressBookDao {

	public ArrayList<WideMember> selectAllAddList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllAddList");
	}

	public ArrayList<Dept> selectDeptTitleList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectDeptTitleList");
	}

}
