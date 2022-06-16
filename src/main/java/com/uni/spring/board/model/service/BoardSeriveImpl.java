package com.uni.spring.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.board.model.dao.BoardDao;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.coment;
import com.uni.spring.board.model.dto.pbox;
import com.uni.spring.board.model.dto.searchcon;
import com.uni.spring.common.Attachment;
import com.uni.spring.common.PageInfo;
import com.uni.spring.common.exception.CommException;

@Service
public class BoardSeriveImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private BoardDao BoardDao;

	//notice
	@Override
	public int selectListCount() {

		return BoardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {

		return BoardDao.selectListCount(sqlSession , pi);
	}
	//검색
	@Override
	public ArrayList<Board> selectsearchboard(PageInfo pi, Board b) {
        
		return BoardDao.selectsearchboard(sqlSession,pi ,b);
	}

	@Override
	public int selectsearchboardCount(Board b) {
		// TODO Auto-generated method stub
		return BoardDao.selectsearchboardCount(sqlSession, b);
	}



	@Override
	public ArrayList<Board> selectoldList(PageInfo pi) {

		return BoardDao.selectoldListCount(sqlSession , pi);
	}

	//freeboard
	@Override
	public int selecfreetListCount() {
		// TODO Auto-generated method stub
		return BoardDao.selectfreeListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectfreeList(PageInfo pi) {
		// TODO Auto-generated method stub
		return BoardDao.selectfreeList(sqlSession , pi);
	}





	@Override
	public ArrayList<Board> selectfreeoldList(PageInfo pi) {
		// TODO Auto-generated method stub
		return BoardDao.selectfreeoldList(sqlSession , pi);
	}

	//글작성
	@Override
	public void insertboard(Board b ,int deno) {
		if(deno > 0) {
			String con = b.getContent();
			con = con.replaceAll("<p>", "").replaceAll("</p>", "\n");
			b.setContent(con);
			b.setDeptno(deno);
			BoardDao.deletepno(sqlSession, b );
			int result = BoardDao.insertboard(sqlSession, b );
			if(result < 0) {
				throw new CommException("게시글 추가 실패");
			}
		}
		
	}
	
	
    
	//부서게시판
	@Override
	public int selecdeparttListCount() {
		// TODO Auto-generated method stub
		return BoardDao.selecdeparttListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectdeptList(PageInfo pi) {
		
		return BoardDao.selectdeptList(sqlSession,pi);
	}


	@Override
	public ArrayList<Board> selectdeptnameList() {
		// TODO Auto-generated method stub
		return BoardDao.selectdeptnameList(sqlSession);
	}

	@Override
	public ArrayList<Board> detailBoard(int bno) {
		
		return BoardDao.detailBoard(sqlSession, bno);
	}
	@Override
	public Board details(int bno) {
		// TODO Auto-generated method stub
		return BoardDao.details(sqlSession, bno);
	}

	@Override
	public int selectstandupListCount(int con) {
		
		return BoardDao.selectstandupListCount(sqlSession,con);
	}

	@Override
	public ArrayList<Board> selectstandupList(PageInfo pi, Board b) {
		
		return BoardDao.selectstandupList(sqlSession, pi,b);
	}
  //댓글
	@Override
	public int insertReply(coment r) {		
			
			int result = BoardDao.insertReply(sqlSession, r);
			if(result < 0) {
				throw new CommException("댓글등록 실패");
			}
			return  result;
		}

	@Override
	public ArrayList<coment> selectcomentList(int bno) {
		// TODO Auto-generated method stub
		return BoardDao.selectcomentList(sqlSession, bno);
	}

	@Override
	public int deletecoment(int cno) {
		
	    return BoardDao.deletecoment(sqlSession, cno);
	}

	@Override
	public void updatedetail(Board b) {
		BoardDao.deleteatt(sqlSession, b);
		int result = BoardDao.updatedetail(sqlSession, b);
		
	     if(result < 0) {
		throw new CommException("게시글 수정 실패");
				}
		
	}

	@Override
	public void deleteBoard(int bno) {
        int result = BoardDao.deleteBoard(sqlSession, bno);
		
		if(result < 0) {
			throw new CommException("게시글 삭제 실패");
		}
		
	}
	@Override
	public int selectpboxCount(int userno) {
		// TODO Auto-generated method stub
		return BoardDao.selectpboxCount(sqlSession,userno);
	}

	
	@Override
	public ArrayList<Board> selectpbox(PageInfo pi,int userno) {
		
		return BoardDao.selectpbox(sqlSession,pi,userno);
	}

	@Override
	public void saveboard(pbox p) {
		String con = p.getContent();
		con = con.replaceAll("<p>", "").replaceAll("</p>", "\n");
	    p.setContent(con);	    
		int result = BoardDao.saveboard(sqlSession, p);
		if(result < 0) {
			throw new CommException("게시글 추가 실패");
		}
		
	}

	@Override
	public pbox detailpbox(int pno) {
	
		return BoardDao.detailpbox(sqlSession, pno);
	}

	@Override
	public void deletepbox(int pno) {
int result = BoardDao.deletepbox(sqlSession, pno);
		
		if(result < 0) {
			throw new CommException("게시글 삭제 실패");
		}
		
	}

	@Override
	public void insertuser(Board bo) {
	Board b = BoardDao.selectuser(sqlSession,bo);
	    if(b == null) {
		
		 int result = BoardDao.insertuser(sqlSession, bo);
		 if(result < 0) {
			throw new CommException("유저추가실패");
		   }	 
	    }
	}

	@Override
	public ArrayList<Board> readuser(int wno) {
	
		return BoardDao.readuser(sqlSession, wno);
	}

	@Override
	public void savefiles(Attachment a) {
	
		 int result = BoardDao.savefiles(sqlSession, a);
		 if(result < 0) {
			throw new CommException("파일추가실패");
		   }	 
	    }

	//익명게시판
	@Override
	public int selectanonymousCount() {
		// TODO Auto-generated method stub
		return BoardDao.selectanonymousCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectanonymous(PageInfo pi) {
		// TODO Auto-generated method stub
		return BoardDao.selectanonymous(sqlSession,pi);
	}

	@Override
	public void insertanony(Board b) {
		String con = b.getContent();
		con = con.replaceAll("<p>", "").replaceAll("</p>", "\n");
		b.setContent(con);				
		int result = BoardDao.insertanony(sqlSession, b );
		if(result < 0) {
			throw new CommException("게시글 추가 실패");
		}
	}

	@Override
	public ArrayList<Board> detailanonyfiles(int bno) {
		
		return BoardDao.detailanonyfiles(sqlSession, bno);
	}

	@Override
	public Board detailanony(int bno) {
		
		return BoardDao.detailanony(sqlSession, bno);
	}

	@Override
	public int insertanonycoment(coment r) {
		int result = BoardDao.insertanonycoment(sqlSession, r);
		if(result < 0) {
			throw new CommException("댓글등록 실패");
		}
		return result;
	
	}

	@Override
	public ArrayList<coment> listcomentanony(int bno) {
		// TODO Auto-generated method stub
		return BoardDao.listcomentanony(sqlSession, bno);
	}

	@Override
	public ArrayList<Board> selectanonymousold(PageInfo pi) {
		// TODO Auto-generated method stub
		return BoardDao.selectanonymousold(sqlSession,pi);
	}

	@Override
	public ArrayList<Board> allboard() {
		
		return BoardDao.allboard(sqlSession);
	}

	@Override
	public int alllistboardCount(int boardno) {
		// TODO Auto-generated method stub
		return BoardDao.alllistboardCount(sqlSession,boardno);
	}

	@Override
	public ArrayList<Board> alllistboard(PageInfo pi, int boardno) {
		// TODO Auto-generated method stub
		return BoardDao.alllistboard(sqlSession,boardno,pi);
	}

	@Override
	public ArrayList<Board> getboardallnumber() {
		
		
		return  BoardDao.getboardallnumber(sqlSession);
	}

	@Override
	public ArrayList<Board> allboardold(PageInfo pi, int boardno) {
		// TODO Auto-generated method stub
		return BoardDao.allboardold(sqlSession,boardno,pi);
	}

	@Override
	public void savefilesupdate(Attachment a) {
		BoardDao.savefilesupdate(sqlSession,a);
		
	}
		
	



	



	
	}



	



	

	

	
	













