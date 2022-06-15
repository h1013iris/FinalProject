package com.uni.spring.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.coment;
import com.uni.spring.board.model.dto.pbox;
import com.uni.spring.board.model.dto.searchcon;
import com.uni.spring.common.Attachment;
import com.uni.spring.common.PageInfo;

public interface BoardService {

	//노티스
	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	ArrayList<Board> selectsearchboard(PageInfo pi, Board b);

	int selectsearchboardCount(Board b);

	ArrayList<Board> selectoldList(PageInfo pi);


	//free
	int selecfreetListCount();

	ArrayList<Board> selectfreeList(PageInfo pi);

	ArrayList<Board> selectfreeoldList(PageInfo pi);
	
	///글작성
	void insertboard(Board b, int deno );
	
	
     //부서 게시판
	int selecdeparttListCount();


	ArrayList<Board> selectdeptnameList();

	ArrayList<Board> selectdeptList(PageInfo pi);

	ArrayList<Board> detailBoard(int bno);

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

	ArrayList<Board> readuser(int wno);

	void savefiles(Attachment a);

	Board details(int bno);

	int selectanonymousCount();

	ArrayList<Board> selectanonymous(PageInfo pi);

	void insertanony(Board b);

	ArrayList<Board> detailanonyfiles(int bno);

	Board detailanony(int bno);

	int insertanonycoment(coment r);

	ArrayList<coment> listcomentanony(int bno);

	ArrayList<Board> selectanonymousold(PageInfo pi);

	

	

	

	

	





}
