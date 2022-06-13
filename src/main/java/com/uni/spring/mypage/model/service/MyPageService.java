package com.uni.spring.mypage.model.service;

import java.util.ArrayList;

import com.uni.spring.mypage.model.dto.Journal;
import com.uni.spring.mypage.model.dto.ToDoList;

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

}