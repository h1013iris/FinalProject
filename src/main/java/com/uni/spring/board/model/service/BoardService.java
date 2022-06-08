package com.uni.spring.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.coment;
import com.uni.spring.board.model.dto.pbox;
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
	void insertboard(Board b );
	
	void insertdept(Board b, int deno);
	
     //부서 게시판
	int selecdeparttListCount();


	ArrayList<Board> selectdeptnameList();

	ArrayList<Board> selectdeptList(PageInfo pi);

	Board detailBoard(int bno);

	int selectstandupListCount(int con);

	ArrayList<Board> selectstandupList(PageInfo pi, Board b);
	
	//댓글

	int insertReply(coment r);

	ArrayList<coment> selectcomentList(int bno);

	int deletecoment(int cno);

	void updatedetail(Board b);

	void deleteBoard(int bno);
	
	//임시보관함

	ArrayList<Board> selectpbox(PageInfo pi, int userno);

	int selectpboxCount(int userno);

	void saveboard(pbox p);

	pbox detailpbox(int pno);

	void deletepbox(int pno);

	void insertuser(Board bo);

	

	

	

	





}
