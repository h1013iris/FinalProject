package com.uni.spring.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.admin.model.dto.employee;
import com.uni.spring.mypage.model.dto.Journal;
import com.uni.spring.mypage.model.dto.ToDoList;
import com.uni.spring.mypage.model.dto.WorkRequest;

@Repository
public class MyPageDao {

	public int InsertJournal(SqlSessionTemplate sqlSession, Journal journal) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mypageMapper.InsertJournal", journal);
		
	}

	public ArrayList<Journal> selectJournalList(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectJournalList", empNo);
	}

	public Journal selectJournal(SqlSessionTemplate sqlSession, int journalNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectJournal",journalNo);
	}

	public int deleteJournal(SqlSessionTemplate sqlSession, int journalNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("mypageMapper.deleteJournal",journalNo);
	}

	public int updateJournal(SqlSessionTemplate sqlSession, Journal journal) {
		// TODO Auto-generated method stub
		return sqlSession.update("mypageMapper.updateJournal",journal);
	}

	public ArrayList<Journal> searchDateFrom(SqlSessionTemplate sqlSession, Journal journal) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.searchDateFrom",journal);
	}

	public ArrayList<ToDoList> selectToDoAllList(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectToDoAllList",empNo);
	}

	public int insertTodolist(SqlSessionTemplate sqlSession, ToDoList toList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mypageMapper.insertTodolist", toList);
	}

	public int updateToDoList(SqlSessionTemplate sqlSession, ToDoList toList) {
		// TODO Auto-generated method stub
		return sqlSession.update("mypageMapper.updateToDoList", toList);
	}

	public ToDoList selectToDoList(SqlSessionTemplate sqlSession, int listNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectToDoList", listNo);
	}

	public int updateToDoListContent(SqlSessionTemplate sqlSession, ToDoList toList) {
		// TODO Auto-generated method stub
		return sqlSession.update("mypageMapper.updateToDoListContent", toList);
	}

	public ArrayList<ToDoList> todoDateSelectList(SqlSessionTemplate sqlSession, ToDoList toList) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.todoDateSelectList", toList);
	}

	public ArrayList<employee> selectRequestEmpSearch(SqlSessionTemplate sqlSession, int[] checkval) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectRequestEmpSearch",checkval);
	}

	public ArrayList<employee> EmpSelectAllList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.EmpSelectAllList");
	}

	public int insertWorkRequest(SqlSessionTemplate sqlSession, WorkRequest wr) {
		// TODO Auto-generated method stub
		int a = sqlSession.insert("mypageMapper.insertWorkRequest", wr);
		int b = sqlSession.insert("mypageMapper.insertWorkRequestEmp", wr);
		return a * b;
	}

	public ArrayList<WorkRequest> selectWorkReceivedList(int empNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectWorkReceivedList",Integer.valueOf(empNo));
	}

	public ArrayList<WorkRequest> selectrequestWorkList(int empNo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectrequestWorkList", empNo);
	}

	public WorkRequest selectworkDetail(SqlSessionTemplate sqlSession, String raskNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectworkDetail",Integer.parseInt(raskNo));
	}

	public int updateRequestStatus(SqlSessionTemplate sqlSession, String raskNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("mypageMapper.updateRequestStatus",Integer.parseInt(raskNo));
	}
	
	

}
