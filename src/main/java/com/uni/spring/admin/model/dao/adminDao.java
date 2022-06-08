package com.uni.spring.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.admin.model.dto.Authority;
import com.uni.spring.admin.model.dto.BanWords;
import com.uni.spring.admin.model.dto.BoardManagement;
import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.admin.model.dto.Job;
import com.uni.spring.admin.model.dto.MeetingRoom;
import com.uni.spring.admin.model.dto.MeetingRoomLargeCategory;
import com.uni.spring.admin.model.dto.employee;
import com.uni.spring.admin.model.dto.employeeAllInfo;

@Repository
public class adminDao {

	public ArrayList<Department> selectAllDeptList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("adminMapper.selectAllDeptList");
	}

	public ArrayList<Job> selectAllJobList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("adminMapper.selectAllJobList");
	}

	public int insertEmp(SqlSessionTemplate sqlSession, employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertEmp",emp);
	}

	public employee insertUserSelect(SqlSessionTemplate sqlSession, String cityNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.insertUserSelect",cityNo);
	}

	public ArrayList<employee> selectEmpAllList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectEmpAllList");
	}

	public ArrayList<employee> selectSort(SqlSessionTemplate sqlSession, int number) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectSort", number);
	}

	public employeeAllInfo selectEmp(SqlSessionTemplate sqlSession, String empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectEmp",empNo);
	}

	public ArrayList<BoardManagement> selectBoardAllList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoardAllList");
	}

	public int insertBoard(SqlSessionTemplate sqlSession, String text) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertBoard",text);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminMapper.deleteBoard",boardNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, BoardManagement bm) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateBoard", bm);
	}

	public ArrayList<BanWords> selectBanWordsAllList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectBanWordsAllList");
	}

	public int insertBanWords(SqlSessionTemplate sqlSession, String words) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertBanWords",words);
	}

	public int deleteBanWords(SqlSessionTemplate sqlSession, String words) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminMapper.deleteBanWords", words);
	}

	public int updateBanWords(SqlSessionTemplate sqlSession, BanWords bw) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateBanWords", bw);
	}

	public ArrayList<MeetingRoomLargeCategory> selectMRAllList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectMRAllList");
	}

	public int updateMRLC(SqlSessionTemplate sqlSession, MeetingRoomLargeCategory mRLC) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateMRLC", mRLC);
	}

	public int insertMRLC(SqlSessionTemplate sqlSession, String LRoomName) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertMRLC", LRoomName);
	}

	public int deleteMRLC(SqlSessionTemplate sqlSession, int roomNoLarge) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminMapper.deleteMRLC",roomNoLarge);
	}

	public ArrayList<MeetingRoom> selectSmallList(SqlSessionTemplate sqlSession, String roomNoLarge) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectSmallList", Integer.parseInt(roomNoLarge));
	}

	public int insertMR(SqlSessionTemplate sqlSession, MeetingRoom mr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertMR", mr);
	}

	public ArrayList<String> selectMR(SqlSessionTemplate sqlSession, MeetingRoom mr) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectMR", mr);
	}

	public int deleteMR(SqlSessionTemplate sqlSession, String roomNoSmall) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminMapper.deleteMR",Integer.parseInt(roomNoSmall));
	}

	public int updateMR(SqlSessionTemplate sqlSession, MeetingRoom mr) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateMR", mr);
	}

	public MeetingRoom selectStatus(SqlSessionTemplate sqlSession, String roomNoSmall) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectStatus", Integer.parseInt(roomNoSmall));
	}

	public int maxCountUpdate(SqlSessionTemplate sqlSession, MeetingRoom mr) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.maxCountUpdate",mr);
	}

	public int updateStatus(SqlSessionTemplate sqlSession, MeetingRoom mr) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateStatus",mr);
	}

	public ArrayList<Authority> selectAuthorityAllList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminMapper.selectAuthorityAllList");
	}

}
