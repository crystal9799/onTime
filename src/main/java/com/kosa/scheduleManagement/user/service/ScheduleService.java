package com.kosa.scheduleManagement.user.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.scheduleManagement.global.dao.ScheduleBoardDao;
import com.kosa.scheduleManagement.global.dto.ScheduleBoard;

@Service
public class ScheduleService {

	ScheduleService() {
		System.out.println("service conn");
	}

	private SqlSession sqlSession;

	public void insertBoard(ScheduleBoard board) throws ClassNotFoundException, SQLException {
		System.out.println("insert conn");
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		dao.updateSave(board);
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ScheduleBoard> getAllPrev() throws ClassNotFoundException, SQLException {
		System.out.println("Prev conn");
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		List<ScheduleBoard> list = dao.getAllPrev();
		System.out.println("list: " + list);
		return list;
	}

	public List<ScheduleBoard> getAllCurr() throws ClassNotFoundException, SQLException {
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		List<ScheduleBoard> list = dao.getAllCurr();
		return list;
	}

	public List<ScheduleBoard> getAllNext() throws ClassNotFoundException, SQLException {
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		List<ScheduleBoard> list = dao.getAllNext();
		return list;
	}

	public void updateSave(ScheduleBoard board) throws ClassNotFoundException, SQLException {
		System.out.println("update conn");
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		dao.updateSave(board);
	}

	public void deleteBoard(ScheduleBoard board) throws ClassNotFoundException, SQLException {
		System.out.println("update conn");
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		dao.updateSave(board);
	}
	/*
	 * public void updateSave(List<ScheduleBoard> boardlist) throws
	 * ClassNotFoundException, SQLException { System.out.println("update conn");
	 * ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
	 * dao.updateSave(boardlist); }
	 */
}
