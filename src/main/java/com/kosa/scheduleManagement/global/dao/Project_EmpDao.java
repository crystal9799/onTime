package com.kosa.scheduleManagement.global.dao;

import java.util.List;

import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project;
import com.kosa.scheduleManagement.global.dto.Project_Emp;
import com.kosa.scheduleManagement.global.dto.Project_Sub;

public interface Project_EmpDao {
	
	int insertProject_Emp(int project_num, int user_id);
}
