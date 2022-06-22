package com.uni.spring.mypage.model.service;

import java.util.ArrayList;

import com.uni.spring.admin.model.dto.employee;
import com.uni.spring.mypage.model.dto.Journal;
import com.uni.spring.mypage.model.dto.MyPage;
import com.uni.spring.mypage.model.dto.ToDoList;
import com.uni.spring.mypage.model.dto.WorkRequest;

public interface MyPageService {

	void InsertJournal(Journal journal);

	ArrayList<Journal> selectJournalList(int empNo);

	Journal selectJournal(int journalNo);

	void deleteJournal(int journalNo);

	void updateJournal(Journal journal);

	ArrayList<Journal> searchDateFrom(Journal journal);

	ArrayList<ToDoList> selectToDoAllList(int empNo);

	void insertTodolist(ToDoList toList);

	void updateToDoList(ToDoList toList);

	ToDoList selectToDoList(int listNo);

	void updateToDoListContent(ToDoList toList);

	ArrayList<ToDoList> todoDateSelectList(ToDoList toList);

	ArrayList<employee> selectRequestEmpSearch(int[] checkval);

	ArrayList<employee> EmpSelectAllList();

	void insertWorkRequest(WorkRequest wr);

	ArrayList<WorkRequest> selectWorkReceivedList(int empNo);

	ArrayList<WorkRequest> selectrequestWorkList(int empNo);

	WorkRequest selectworkDetail(String raskNo);

	void updateRequestStatus(String raskNo);

	ArrayList<MyPage> selectMyPageInsertList(int empNo);

	ArrayList<MyPage> selectMyPageDeleteList(int empNo);

	void insertMypage(MyPage mp);

	void deleteMypage(MyPage mp);

	employee selectEmp(int empNo);

	WorkRequest selectworkRequestDetail(String raskNo);

	ArrayList<employee> selectWorkEmpList(String raskNo);

	void updateEmployee(employee emp);

}
