package com.uni.spring.manageMent.model.service;

import java.util.ArrayList;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.common.Attachment;
import com.uni.spring.department.model.dto.AttendLog;
import com.uni.spring.department.model.dto.Project;
import com.uni.spring.manageMent.model.dto.calendarWeek;
import com.uni.spring.manageMent.model.dto.manageDepart;
import com.uni.spring.member.model.dto.Member;

public interface ManageService {

	ArrayList<Member> selectDepartInfo(Department d);

	ArrayList<Member> selectInfofilter(manageDepart md);

	Attachment selectInfoEmployeeAtt(String empNo);

	ArrayList<Project> selectListProject(String empNo);

	int countSelect();

	void insertAttendlog(int empNo);

	String selectSatatusLog(int empNo);

	ArrayList<AttendLog> selectListAttendLog(calendarWeek cw);

	ArrayList<AttendLog> selectFilterInfo(manageDepart md);

	String selectFirstday();

	ArrayList<AttendLog> selectAttendAvg(calendarWeek cd);

	ArrayList<AttendLog> selectListAttendLogAVG(calendarWeek cw);
}
