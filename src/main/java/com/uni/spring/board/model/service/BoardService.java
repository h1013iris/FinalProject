package com.uni.spring.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.searchcon;
import com.uni.spring.common.PageInfo;

public interface BoardService {

	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int selecfreetListCount();

	ArrayList<Board> selectfreeList(PageInfo pi);


	ArrayList<Board> selectsearchnoti(PageInfo pi, searchcon sc);

	int selectsearchnotiCount(searchcon sc);


	ArrayList<Board> selectoldList(PageInfo pi);

	

}
