package com.kosa.scheduleManagement.global.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.kosa.scheduleManagement.global.dto.ScheduleBoard;

public interface ScheduleBoardDao {
//	HashMap<String, ScheduleBoard> getAllMap() throws ClassNotFoundException, SQLException;
//	HashMap<String, ScheduleBoard> getAllUpdate() throws ClassNotFoundException, SQLException;

	List<ScheduleBoard> getAllPrev() throws ClassNotFoundException, SQLException;
	List<ScheduleBoard> getAllCurr() throws ClassNotFoundException, SQLException;
	List<ScheduleBoard> getAllNext() throws ClassNotFoundException, SQLException;

//	ScheduleBoard searchByEmp(int sched_num) throws ClassNotFoundException, SQLException;

	void insertBoard(ScheduleBoard scheduleBoard) throws ClassNotFoundException, SQLException;
	void updateSave(ScheduleBoard scheduleBoard) throws ClassNotFoundException, SQLException;
//	void updateSave(List<ScheduleBoard> list) throws ClassNotFoundException, SQLException;
	void deleteBoard(ScheduleBoard scheduleBoard) throws ClassNotFoundException, SQLException;
}