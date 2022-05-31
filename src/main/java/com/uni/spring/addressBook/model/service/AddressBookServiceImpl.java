package com.uni.spring.addressBook.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.addressBook.model.dao.AddressBookDao;
import com.uni.spring.addressBook.model.dto.Company;
import com.uni.spring.addressBook.model.dto.Customer;
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

	//부서별 번호 클릭했을때 주소록리스트 불러오기
	@Override
	public ArrayList<WideMember> selectDeptAddlist(String departmentTitle) {
		
		return addressBookDao.selectDeptAddList(sqlSession, departmentTitle);
		 
	}

	@Override
	public ArrayList<Customer> selectCustoList(Customer custo, int empNo) {
		
		custo.setEmpNo(empNo);
		
		return addressBookDao.selectCustoList(sqlSession, empNo);
		
	}

	@Override
	public ArrayList<Company> selectComList(Company com, int empNo) {
		//자기객체에 담아주고
		com.setEmpNo(empNo);
		//자기객체에서 자기사번으로 조회
		return addressBookDao.selectComList(sqlSession, empNo);
	}

	//전체 주소록 검색기능
	@Override
	public ArrayList<WideMember> selectAllAddSearch(WideMember wm, String search) {
		 return addressBookDao.selectAllAddSearch(sqlSession, search);
	
	}
	
	//거래처등록
	@Override
	public void insertComAdd(Company com, int empNo) {
		addressBookDao.insertComAdd(sqlSession,com, empNo);
		
	}

	@Override
	public ArrayList<Company> selectComFolList(Company com, int empNo) {
		// TODO Auto-generated method stub
		return addressBookDao.selectComFolList(sqlSession,com,empNo);
	}



}
