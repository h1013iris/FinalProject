package com.uni.spring.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.admin.model.dto.employee;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.mypage.model.dao.MyPageDao;
import com.uni.spring.mypage.model.dto.Journal;
import com.uni.spring.mypage.model.dto.MyPage;
import com.uni.spring.mypage.model.dto.ToDoList;
import com.uni.spring.mypage.model.dto.WorkRequest;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyPageDao MPDao;

	@Override
	public void InsertJournal(Journal journal) {
		// TODO Auto-generated method stub
		int result = MPDao.InsertJournal(sqlSession, journal);
		
		if(result <= 0) throw new CommException("업무일지 작성 실패"); 
	}

	@Override
	public ArrayList<Journal> selectJournalList(int empNo) {
		// TODO Auto-generated method stub
		return MPDao.selectJournalList(sqlSession, empNo);
	}

	@Override
	public Journal selectJournal(int journalNo) {
		// TODO Auto-generated method stub
		return MPDao.selectJournal(sqlSession, journalNo);
	}


	@Override
	public void deleteJournal(int journalNo) {
		// TODO Auto-generated method stub
		int result = MPDao.deleteJournal(sqlSession, journalNo);
		
		if(result <= 0) throw new CommException("업무일지 삭제 실패"); 
	}

	@Override
	public void updateJournal(Journal journal) {
		// TODO Auto-generated method stub
		int result = MPDao.updateJournal(sqlSession, journal);
		
		if(result <= 0) throw new CommException("업무일지 수정 실패"); 
	}

	@Override
	public ArrayList<Journal> searchDateFrom(Journal journal) {
		// TODO Auto-generated method stub
		return MPDao.searchDateFrom(sqlSession, journal);
	}

	@Override
	public ArrayList<ToDoList> selectToDoAllList(int empNo) {
		// TODO Auto-generated method stub
		return MPDao.selectToDoAllList(sqlSession, empNo);
	}

	@Override
	public void insertTodolist(ToDoList toList) {
		// TODO Auto-generated method stub
		int result = MPDao.insertTodolist(sqlSession, toList);
		
		if(result <= 0) throw new CommException("ToDoList 추가 실패"); 
	}

	@Override
	public void updateToDoList(ToDoList toList) {
		// TODO Auto-generated method stub
		int result = MPDao.updateToDoList(sqlSession, toList);
		
		if(result <= 0) throw new CommException("ToDoList 업데이트 실패"); 
	}

	@Override
	public ToDoList selectToDoList(int listNo) {
		// TODO Auto-generated method stub
		return MPDao.selectToDoList(sqlSession, listNo);
	}

	@Override
	public void updateToDoListContent(ToDoList toList) {
		// TODO Auto-generated method stub
		int result = MPDao.updateToDoListContent(sqlSession, toList);
		
		if(result <= 0) throw new CommException("ToDoList 업데이트 실패"); 
	}

	@Override
	public ArrayList<ToDoList> todoDateSelectList(ToDoList toList) {
		// TODO Auto-generated method stub
		return MPDao.todoDateSelectList(sqlSession, toList);
	}

	@Override
	public ArrayList<employee> selectRequestEmpSearch(int[] checkval) {
		// TODO Auto-generated method stub
		return MPDao.selectRequestEmpSearch(sqlSession, checkval);
	}

	@Override
	public ArrayList<employee> EmpSelectAllList() {
		// TODO Auto-generated method stub
		return MPDao.EmpSelectAllList(sqlSession);
	}

	@Override
	public void insertWorkRequest(WorkRequest wr) {
		// TODO Auto-generated method stub
		int result = MPDao.insertWorkRequest(sqlSession, wr);
		
		if(result <= 0) throw new CommException("업무요청 실패"); 
	}

	@Override
	public ArrayList<WorkRequest> selectWorkReceivedList(int empNo) {
		// TODO Auto-generated method stub
		return MPDao.selectWorkReceivedList(empNo, sqlSession);
	}

	@Override
	public ArrayList<WorkRequest> selectrequestWorkList(int empNo) {
		// TODO Auto-generated method stub
		return MPDao.selectrequestWorkList(empNo, sqlSession);
	}

	@Override
	public WorkRequest selectworkDetail(String raskNo) {
		// TODO Auto-generated method stub
		return MPDao.selectworkDetail(sqlSession, raskNo);
	}

	@Override
	public void updateRequestStatus(String raskNo) {
		// TODO Auto-generated method stub
		int result = MPDao.updateRequestStatus(sqlSession, raskNo);
		
		if(result <= 0) throw new CommException("업무완료 상태 변경 실패"); 
	}

	@Override
	public ArrayList<MyPage> selectMyPageInsertList(int empNo) {
		// TODO Auto-generated method stub
		return MPDao.selectMyPageInsertList(sqlSession, empNo);
	}

	@Override
	public ArrayList<MyPage> selectMyPageDeleteList(int empNo) {
		// TODO Auto-generated method stub
		return MPDao.selectMyPageDeleteList(sqlSession, empNo);
	}

	@Override
	public void insertMypage(MyPage mp) {
		// TODO Auto-generated method stub
		int result = MPDao.insertMypage(sqlSession, mp);
		
		if(result <= 0) throw new CommException("즐겨찾기 추가 실패"); 
	}
	
	@Override
	public void deleteMypage(MyPage mp) {
		// TODO Auto-generated method stub
		int result = MPDao.deleteMypage(sqlSession, mp);
		
		if(result <= 0) throw new CommException("즐겨찾기 추가 실패"); 
	}

}
