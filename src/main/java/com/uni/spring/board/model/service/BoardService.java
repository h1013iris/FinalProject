package com.uni.spring.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.searchcon;
import com.uni.spring.common.PageInfo;

public interface BoardService {

	//노티스
	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	ArrayList<Board> selectsearchnoti(PageInfo pi, searchcon sc);

	int selectsearchnotiCount(searchcon sc);

	ArrayList<Board> selectoldList(PageInfo pi);


	//free
	int selecfreetListCount();

	ArrayList<Board> selectfreeList(PageInfo pi);

	ArrayList<Board> selectfreeoldList(PageInfo pi);

	int selectsearchfreeCount(searchcon sc);

	ArrayList<Board> selectsearchfree(PageInfo pi, searchcon sc);
	///글작성
	void insertnotice(Board b);

	void insertfree(Board b);

	int selecdeparttListCount(int dpt);


	ArrayList<Board> selectdeptnameList();

	ArrayList<Board> selectdeptList(PageInfo pi, Board b);

	Board detailBoard(int bno);





}
