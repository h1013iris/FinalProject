package com.uni.spring.admin.model.service;

import java.util.ArrayList;

import com.uni.spring.admin.model.dto.BanWords;
import com.uni.spring.admin.model.dto.BoardManagement;
import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.admin.model.dto.Job;
import com.uni.spring.admin.model.dto.MeetingRoom;
import com.uni.spring.admin.model.dto.MeetingRoomLargeCategory;
import com.uni.spring.admin.model.dto.employee;
import com.uni.spring.admin.model.dto.employeeAllInfo;

public interface adminService {


	ArrayList<Department> selectAllDeptList();

	ArrayList<Job> selectAllJobList();

	employee insertEmp(employee emp);

	ArrayList<employee> selectEmpAllList();

	ArrayList<employee> selectSort(int number);

	employeeAllInfo selectEmp(String empNo);

	ArrayList<BoardManagement> selectBoardAllList();

	void insertBoard(String text);

	void deleteBoard(int boardNo);

	void updateBoard(BoardManagement bm);

	ArrayList<BanWords> selectBanWordsAllList();

	void insertBanWords(String words);

	void deleteBanWords(String words);

	void updateBanWords(BanWords bw);

	ArrayList<MeetingRoomLargeCategory> selectMRAllList();

	void updateMRLC(MeetingRoomLargeCategory mRLC);

	void insertMRLC(String lRoomName);

	void deleteMRLC(int roomNoLarge);

	ArrayList<MeetingRoom> selectSmallList(String roomNoLarge);

	boolean insertMR(MeetingRoom mr);

	void deleteMR(String roomNoSmall);

	boolean updateMR(MeetingRoom mr);

	MeetingRoom selectStatus(String roomNoSmall);

	void maxCountUpdate(MeetingRoom mr);

	void updateStatus(MeetingRoom mr);

	Department deptSelectPage(String deptName);

	ArrayList<employee> deptMemberList(String deptNo);

	void insertDept(String deptName);

	void updateDept(Department dept);

	void updateResponsible(employee emp);

	void deleteDept(String deptNo);

	employee selectEmpUp(String empNo);

	employee updateEmployee(employee emp);


}
