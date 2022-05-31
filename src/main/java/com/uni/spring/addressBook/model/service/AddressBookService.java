package com.uni.spring.addressBook.model.service;

import java.util.ArrayList;

import com.uni.spring.addressBook.model.dto.Company;
import com.uni.spring.addressBook.model.dto.Customer;
import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.member.model.dto.Member;
import com.uni.spring.member.model.dto.WideMember;

public interface AddressBookService {

	ArrayList<WideMember> selectAllAddList(WideMember wm);

	ArrayList<Dept> selectDeptTitleList(Dept dp);

	ArrayList<WideMember> selectDeptAddlist(String departmentTitle);

	ArrayList<Customer> selectCustoList(Customer custo, int empNo);

	ArrayList<Company> selectComList(Company com , int empNo);

	//전체주소록 검색기능
	ArrayList<WideMember> selectAllAddSearch(WideMember wm, String search);

	//거래처 주소록 등록
	void insertComAdd(Company com, int empNo);
	
	//등록폼에 폴더뜨게하기
	ArrayList<Company> selectComFolList(Company com, int empNo);

	


}
