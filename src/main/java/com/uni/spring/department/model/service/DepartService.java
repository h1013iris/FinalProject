package com.uni.spring.department.model.service;

import java.util.ArrayList;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.common.Attachment;
import com.uni.spring.department.model.dto.Department;
import com.uni.spring.department.model.dto.DepartmentReply;
import com.uni.spring.department.model.dto.Project;
import com.uni.spring.department.model.dto.ProjectClass;
import com.uni.spring.department.model.dto.SemiCheckList;
import com.uni.spring.department.model.dto.SemiProject;
import com.uni.spring.member.model.dto.Member;

public interface DepartService {

	void insertAnnoDepart(Department d, Attachment a);

	ArrayList<Department> selectAnnoDepartList(int adno);

	int increaseCount(int adno);

	Department selectDepartmentAnno(int adno);

	Attachment selectAttachmentAnno(int adno);

	void deletAnnoDepart(int adno, String rlcn);

	void updateAnnoDepart(Department d, Attachment a);

	void insertAtta(Attachment a);

	int insertAnnoReply(DepartmentReply dr);

	ArrayList<DepartmentReply> selectAnnoReplyList(int adno);

	int deleteAnnoDepartReply(int adro);

	void insertDPSimple(Project p);

	ArrayList<Project> selectProjectList(int emno);

	int insertFavProject(Project p);

	ArrayList<Project> selectFavProjectList(int emno);

	int deleteProjectFav(Project p);

	Project selectDetailProject(int pjno);

	ProjectClass selectPC(int pjno);

	ArrayList<Member> selectPW(int pjno);

	void insertSemiPro(SemiProject sp);

	ArrayList<SemiProject> selectSP(int pjno);

	void updateprjectClass(ProjectClass pc);

	void deleteTargetName(ProjectClass pc);

	SemiProject selectSemiDetailPro(int sino);

	void updateSemiPro(SemiProject sp);

	void updateSemiDueNull(int semiNo);

	void insertCheckList(SemiCheckList scl);

	ArrayList<SemiCheckList> selectCheckList(SemiCheckList scl);

	void deletecheckList(int ckeckNo);

	void deleteTotcheckList(int refSemi);

	void updateckeckList(int ckeckNo);

	void updatereckeckList(int ckeckNo);

	ArrayList<Member> selectTL(int pjno);

	void deleteWatcher(Project p);

	void insertWatcherP(Project p);

	void updateComment(SemiProject sp);

	void deleteComment(int semiNo);

	int insertSemiReply(DepartmentReply sr);

	ArrayList<DepartmentReply> selectSemiReplyList(int refDepartNo);

	void deleteReplySemi(DepartmentReply sr);

	void insertSemiFileUpload(Attachment a);

	void deleteSemiProject(SemiProject sp);

	ArrayList<Attachment> selectAttachList(int semiNo);

	void deleteAttachOne(Attachment a);

	void updateTagSemi(SemiProject sp);

	ArrayList<Department> selectAnnoDepartListMain(int departmentNo);

	ArrayList<Board> selectBoardDepartListMain(int departmentNo);


}
