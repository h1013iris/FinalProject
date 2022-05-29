package com.uni.spring.department.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.Attachment;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.department.model.dao.DepartDao;
import com.uni.spring.department.model.dto.Department;
import com.uni.spring.department.model.dto.DepartmentReply;
import com.uni.spring.department.model.dto.Project;

@Service
public class DepartServiceImpl implements DepartService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private DepartDao departDao;

	@Override
	public void insertAnnoDepart(Department d, Attachment a) {
		int result = departDao.insertAnnoDepart(sqlSession, d);//공지사항 넣기
		
		if(result>0) {
			if(a.getOriginName()!=null) {
				a.setRefListCatNo(60);
				int result2 = departDao.insertAnnoDepartAttach(sqlSession,a);//첨부파일 넣긴
				if(result2<0) {
						throw new CommException("게시글 추가 실패");
				}
			}
		}else {
			throw new CommException("게시글 추가 실패");
		}
		
	}

	@Override
	public ArrayList<Department> selectAnnoDepartList(int adno) {
		ArrayList<Department> list = departDao.selectAnnoDepartList(sqlSession, adno);
		System.out.println("공지사항 리스트 가져와"+list.toString());
		return list;
	}

	@Override
	public int increaseCount(int adno) {
		
		return departDao.increaseCount(sqlSession, adno);
	}

	@Override
	public Department selectDepartmentAnno(int adno) {
		
		return departDao.selectDepartmentAnno(sqlSession, adno);
	}

	@Override
	public Attachment selectAttachmentAnno(int adno) {
		
		return departDao.selectAttachmentAnno(sqlSession, adno);
	}

	@Override
	public void deletAnnoDepart(int adno, String rlcn) {
		int result = departDao.deleteAnnoDepart(sqlSession, adno);//게시글
		if(!rlcn.equals("")) {
			int resultR = departDao.deleteAnnoDepartRef(sqlSession,Integer.parseInt(rlcn));//참조번호
			if(resultR<0) {
				throw new CommException("첨부파일 삭제 실패");
			}
		}
		
		if(result<0) {
			throw new CommException("공지사항 삭제 실패");
		}
	}
	

	@Override
	public void updateAnnoDepart(Department d, Attachment a) {
		int result = departDao.updateAnnoDepart(sqlSession, d);//공지사항 수정
		if(result>0) {
			if(a.getOriginName()!=null) {
				a.setRefListCatNo(60);
				int result2 = departDao.updateAnnoDepartAttach(sqlSession,a);//첨부파일 수정
				if(result2<0) {
					throw new CommException("게시글 추가 실패");
				}
			}
		}else {
			throw new CommException("게시글 추가 실패");
		}
		
		
	}

	@Override
	public void insertAtta(Attachment a) {
		
		int result2 = departDao.insertAnnoDepartreAttach(sqlSession,a);//첨부파일 넣긴
		if(result2<0) {
				throw new CommException("게시글 추가 실패");
		}	
	}

	@Override
	public int insertAnnoReply(DepartmentReply dr) {
		int result = departDao.insertAnnoReply(sqlSession, dr);
		return result;
	}

	@Override
	public ArrayList<DepartmentReply> selectAnnoReplyList(int adno) {//댓글 리스트
		
		return departDao.selectAnnoReplyList(sqlSession, adno);
	}

	@Override
	public int deleteAnnoDepartReply(int adro) {
		
		return departDao.deleteAnnoDepartReply(sqlSession, adro);
	}

	@Override
	public void insertDPSimple(Project p) {
		int result = departDao.insertDPSimple(sqlSession, p);//게시글 등록
		if(result>0) {
			//프로젝트 분류, 프로젝트 참여자(작성자) 넣기
			int result1 = departDao.insertclass(sqlSession);//프로젝트 분류 넣기
			int result2 = departDao.insertInclude(sqlSession,p);//작성자 넣기
			if(result1*result2<0) {
				throw new CommException("게시글 추가 실패");
			}
			
		}else {
			throw new CommException("게시글 추가 실패");
		}
		
	}

	@Override
	public ArrayList<Project> selectProjectList(int emno) {
		
		return departDao.selectProjectList(sqlSession, emno);
	}

}
