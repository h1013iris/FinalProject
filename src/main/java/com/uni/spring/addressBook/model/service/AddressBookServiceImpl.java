package com.uni.spring.addressBook.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.addressBook.model.dao.AddressBookDao;
import com.uni.spring.addressBook.model.dto.Company;
import com.uni.spring.addressBook.model.dto.Customer;
import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.addressBook.model.dto.Favorite;
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
	//고객등록
	@Override
	public void insertCusAdd(Customer cus, int empNo) {		
		addressBookDao.insertCusAdd(sqlSession,cus,empNo);
	}

	//거래처폴더 조회
	@Override
	public ArrayList<Company> selectComFolList(Company com, int empNo) {
		// TODO Auto-generated method stub
		return addressBookDao.selectComFolList(sqlSession, com, empNo);
	}

	
	//사원마다 다른 폴더별 거래처 조회
	@Override
	public ArrayList<Company> selectSearchComFolList(int empNo, String inFolder, Company com) {
		
		return addressBookDao.selectSearchComFolList(sqlSession,empNo,inFolder,com);
	}

	//고객 등록폼 안의 폴더리스트
	@Override
	public ArrayList<Company> selectCusFolList(Customer custo, int empNo) {
		// TODO Auto-generated method stub
		return addressBookDao.selectCusFolList(sqlSession, custo, empNo);
	}

	//고객주소록 상세보기
	@Override
	public ArrayList<Customer> selectCustoDetailView(Customer custo, int cusNo) {
		// TODO Auto-generated method stub
		return addressBookDao.selectCustoDetailView(sqlSession, custo, cusNo);
	}

	@Override
	public ArrayList<Company> selectComDetailView(Company com, int compNo) {
		// TODO Auto-generated method stub
		return addressBookDao.selectComDetailView(sqlSession, com, compNo);
	}

	@Override
	public ArrayList<Customer> selectSearchCustoFolList(int empNo, String inFolder, Customer custo) {
		// TODO Auto-generated method stub
		return addressBookDao.selectSearchCustoFolList(sqlSession,empNo,inFolder,custo);
	}

	//거래처주소록 수정하기
	@Override
	public void updateComList(Company com) {
		// TODO Auto-generated method stub
		addressBookDao.updateComList(sqlSession,com);
	}
	
	//고객주소록 수정하기
	@Override
	public void updateCustoList(Customer custo) {
		// TODO Auto-generated method stub
	addressBookDao.updateCustoList(sqlSession,custo);
	}

	//거래처 주소록 삭제하기(상태값 변경)
	@Override
	public int deleteComAdd(String compNo) {
		// TODO Auto-generated method stub
	return addressBookDao.deleteComAdd(sqlSession,compNo);	
	}

	//고객 주소록 삭제하기(상태값 변경)
	@Override
	public int deleteCusAdd(String cusNo) {
		// TODO Auto-generated method stub
	return addressBookDao.deleteCusAdd(sqlSession,cusNo);	
	}

	//부서별 주소록 검색
	@Override
	public ArrayList<WideMember> selectDeptAddSearch(String departmentTitle, String search) {

		Map<String,Object> deptSearch = new HashMap<String,Object>();
		deptSearch.put("departmentTitle", departmentTitle);
		deptSearch.put("search", search);
		
		return addressBookDao.selectDeptAddSearch(sqlSession,deptSearch);
	}

	//거래처 주소록 임시보관함
	@Override
	public ArrayList<Company> selectComBoxAdd(int empNo) {
		// TODO Auto-generated method stub
		return addressBookDao.selectComBoxAdd(sqlSession, empNo);
	}

	//고객주소록 임시 보관함
	@Override
	public ArrayList<Customer> selectCustoBoxAdd(int empNo) {
		// TODO Auto-generated method stub
		return addressBookDao.selectCustoBoxAdd(sqlSession, empNo);
	}
	//고객 주소록 영구삭제
	@Override
	public int deleteCustoBox(List<String> cusNoArr) {
		// TODO Auto-generated method stub
		System.out.println("고객주소록 영구삭제 임플 cusNoArr"+cusNoArr);
		int a= addressBookDao.deleteCustoBox(sqlSession, cusNoArr);
		System.out.println("고객주소록 영구삭제 임플 결과?"+a);
		return a;
	}

	//거래처 주소록 영구삭제
	@Override
	public int deleteComBox(List<String> comNoArr) {
		System.out.println("거래처주소록 영구삭제 임플 넘어온값 comNoArr"+comNoArr);
		int a= addressBookDao.deleteComBox(sqlSession, comNoArr);
		System.out.println("거래처주소록 영구삭제 임플 결과?"+a);
		return a;
	}

	//고객주소록 임시보관함 복원
	@Override
	public int updateBackCustoBox(List<String> cusNoArr) {
		int a= addressBookDao.updateBackCustoBox(sqlSession, cusNoArr);
		System.out.println("고객주소록 복원 임플 결과? "+a);
		return a;
	}
	//거래처주소록 임시보관함 복원
	@Override
	public int updateBackComBox(List<String> comNoArr) {
		int a= addressBookDao.updateBackComBox(sqlSession, comNoArr);
		System.out.println("거래처 주소록 복원 임플 결과? "+a);
		return a;
	}

	//즐겨찾기 주소록에 추가
	@Override
	public int insertPavoAdd(String ckEmpNo, String empNo) {
		// TODO Auto-generated method stub
		Map<String, Object> pavoMap = new HashMap<String, Object>();
		pavoMap.put("ckEmpNo",ckEmpNo);
		pavoMap.put("empNo", empNo);
		int a= addressBookDao.insertPavoAdd(sqlSession, pavoMap);
		System.out.println("즐겨찾기 추가 결과는? "+a);
		return a;
	}

	//즐겨찾기 기능 추가하기
	@Override
	public ArrayList<WideMember> selectFavoAdd(String empNo) {
		// TODO Auto-generated method stub
		return addressBookDao.selectFavoAdd(sqlSession, empNo);
	}



}
