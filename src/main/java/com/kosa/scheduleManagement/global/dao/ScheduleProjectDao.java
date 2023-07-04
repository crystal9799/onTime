package com.kosa.scheduleManagement.global.dao;

import java.sql.SQLException;
import java.util.List;

import com.kosa.scheduleManagement.global.dto.Schedule_Project;

public interface ScheduleProjectDao {
//	Schedule_Project getProject(int project_num)throws ClassNotFoundException, SQLException;
	List<Schedule_Project> getProject(int project_num)throws ClassNotFoundException, SQLException;
}