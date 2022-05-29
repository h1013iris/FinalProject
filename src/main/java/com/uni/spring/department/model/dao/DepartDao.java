package com.uni.spring.department.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.common.Attachment;
import com.uni.spring.department.model.dto.Department;
import com.uni.spring.department.model.dto.DepartmentReply;
import com.uni.spring.department.model.dto.Project;

@Repository
public class DepartDao {
	
	//공지사항 넣는 부분
	public int insertAnnoDepart(SqlSessionTemplate sqlSession, Department d) {
		return sqlSession.insert("departMapper.insertAnnoDepart", d);
	}

	//첨부파일 넣는 부분
	public int insertAnnoDepartAttach(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("departMapper.insertAnnoDepartAttach",a);
	}

	//통합분류에 넣는 부분
	public int insertAnnoNum(SqlSessionTemplate sqlSession, Department d) {
		
		return sqlSession.insert("departMapper.insertAnnoNum", d);
	}

	public int insertAnnoDepartNoAttach(SqlSessionTemplate sqlSession, Department d) {
		
		return sqlSession.insert("departMapper.insertAnnoDepartNoAttach", d);
	}

	public ArrayList<Department> selectAnnoDepartList(SqlSessionTemplate sqlSession, int adno) {
		
		return (ArrayList)sqlSession.selectList("departMapper.selectAnnoDepartList", adno);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int adno) {
		
		return sqlSession.update("departMapper.increaseCount",adno);
	}

	public Department selectDepartmentAnno(SqlSessionTemplate sqlSession, int adno) {
		
		return sqlSession.selectOne("departMapper.selectDepartmentAnno",adno);
	}

	public Attachment selectAttachmentAnno(SqlSessionTemplate sqlSession, int adno) {
		
		return sqlSession.selectOne("departMapper.selectAttachmentAnno", adno);
	}

	public int deleteAnnoDepart(SqlSessionTemplate sqlSession, int adno) {
		return sqlSession.update("departMapper.deleteAnnoDepart", adno);
	}

	public int deleteAnnoDepartRef(SqlSessionTemplate sqlSession, int rlcn) {
		
		return sqlSession.update("departMapper.deleteAnnoDepartRef",rlcn);
	}

	public int updateAnnoDepart(SqlSessionTemplate sqlSession, Department d) {
		
		return sqlSession.update("departMapper.updateAnnoDepart", d);
	}

	public int updateAnnoDepartAttach(SqlSessionTemplate sqlSession, Attachment a) {
		
		return sqlSession.update("departMapper.updateAnnoDepartAttach",a);
	}

	public int insertAnnoDepartreAttach(SqlSessionTemplate sqlSession, Attachment a) {
		
		return sqlSession.insert("departMapper.insertAnnoDepartreAttach",a);
	}

	public int insertAnnoReply(SqlSessionTemplate sqlSession, DepartmentReply dr) {
		System.out.println(dr.toString());
		return sqlSession.insert("departMapper.insertAnnoReply", dr);
	}

	public ArrayList<DepartmentReply> selectAnnoReplyList(SqlSessionTemplate sqlSession, int adno) {
		
		return (ArrayList)sqlSession.selectList("departMapper.selectAnnoReplyList",adno);
	}

	public int deleteAnnoDepartReply(SqlSessionTemplate sqlSession, int adro) {
		
		return sqlSession.update("departMapper.deleteAnnoDepartReply", adro);
	}

	public int insertDPSimple(SqlSessionTemplate sqlSession, Project p) {
		
		return sqlSession.insert("departMapper.insertDPSimple", p);
	}

	public int insertclass(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("departMapper.insertclass");
	}

	public int insertInclude(SqlSessionTemplate sqlSession, Project p) {
		
		return sqlSession.insert("departMapper.insertInclude", p);
	}

	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, int emno) {
		
		return (ArrayList)sqlSession.selectList("departMapper.selectProjectList", emno);
	}


}
