package com.kosa.scheduleManagement.global.dao;

import java.sql.SQLException;
import java.util.List;

import com.kosa.scheduleManagement.global.dto.Project_Emp;

public interface ScheduleBoard_Project_EmpDao {

	List<Project_Emp> getAllProjectEmpList() throws ClassNotFoundException, SQLException;

}
