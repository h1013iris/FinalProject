package com.uni.spring.addressBook.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.addressBook.model.dto.Company;
import com.uni.spring.addressBook.model.dto.Customer;
import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.member.model.dto.WideMember;

@Repository
public class AddressBookDao {

	public ArrayList<WideMember> selectAllAddList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectAllAddList");
	}

	public ArrayList<Dept> selectDeptTitleList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectDeptTitleList");
	}

	public ArrayList<WideMember> selectDeptAddList(SqlSessionTemplate sqlSession,String departmentTitle) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectDeptAddList",departmentTitle );
	}

	public ArrayList<Customer> selectCustoList(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectCustoList",empNo);
	}

	public ArrayList<Company> selectComList(SqlSessionTemplate sqlSession, int empNo){
		//System.out.println("서비스 임플에서 넘겨주는 empNo의 값은?"+empNo);
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectComList", empNo);
	}

	public ArrayList<WideMember> selectAllAddSearch(SqlSessionTemplate sqlSession, String search) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectAllAddSearch", search);
	}

//거래처등록
	public void insertComAdd(SqlSessionTemplate sqlSession, Company com ,int empNo) {
		// TODO Auto-generated method stub
		com.setEmpNo(empNo);
		sqlSession.insert("addressBookMapper.insertComAdd", com);
	}



	public ArrayList<Company> selectComFolList(SqlSessionTemplate sqlSession, Company com, int empNo) {
		// TODO Auto-generated method stub
		com.setEmpNo(empNo);
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectComFolder",com);
	}
	

}
