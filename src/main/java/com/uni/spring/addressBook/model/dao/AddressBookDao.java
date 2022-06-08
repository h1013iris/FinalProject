package com.uni.spring.addressBook.model.dao;

import java.util.ArrayList;

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
		ArrayList<Customer> a=(ArrayList)sqlSession.selectList("addressBookMapper.selectCustoList",empNo);
		System.out.println("다오에서 고객 리스트"+a);//얘는 불러와지는데
		return a;
				
	}

	public ArrayList<Company> selectComList(SqlSessionTemplate sqlSession, int empNo){
		ArrayList<Company> a = (ArrayList)sqlSession.selectList("addressBookMapper.selectComList", empNo);
		System.out.println("다오에서 거래처 리스트"+a);//거래처주소록 번호 안불러와짐.. 
		return a;
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

	public ArrayList<Company> selectSearchComFolList(SqlSessionTemplate sqlSession,int empNo, String inFolder, Company com) {
		// TODO Auto-generated method stub
		com.setEmpNo(empNo);
		com.setInFolder(inFolder);
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectSearchComFolList",com);
	}

	public ArrayList<Company> selectCusFolList(SqlSessionTemplate sqlSession, Customer custo, int empNo) {
		custo.setEmpNo(empNo);
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectCusFolList" ,custo);
	}

	public void insertCusAdd(SqlSessionTemplate sqlSession, Customer cus, int empNo) {
		cus.setEmpNo(empNo);
		sqlSession.insert("addressBookMapper.insertCusAdd", cus);
	}

	public ArrayList<Customer> selectCustoDetailView(SqlSessionTemplate sqlSession, Customer custo, int cusNo) {
		custo.setCusNo(cusNo);
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectCustoDetailView",custo);
	}

	public ArrayList<Company> selectComDetailView(SqlSessionTemplate sqlSession, Company com, int compNo) {
		com.setCompNo(compNo);
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectComDetailView",com);
	}

	public ArrayList<Customer> selectSearchCustoFolList(SqlSessionTemplate sqlSession, int empNo, String inFolder,
			Customer custo) {
		// TODO Auto-generated method stub
		custo.setEmpNo(empNo);
		custo.setInFolder(inFolder);
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectSearchCustoFolList",custo);
	}


	public ArrayList<Company> selectupDetailCom(SqlSessionTemplate sqlSession, int compNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectupDetailCom",compNo);
	}

	//거래처주소록 수정하기
	public void updateComList(SqlSessionTemplate sqlSession,Company com) {
		// TODO Auto-generated method stub
		
		sqlSession.update("addressBookMapper.updateComList",com);
	}

	//고객주소록 수정하기
	public void updateCustoList(SqlSessionTemplate sqlSession, Customer custo) {
		// TODO Auto-generated method stub
		sqlSession.update("addressBookMapper.updateCustoList",custo);
	}


}
