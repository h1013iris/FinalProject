package com.uni.spring.department.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.Attachment;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.department.model.dao.DepartDao;
import com.uni.spring.department.model.dto.Department;

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
			int findAnnoNum = departDao.insertAnnoNum(sqlSession, d);//통합 분류 넣기
			int result2 = departDao.insertAnnoDepartAttach(sqlSession,a);//첨부파일 넣긴
		}else {
			throw new CommException("게시글 추가 실패");
		}
		
	}

	@Override
	public void insertAnnoDepartNoAttach(Department d) {
		int result = departDao.insertAnnoDepartNoAttach(sqlSession, d);//공지사항 넣기
		if(result<0) {
			throw new CommException("공지사항 추가 실패");
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

}
