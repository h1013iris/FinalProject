package com.uni.spring.department.model.service;

import java.util.ArrayList;

import com.uni.spring.common.Attachment;
import com.uni.spring.department.model.dto.Department;

public interface DepartService {

	void insertAnnoDepart(Department d, Attachment a);


	void insertAnnoDepartNoAttach(Department d);


	ArrayList<Department> selectAnnoDepartList(int adno);


	int increaseCount(int adno);


	Department selectDepartmentAnno(int adno);


	Attachment selectAttachmentAnno(int adno);

}
