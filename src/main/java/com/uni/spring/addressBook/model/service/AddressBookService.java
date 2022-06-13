package com.uni.spring.addressBook.model.service;

import java.util.ArrayList;

import com.uni.spring.addressBook.model.dto.Company;
import com.uni.spring.addressBook.model.dto.Customer;
import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.member.model.dto.WideMember;

public interface AddressBookService {

	ArrayList<WideMember> selectAllAddList(WideMember wm);

	ArrayList<Dept> selectDeptTitleList(Dept dp);

	ArrayList<WideMember> selectDeptAddlist(String departmentTitle);

	ArrayList<Customer> selectCustoList(Customer custo, int empNo);

	//거래처주소록 조회
	ArrayList<Company> selectComList(Company com , int empNo);

	//전체주소록 검색기능
	ArrayList<WideMember> selectAllAddSearch(WideMember wm, String search);

	//거래처 주소록 등록
	void insertComAdd(Company com, int empNo);
	
	//등록폼에 폴더뜨게하기
	ArrayList<Company> selectComFolList(Company com, int empNo);

	//거래처 폴더별로 조회하기
	ArrayList<Company> selectSearchComFolList(int empNo, String inFolder, Company com);
	//고객 폴더 조회하기
	ArrayList<Company> selectCusFolList(Customer custo, int empNo);

	
	//고객 주소록 등록
	void insertCusAdd(Customer cus, int empNo);

	//고객주소록 상세보기
	ArrayList<Customer> selectCustoDetailView(Customer custo, int cusNo);

	//거래처 주소록 상세보기
	ArrayList<Company> selectComDetailView(Company com, int compNo);

	//고객 폴더별로 조회하기
	ArrayList<Customer> selectSearchCustoFolList(int empNo, String inFolder, Customer custo);

	//거래처주소록 수정하기
	void updateComList(Company com);

	//고객주소록 수정하기
	void updateCustoList(Customer custo);

	//거래처주소록 삭제하기
	int deleteComAdd(String compNo);

	//고객주소록 삭제하기
	int deleteCusAdd(String cusNo);
	


}
