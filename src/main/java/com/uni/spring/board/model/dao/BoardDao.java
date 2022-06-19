package com.uni.spring.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.coment;
import com.uni.spring.board.model.dto.pbox;
import com.uni.spring.board.model.dto.searchcon;
import com.uni.spring.common.Attachment;
import com.uni.spring.common.PageInfo;

@Repository
public class BoardDao {

   // 노티스
   public int selectListCount(SqlSessionTemplate sqlSession) {

      return sqlSession.selectOne("boardMapper.selectListCount");
   }

   public ArrayList<Board> selectListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectList", null, rowBounds);
      // 파라미터값 null
   }
   
 //검색
   public ArrayList<Board> selectsearchboard(SqlSessionTemplate sqlSession, PageInfo pi, Board b) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectsearchboard", b, rowBounds);
   }

   public int selectsearchboardCount(SqlSessionTemplate sqlSession, Board b) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("boardMapper.selectsearchboardCount", b);
   }

   public ArrayList<Board> selectoldListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectoldList", null, rowBounds);

   }

   //자유 게시판
   public int selectfreeListCount(SqlSessionTemplate sqlSession) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("boardMapper.selectfreeListCount");
   }

   public ArrayList<Board> selectfreeList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectfreeList", null, rowBounds);
   }

  

   public ArrayList<Board> selectfreeoldList(SqlSessionTemplate sqlSession, PageInfo pi) {
      int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectfreeoldList", null, rowBounds);
   }

   // 글작성
   public int insertboard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
	   return sqlSession.insert("boardMapper.insertboard", b);
	}

  //부서게시판

public int selecdeparttListCount(SqlSessionTemplate sqlSession) {
	// TODO Auto-generated method stub
	 return sqlSession.selectOne("boardMapper.selecdeparttListCount");
}


public ArrayList<Board> selectdeptnameList(SqlSessionTemplate sqlSession) {
	// TODO Auto-generated method stub
	return (ArrayList)sqlSession.selectList("boardMapper.selectdeptnameList");
}

public ArrayList<Board> selectdeptList(SqlSessionTemplate sqlSession, PageInfo pi) {
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
    return (ArrayList) sqlSession.selectList("boardMapper.selectdeptList", null, rowBounds);
}



public ArrayList<Board> detailBoard(SqlSessionTemplate sqlSession, int bno) {
	// TODO Auto-generated method stub
	return (ArrayList)sqlSession.selectList("boardMapper.detailBoard" , bno);
}

public int selectstandupListCount(SqlSessionTemplate sqlSession, int con) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("boardMapper.selectstandupListCount" , con);
}

public ArrayList<Board> selectstandupList(SqlSessionTemplate sqlSession, PageInfo pi, Board b) {
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
    return (ArrayList) sqlSession.selectList("boardMapper.selectstandupList", b, rowBounds);
}

public int insertReply(SqlSessionTemplate sqlSession, coment r) {
	// TODO Auto-generated method stub
	return sqlSession.insert("boardMapper.insertReply" , r);
}

public ArrayList<coment> selectcomentList(SqlSessionTemplate sqlSession, int bno) {
	
	return (ArrayList)sqlSession.selectList("boardMapper.selectcomentList",bno);
}

public int deletecoment(SqlSessionTemplate sqlSession, int cno) {
	// TODO Auto-generated method stub
    return sqlSession.update("boardMapper.deletecoment", cno);
}

public int updatedetail(SqlSessionTemplate sqlSession, Board b) {
	// TODO Auto-generated method stub
	return sqlSession.update("boardMapper.updatedetail" , b);
}

public static int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
	// TODO Auto-generated method stub
	return sqlSession.update("boardMapper.deleteBoard" , bno);
}

//임시 보관함
public int selectpboxCount(SqlSessionTemplate sqlSession, int userno) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("boardMapper.selectpboxCount",userno);
}

public ArrayList<Board> selectpbox(SqlSessionTemplate sqlSession, PageInfo pi, int userno) {
	  int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

      return (ArrayList) sqlSession.selectList("boardMapper.selectpbox", userno, rowBounds);
}

public int saveboard(SqlSessionTemplate sqlSession, pbox p) {
	// TODO Auto-generated method stub
	 return sqlSession.insert("boardMapper.saveboard", p);
}

public pbox detailpbox(SqlSessionTemplate sqlSession, int pno) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("boardMapper.detailpbox" , pno);
}

