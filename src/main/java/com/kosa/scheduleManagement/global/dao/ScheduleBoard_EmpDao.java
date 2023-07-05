package com.kosa.scheduleManagement.global.dao;

import java.sql.SQLException;
import java.util.List;

import com.kosa.scheduleManagement.global.dto.Emp;

public interface ScheduleBoard_EmpDao {
	List<Emp> getAllEmpList() throws ClassNotFoundException, SQLException;
	List<String> getEmpListByProject(int project_num) throws ClassNotFoundException, SQLException;
	int getUseridByEname(String ename) throws ClassNotFoundException, SQLException;
	Emp getEmpBySchedNum(int sched_num) throws ClassNotFoundException, SQLException;
//	Emp getEmpBySchedNum(int sched_num) throws ClassNotFoundException, SQLException;
//		List<Emp> getEmpListByProject() throws ClassNotFoundException, SQLException;
}
