package com.uni.spring.department.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.common.Attachment;
import com.uni.spring.department.model.dto.Department;
import com.uni.spring.department.model.dto.DepartmentReply;
import com.uni.spring.department.model.dto.Project;
import com.uni.spring.department.model.dto.ProjectClass;
import com.uni.spring.department.model.dto.SemiCheckList;
import com.uni.spring.department.model.dto.SemiProject;
import com.uni.spring.member.model.dto.Member;

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

	public int insertFavProject(SqlSessionTemplate sqlSession, Project p) {
		
		return sqlSession.insert("departMapper.insertFavProject", p);
	}

	public ArrayList<Project> selectFavProjectList(SqlSessionTemplate sqlSession, int emno) {
		
		return (ArrayList)sqlSession.selectList("departMapper.selectFavProjectList", emno);
	}

	public Project selectProjectFav(SqlSessionTemplate sqlSession, Project p) {
		
		return sqlSession.selectOne("departMapper.selectProjectFav",p);
	}

	public int deleteProjectFav(SqlSessionTemplate sqlSession, Project p) {
		
		return sqlSession.delete("departMapper.deleteProjectFav",p);
	}

	public Project selectDetailProject(SqlSessionTemplate sqlSession, int pjno) {
		
		return sqlSession.selectOne("departMapper.selectDetailProject",pjno);
	}

	public ProjectClass selectPC(SqlSessionTemplate sqlSession, int pjno) {
		
		return sqlSession.selectOne("departMapper.selectPC",pjno);
	}

	public ArrayList<Member> selectPW(SqlSessionTemplate sqlSession, int pjno) {
		
		return (ArrayList)sqlSession.selectList("departMapper.selectPW", pjno);
	}

	public ArrayList<SemiProject> selectSP(SqlSessionTemplate sqlSession, int pjno) {
		
		return (ArrayList)sqlSession.selectList("departMapper.selectSP", pjno);
	}
	
	public int insertSemiPro(SqlSessionTemplate sqlSession, SemiProject sp) {
		
		return sqlSession.insert("departMapper.insertSemiPro", sp);
	}

	public int updateprjectClass(SqlSessionTemplate sqlSession, ProjectClass pc) {
		
		return sqlSession.update("departMapper.updateprjectClass",pc);
	}
	
	public int updateSemiProTar(SqlSessionTemplate sqlSession, ProjectClass pc) {
		
		return sqlSession.update("departMapper.updateSemiProTar", pc);
	}
	
	public int deleteTargetName(SqlSessionTemplate sqlSession, ProjectClass pc) {
		
		return sqlSession.update("departMapper.deleteTargetName",pc);
	}

	public int deleteSemiProTar(SqlSessionTemplate sqlSession, ProjectClass pc) {
		
		return sqlSession.update("departMapper.deleteSemiProTar",pc);
	}

	public SemiProject selectSemiDetailPro(SqlSessionTemplate sqlSession, int sino) {
		
		return sqlSession.selectOne("departMapper.selectSemiDetailPro", sino);
	}

	public int updateSemiPro(SqlSessionTemplate sqlSession, SemiProject sp) {
		
		return sqlSession.update("departMapper.updateSemiPro", sp);
	}

	public int updateSemiDueNull(SqlSessionTemplate sqlSession, int semiNo) {
		
		return sqlSession.update("departMapper.updateSemiDueNull", semiNo);
	}

	public int insertCheckList(SqlSessionTemplate sqlSession, SemiCheckList scl) {
		
		return sqlSession.insert("departMapper.insertCheckList", scl);
	}

	public ArrayList<SemiCheckList> selectCheckList(SqlSessionTemplate sqlSession,SemiCheckList scl) {
		
		return (ArrayList)sqlSession.selectList("departMapper.selectCheckList", scl);
	}

	public int deletecheckList(SqlSessionTemplate sqlSession,  int ckeckNo) {
		
		return sqlSession.update("departMapper.deletecheckList",ckeckNo);
	}

	public int deleteTotcheckList(SqlSessionTemplate sqlSession, int refSemi) {
		
		return sqlSession.update("departMapper.deleteTotcheckList",refSemi);
	}

	public int updateckeckList(SqlSessionTemplate sqlSession, int ckeckNo) {
		
		return sqlSession.update("departMapper.updateckeckList", ckeckNo);
	}

	public int updatereckeckList(SqlSessionTemplate sqlSession, int ckeckNo) {
		
		return sqlSession.update("departMapper.updatereckeckList", ckeckNo);
	}

	public ArrayList<Member> selectTL(SqlSessionTemplate sqlSession, int pjno) {
		
		return (ArrayList)sqlSession.selectList("departMapper.selectTL", pjno);
	}

	public int deleteWatcher(SqlSessionTemplate sqlSession, Project p) {
		
		return sqlSession.update("departMapper.deleteWatcher", p);
	}

	public int insertWatcherP(SqlSessionTemplate sqlSession, Project p) {
		
		return sqlSession.insert("departMapper.insertWatcherP", p);
	}

	public int updateComment(SqlSessionTemplate sqlSession, SemiProject sp) {
		
		return sqlSession.update("departMapper.updateComment", sp);
	}

	public int updatereComment(SqlSessionTemplate sqlSession, int semiNo) {
		
		return sqlSession.update("departMapper.updatereComment", semiNo);
	}

	public int deleteComment(SqlSessionTemplate sqlSession, int semiNo) {
		
		return sqlSession.update("departMapper.deleteComment", semiNo);
	}

	

}
