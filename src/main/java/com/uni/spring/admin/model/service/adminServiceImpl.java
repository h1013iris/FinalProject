package com.uni.spring.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.admin.model.dao.adminDao;
import com.uni.spring.admin.model.dto.Authority;
import com.uni.spring.admin.model.dto.BanWords;
import com.uni.spring.admin.model.dto.BoardManagement;
import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.admin.model.dto.Job;
import com.uni.spring.admin.model.dto.MeetingRoom;
import com.uni.spring.admin.model.dto.MeetingRoomLargeCategory;
import com.uni.spring.admin.model.dto.employee;
import com.uni.spring.admin.model.dto.employeeAllInfo;
import com.uni.spring.common.exception.CommException;

@Service
public class adminServiceImpl implements adminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private adminDao admindao;

	@Override
	public ArrayList<Department> selectAllDeptList() {
		// TODO Auto-generated method stub
		return admindao.selectAllDeptList(sqlSession);
	}

	@Override
	public ArrayList<Job> selectAllJobList() {
		// TODO Auto-generated method stub
		return admindao.selectAllJobList(sqlSession);
	}

	@Override
	public employee insertEmp(employee emp) {
		int result = admindao.insertEmp(sqlSession, emp);
		
		if(result <= 0) {
			throw new CommException("사원 추가 실패");
		} 
		
		var insertUsers= admindao.insertUserSelect(sqlSession, emp.getCityNo());
		
		System.out.println("service"+insertUsers);
		return insertUsers;
	}

	@Override
	public ArrayList<employee> selectEmpAllList() {
		// TODO Auto-generated method stub
		return admindao.selectEmpAllList(sqlSession);
	}

	@Override
	public ArrayList<employee> selectSort(int number) {
		// TODO Auto-generated method stub
		return admindao.selectSort(sqlSession, number);
	}

	@Override
	public employeeAllInfo selectEmp(String empNo) {
		// TODO Auto-generated method stub
		return admindao.selectEmp(sqlSession, empNo);
	}

	@Override
	public ArrayList<BoardManagement> selectBoardAllList() {
		// TODO Auto-generated method stub
		return admindao.selectBoardAllList(sqlSession);
	}

	@Override
	public void insertBoard(String text) {
		// TODO Auto-generated method stub
		int result = admindao.insertBoard(sqlSession, text);
		
		if(result <= 0)throw new CommException("게시판 추가 실패");
	}

	@Override
	public void deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		int result = admindao.deleteBoard(sqlSession, boardNo);
		
		if(result <= 0)throw new CommException("게시판 삭제 실패");
	}

	@Override
	public void updateBoard(BoardManagement bm) {
		// TODO Auto-generated method stub
		int result = admindao.updateBoard(sqlSession,bm);
		
		if(result <= 0)throw new CommException("게시판 수정 실패");
	}

	@Override
	public ArrayList<BanWords> selectBanWordsAllList() {
		// TODO Auto-generated method stub
		return admindao.selectBanWordsAllList(sqlSession);
	}

	@Override
	public void insertBanWords(String words) {
		// TODO Auto-generated method stub
		int result = admindao.insertBanWords(sqlSession,words);
		
		if(result <= 0)throw new CommException("금지어 추가 실패");
	}

	@Override
	public void deleteBanWords(String words) {
		// TODO Auto-generated method stub
		int result = admindao.deleteBanWords(sqlSession,words);
		
		if(result <= 0)throw new CommException("금지어 삭제 실패");
	}

	@Override
	public void updateBanWords(BanWords bw) {
		// TODO Auto-generated method stub
		int result = admindao.updateBanWords(sqlSession,bw);
		
		if(result <= 0)throw new CommException("금지어 수정 실패");
	}

	@Override
	public ArrayList<MeetingRoomLargeCategory> selectMRAllList() {
		// TODO Auto-generated method stub
		return admindao.selectMRAllList(sqlSession);
	}

	@Override
	public void updateMRLC(MeetingRoomLargeCategory mRLC) {
		// TODO Auto-generated method stub
		int result = admindao.updateMRLC(sqlSession,mRLC);
		
		if(result <= 0)throw new CommException("회의실 수정 실패");
	}

	@Override
	public void insertMRLC(String lRoomName) {
		// TODO Auto-generated method stub
		int result = admindao.insertMRLC(sqlSession,lRoomName);
		
		if(result <= 0)throw new CommException("회의실 추가 실패");
	}

	@Override
	public void deleteMRLC(int roomNoLarge) {
		// TODO Auto-generated method stub
		int result = admindao.deleteMRLC(sqlSession,roomNoLarge);
		
		if(result <= 0)throw new CommException("회의실 삭제 실패");
	}

	@Override
	public ArrayList<MeetingRoom> selectSmallList(String roomNoLarge) {
		// TODO Auto-generated method stub
		return admindao.selectSmallList(sqlSession, roomNoLarge);
	}

	@Override
	public boolean insertMR(MeetingRoom mr) {
		// TODO Auto-generated method stub
		ArrayList<String> checkMR = admindao.selectMR(sqlSession, mr);
		
		
		for(String a : checkMR) {
			if(mr.getSRoomName().equals(a)) return false;
		}
		
		int result = admindao.insertMR(sqlSession,mr);
		
		if(result <= 0)throw new CommException("회의실 추가 실패");
		
		return true;
	}

	@Override
	public void deleteMR(String roomNoSmall) {
		// TODO Auto-generated method stub
		int result = admindao.deleteMR(sqlSession, roomNoSmall);
		
		if(result <= 0)throw new CommException("회의실 삭제 실패");

	}

	@Override
	public boolean updateMR(MeetingRoom mr) {
		ArrayList<String> checkMR = admindao.selectMR(sqlSession, mr);
		
		
		for(String a : checkMR) {
			if(mr.getSRoomName().equals(a)) return false;
		}
		
		int result = admindao.updateMR(sqlSession,mr);
		
		if(result <= 0)throw new CommException("회의실 수정 실패");
		
		return true;
	}

	@Override
	public MeetingRoom selectStatus(String roomNoSmall) {
		// TODO Auto-generated method stub
		return admindao.selectStatus(sqlSession, roomNoSmall);
	}

	@Override
	public void maxCountUpdate(MeetingRoom mr) {
		// TODO Auto-generated method stub
		int result = admindao.maxCountUpdate(sqlSession, mr);
		
		if(result <= 0)throw new CommException("최대인원 수정 실패");
	}

	@Override
	public void updateStatus(MeetingRoom mr) {
		// TODO Auto-generated method stub
		int result = admindao.updateStatus(sqlSession, mr);
		
		if(result <= 0)throw new CommException("회의실 상태 수정 실패");
	}

	@Override
	public ArrayList<Authority> selectAuthorityAllList() {
		// TODO Auto-generated method stub
		return admindao.selectAuthorityAllList(sqlSession);
	}

}
