package com.uni.spring.admin.model.service;

import java.util.ArrayList;

import com.uni.spring.admin.model.dto.Department;
import com.uni.spring.admin.model.dto.Job;
import com.uni.spring.admin.model.dto.employee;

public interface adminService {


	ArrayList<Department> selectAllDeptList();

	ArrayList<Job> selectAllJobList();

	employee insertEmp(employee emp);

}
