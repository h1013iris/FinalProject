package com.uni.spring.board.model.service;

import java.util.ArrayList;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.common.PageInfo;

public interface BoardService {

	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int selecfreetListCount();

	ArrayList<Board> selectfreeList(PageInfo pi);

}
