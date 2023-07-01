package com.kosa.scheduleManagement.kanban;

import java.lang.reflect.Array;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

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
		List<ScheduleBoard> list = getAllPrev();
		System.out.println("-----------list All----------");
		System.out.println(list.toString());

		List<Integer> progList = new ArrayList<Integer>();
		for (ScheduleBoard s : list) {
			System.out.println(s);
			if (s.getSched_prog() == 0) {
				progList.add(s.getSched_prog());
				System.out.println("proglist add complete");
			}
		}

		int tmp = Collections.max(progList) + 1;
		board.setSched_seq(tmp);
		board.setProject_num(10);
		
		dao.insertBoard(board);

		System.out.println("max 값: " + tmp);
		// 마지막 순번 값 ; max(proglist)

		// 이 다음 수로 seq 값 insert
		// System.out.println(board.getSched_seq());
		// list.add(0, board);

		// dao.updateSave(board);
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

	void lastSeq(List<ScheduleBoard> list) throws ClassNotFoundException, SQLException {
		System.out.println();
	}

	/*
	 * public void updateSave(List<ScheduleBoard> boardlist) throws
	 * ClassNotFoundException, SQLException { System.out.println("update conn");
	 * ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
	 * dao.updateSave(boardlist); }
	 */
}