public int deletepbox(SqlSessionTemplate sqlSession, int pno) {
	// TODO Auto-generated method stub
	return sqlSession.update("boardMapper.deletepbox" , pno);
}

//게시글 유저 삽입
public int insertuser(SqlSessionTemplate sqlSession, Board bo) {
	
	return sqlSession.insert("boardMapper.insertuser" , bo);
}

public Board selectuser(SqlSessionTemplate sqlSession, Board bo) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("boardMapper.selectuser" , bo);
}

public ArrayList<Board> readuser(SqlSessionTemplate sqlSession, int wno) {
	// TODO Auto-generated method stub
	return (ArrayList) sqlSession.selectList("boardMapper.readuser", wno);
}

public int savefiles(SqlSessionTemplate sqlSession, Attachment a) {
	// TODO Auto-generated method stub
	return sqlSession.insert("boardMapper.savefiles" , a);
}

public Board details(SqlSessionTemplate sqlSession, int bno) {
	
	return sqlSession.selectOne("boardMapper.details" , bno);
}

public int deletepno(SqlSessionTemplate sqlSession, Board b) {
	// TODO Auto-generated method stub
	return sqlSession.update("boardMapper.deletepno" , b);
}


//익명게시판
public int selectanonymousCount(SqlSessionTemplate sqlSession) {
	// TODO Auto-generated method stub
	 return sqlSession.selectOne("boardMapper.selectanonymousCount");
}

public ArrayList<Board> selectanonymous(SqlSessionTemplate sqlSession, PageInfo pi) {
	 int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

     RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

     return (ArrayList) sqlSession.selectList("boardMapper.selectanonymous", null, rowBounds);
}

public int insertanony(SqlSessionTemplate sqlSession, Board b) {
	// TODO Auto-generated method stub
	return sqlSession.insert("boardMapper.insertanony", b);
}

public ArrayList<Board> detailanonyfiles(SqlSessionTemplate sqlSession, int bno) {
	// TODO Auto-generated method stub
	return (ArrayList)sqlSession.selectList("boardMapper.detailanonyfiles" , bno);
}

public Board detailanony(SqlSessionTemplate sqlSession, int bno) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("boardMapper.detailanony" , bno);
}

public int insertanonycoment(SqlSessionTemplate sqlSession, coment r) {
	// TODO Auto-generated method stub
	return sqlSession.insert("boardMapper.insertanonycoment" , r);
}

public ArrayList<coment> listcomentanony(SqlSessionTemplate sqlSession, int bno) {
	// TODO Auto-generated method stub
	return (ArrayList)sqlSession.selectList("boardMapper.listcomentanony",bno);
}

public ArrayList<Board> selectanonymousold(SqlSessionTemplate sqlSession, PageInfo pi) {
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

    return (ArrayList) sqlSession.selectList("boardMapper.selectanonymousold", null, rowBounds);
}

public ArrayList<Board> allboard(SqlSessionTemplate sqlSession) {
	
	 return (ArrayList) sqlSession.selectList("boardMapper.allboard");
}

public int alllistboardCount(SqlSessionTemplate sqlSession, int boardno) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("boardMapper.alllistboardCount" , boardno);
}

public ArrayList<Board> alllistboard(SqlSessionTemplate sqlSession, int boardno, PageInfo pi) {
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

    return (ArrayList) sqlSession.selectList("boardMapper.alllistboard", boardno, rowBounds);
}

public ArrayList<Board> getboardallnumber(SqlSessionTemplate sqlSession) {
	// TODO Auto-generated method stub
	return (ArrayList) sqlSession.selectList("boardMapper.getboardallnumber");
}

public ArrayList<Board> allboardold(SqlSessionTemplate sqlSession, int boardno, PageInfo pi) {
	
	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

    return (ArrayList) sqlSession.selectList("boardMapper.allboardold", boardno, rowBounds);
}

public void deleteatt(SqlSessionTemplate sqlSession, Board b) {
	
	sqlSession.update("boardMapper.deleteatt" , b);
}

public void savefilesupdate(SqlSessionTemplate sqlSession, Attachment a) {
	sqlSession.insert("boardMapper.savefilesupdate" , a);
	
}

public String bname(SqlSessionTemplate sqlSession, int boardno) {
	
	return sqlSession.selectOne("boardMapper.bname" , boardno);
	
}


}




















   
   

