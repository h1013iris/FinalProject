package com.uni.spring.addressBook.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.addressBook.model.dao.AddressBookDao;
import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.member.model.dto.WideMember;

@Service
public class AddressBookServiceImpl implements AddressBookService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressBookDao addressBookDao;

	//주소록 전체조회 
	@Override
	public ArrayList<WideMember> selectAllAddList(WideMember wm) {
		// TODO Auto-generated method stub
		return addressBookDao.selectAllAddList(sqlSession);
		
	}

	//주소록 위에 부서별 버튼들이 뜸 관리자가 추가하면 계속 추가되도록
	@Override
	public ArrayList<Dept> selectDeptTitleList(Dept dp) {
		
		return addressBookDao.selectDeptTitleList(sqlSession);
		
	}
	

	
}
