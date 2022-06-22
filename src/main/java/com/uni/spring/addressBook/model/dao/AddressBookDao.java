package com.uni.spring.addressBook.model.dao;
 

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.addressBook.model.dto.Company;
import com.uni.spring.addressBook.model.dto.Customer;
import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.addressBook.model.dto.Favorite;
import com.uni.spring.member.model.dto.WideMember;

@Repository
public class AddressBookDao {

	// 전체주소록 조회
	public ArrayList<WideMember> selectAllAddList(SqlSessionTemplate sqlSession) {

		return (ArrayList) sqlSession.selectList("addressBookMapper.selectAllAddList");
	}

	// 부서별 주소록 목록 뜨도록
	public ArrayList<Dept> selectDeptTitleList(SqlSessionTemplate sqlSession) {

		return (ArrayList) sqlSession.selectList("addressBookMapper.selectDeptTitleList");
	}

	// 부서명클릭시 부서별 조회리스트 나오도록
	public ArrayList<WideMember> selectDeptAddList(SqlSessionTemplate sqlSession, String departmentTitle) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectDeptAddList", departmentTitle);
	}

	// 고객주소록 메인
	public ArrayList<Customer> selectCustoList(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		ArrayList<Customer> a = (ArrayList) sqlSession.selectList("addressBookMapper.selectCustoList", empNo);
		
		return a;
	}

	// 거래처 주소록 메인
	public ArrayList<Company> selectComList(SqlSessionTemplate sqlSession, int empNo) {
		ArrayList<Company> a = (ArrayList) sqlSession.selectList("addressBookMapper.selectComList", empNo);
		
		return a;
	}

	// 전체주소록 검색기능
	public ArrayList<WideMember> selectAllAddSearch(SqlSessionTemplate sqlSession, String search) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectAllAddSearch", search);
	}

	// 거래처등록
	public void insertComAdd(SqlSessionTemplate sqlSession, Company com, int empNo) {
		// TODO Auto-generated method stub
		com.setEmpNo(empNo);
		sqlSession.insert("addressBookMapper.insertComAdd", com);
	}

	// 거래처주소록 등록시 자기사번으로 거래처 폴더명 가져옴
	public ArrayList<Company> selectComFolList(SqlSessionTemplate sqlSession, Company com, int empNo) {
		// TODO Auto-generated method stub
		com.setEmpNo(empNo);
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectComFolder", com);
	}

	// 고객 주소록 등록시 자기사번으로 고객 폴더명 가져옴
	public ArrayList<Company> selectCusFolList(SqlSessionTemplate sqlSession, Customer custo, int empNo) {
		custo.setEmpNo(empNo);
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectCusFolList", custo);
	}

	// 고객주소록 등록
	public void insertCusAdd(SqlSessionTemplate sqlSession, Customer cus, int empNo) {
		cus.setEmpNo(empNo);
		sqlSession.insert("addressBookMapper.insertCusAdd", cus);
	}

	// 고객주소록 상세보기
	public ArrayList<Customer> selectCustoDetailView(SqlSessionTemplate sqlSession, Customer custo, int cusNo) {
		custo.setCusNo(cusNo);
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectCustoDetailView", custo);
	}

	// 거래처 주소록 상세보기
	public ArrayList<Company> selectComDetailView(SqlSessionTemplate sqlSession, Company com, int compNo) {
		com.setCompNo(compNo);
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectComDetailView", com);
	}

	// 거래처 폴더명으로 리스트 조회하기
	public ArrayList<Company> selectSearchComFolList(SqlSessionTemplate sqlSession, int empNo, String inFolder,
			Company com) {
		// TODO Auto-generated method stub
		com.setEmpNo(empNo);
		com.setInFolder(inFolder);
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectSearchComFolList", com);
	}

	// 고객 폴더명으로 리스트 조회하기
	public ArrayList<Customer> selectSearchCustoFolList(SqlSessionTemplate sqlSession, int empNo, String inFolder,
			Customer custo) {
		// TODO Auto-generated method stub
		custo.setEmpNo(empNo);
		custo.setInFolder(inFolder);
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectSearchCustoFolList", custo);
	}

	// 거래처주소록 수정하기
	public void updateComList(SqlSessionTemplate sqlSession, Company com) {
		// TODO Auto-generated method stub

		sqlSession.update("addressBookMapper.updateComList", com);
	}

	// 고객주소록 수정하기
	public void updateCustoList(SqlSessionTemplate sqlSession, Customer custo) {
		// TODO Auto-generated method stub
		sqlSession.update("addressBookMapper.updateCustoList", custo);
	}

	// 거래처 주소록 삭제하기
	public int deleteComAdd(SqlSessionTemplate sqlSession, String compNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("addressBookMapper.deleteComAdd", compNo);
	}

	// 고객 주소록 삭제하기
	public int deleteCusAdd(SqlSessionTemplate sqlSession, String cusNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("addressBookMapper.deleteCusAdd", cusNo);
	}

	// 부서별 주소록 검색
	public ArrayList<WideMember> selectDeptAddSearch(SqlSessionTemplate sqlSession, Map<String, Object> deptSearch) {
		// TODO Auto-generated method stub
		
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectDeptAddSearch", deptSearch);
	}

	// 거래처주소록 임시보관함
	public ArrayList<Company> selectComBoxAdd(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectComBoxAdd", empNo);
	}

	// 고객주소록 임시보관함
	public ArrayList<Customer> selectCustoBoxAdd(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("addressBookMapper.selectCustoBoxAdd", empNo);
	}

	// 고객주소록 영구삭제
	public int deleteCustoBox(SqlSessionTemplate sqlSession, List<String> cusNoArr) {
		// TODO Auto-generated method stub
		
		return sqlSession.delete("addressBookMapper.deleteCustoBox", cusNoArr);
	}

	// 거래처 주소록 영구삭제
	public int deleteComBox(SqlSessionTemplate sqlSession, List<String> comNoArr) {
		// TODO Auto-generated method stub
		
		return sqlSession.delete("addressBookMapper.deleteComBox", comNoArr);
	}

	//고객주소록 복원
	public int updateBackCustoBox(SqlSessionTemplate sqlSession, List<String> cusNoArr) {
		// TODO Auto-generated method stub
		return sqlSession.update("addressBookMapper.updateBackCustoBox", cusNoArr);
	}
	//거래처주소록 복원
	public int updateBackComBox(SqlSessionTemplate sqlSession, List<String> comNoArr) {
		// TODO Auto-generated method stub
		return sqlSession.update("addressBookMapper.updateBackComBox", comNoArr);
	}

	//즐겨찾기 추가
	public int insertPavoAdd(SqlSessionTemplate sqlSession, Map<String, Object> pavoMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("addressBookMapper.insertPavoAdd",pavoMap);
	}

	//즐겨찾기 리스트 조회
	public ArrayList<WideMember> selectFavoAdd(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectFavoAdd",empNo);
	}
	//즐겨찾기 등록여부 조회
	public int selectUserCount(SqlSessionTemplate sqlSession, Map<String, Object> pavoMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("addressBookMapper.selectUserCount",pavoMap);
	}

	//메인 주소록 가기전 즐겨찾기 여부 확인
	public ArrayList<WideMember> selectEmpNoChList(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("addressBookMapper.selectEmpNoChList",empNo);
	}

	public int deletePavoAdd(SqlSessionTemplate sqlSession,Map<String, Object> delpavoMap) {
		// TODO Auto-generated method stub
		return sqlSession.delete("addressBookMapper.deletePavoAdd",delpavoMap);
	}
	
}
