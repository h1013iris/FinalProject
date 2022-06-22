package com.uni.spring.addressBook.model.service;

import java.util.ArrayList;
import java.util.List;

import com.uni.spring.addressBook.model.dto.Company;
import com.uni.spring.addressBook.model.dto.Customer;
import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.addressBook.model.dto.Favorite;
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

	//부서벽 주소록 검색
	ArrayList<WideMember> selectDeptAddSearch(String departmentTitle ,String search);

	//거래처 주소록 임시보관함 조회
	ArrayList<Company> selectComBoxAdd(int empNo);

	//고객 주소록 임시보관함 조회
	ArrayList<Customer> selectCustoBoxAdd(int empNo);
	
	//고객 주소록 영구삭제
	int deleteCustoBox(List<String> cusNoArr);

	//거래처 주소록 영구삭제
	int deleteComBox(List<String> comNoArr);

	//고객주소록 임시보관함 복원
	int updateBackCustoBox(List<String> cusNoArr);

	//고객주소록 임시보관함 복원
	int updateBackComBox(List<String> comNoArr);

	//즐겨찾기 테이블에 추가하기
	int insertPavoAdd(String ckEmpNo, String empNo);

	//즐겨찾기리스트 조회하기
	ArrayList<WideMember> selectFavoAdd(String empNo);

	//메인주소록 가기전 즐겨찾기 추가되어있는 사번들 조회
	ArrayList<WideMember> selectEmpNoChList(int empNo);

	//즐겨찾기에서 삭제
	int deletePavoAdd(String empNo, String ckEmpNo);
	

	

}
