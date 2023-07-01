package com.kosa.scheduleManagement.global.dao;

import java.sql.SQLException;

import com.kosa.scheduleManagement.global.dto.Schedule;

public interface ScheduleDao {
	void insertSchedule(Schedule schedule) throws ClassNotFoundException, SQLException;
}