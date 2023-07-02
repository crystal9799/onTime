package com.kosa.scheduleManagement.kanban;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.scheduleManagement.global.dao.ScheduleBoardDao;
import com.kosa.scheduleManagement.global.dao.ScheduleBoard_EmpDao;
import com.kosa.scheduleManagement.global.dao.ScheduleBoard_Project_EmpDao;
import com.kosa.scheduleManagement.global.dao.ScheduleDao;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project_Emp;
import com.kosa.scheduleManagement.global.dto.Schedule;
import com.kosa.scheduleManagement.global.dto.ScheduleBoard;

@Service
public class ScheduleService {

	ScheduleService() {
		System.out.println("service conn");
	}

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int getUseridByEname(String ename) throws ClassNotFoundException, SQLException {
		ScheduleBoard_EmpDao scheduleEmpDao = sqlSession.getMapper(ScheduleBoard_EmpDao.class);
		return scheduleEmpDao.getUseridByEname(ename);
	}

	// 클라이언트에서 전달된 info,project 저장된 board 객체 받아와서
	// SEQ 최댓값만 저장 후 (prog 기본값 0)
	// MAPPER에서 num;시퀀스값, 전달 예정
	// 값없을때 예외처리 필요
	public void insertBoard(ScheduleBoard board) throws ClassNotFoundException, SQLException {
		// board seq컬럼 최댓값 구하기
		int tmp = 1;
		if (getAllPrev().size() == 0) {
			tmp = 1;
		} else {
			List<Integer> progList = new ArrayList<Integer>();
			for (ScheduleBoard s : getAllPrev())
				if (s.getSched_prog() == 0)
					progList.add(s.getSched_seq());

			tmp = Collections.max(progList) + 1;
		}
		board.setSched_seq(tmp);
		board.setSched_num(createSeq());
		// 값 변경에정///////////////////////////////////////////////
		board.setProject_num(9);

		ScheduleBoardDao boardDao = sqlSession.getMapper(ScheduleBoardDao.class);
		boardDao.insertBoard(board);
	}

	public int createSeq() throws ClassNotFoundException, SQLException {
		List<Integer> list = new ArrayList<Integer>();

		// 3개 있으면 size4
		// 0개 size 1
		if (getAllPrev().size() == 0) {
			return 1;
		} else {
			for (ScheduleBoard s : getAllPrev())
				list.add(s.getSched_num());
			int tmp = Collections.max(list) + 1;
			System.out.println("snum max:" + tmp);
			return tmp;
		}
	}

	//
	public void insertSchedule(Schedule schedule) throws ClassNotFoundException, SQLException {
		System.out.println("servie 스캐줄 값 :" + schedule);
		schedule.setSched_num(createSeq() - 1);
		System.out.println(schedule.getSched_num());
		ScheduleDao scheduleDao = sqlSession.getMapper(ScheduleDao.class);
		scheduleDao.insertSchedule(schedule);
	}

	public List<Project_Emp> getAllProjectEmpList() throws ClassNotFoundException, SQLException {
		System.out.println("emplistservice");
		ScheduleBoard_Project_EmpDao dao = sqlSession.getMapper(ScheduleBoard_Project_EmpDao.class);
		List<Project_Emp> enameList = dao.getAllProjectEmpList();
		return enameList;
		/*
		 * List<String> enameList = new ArrayList<String>(); ScheduleBoard_EmpDao empdao
		 * = sqlSession.getMapper(ScheduleBoard_EmpDao.class); for (Emp e :
		 * dao.getAllEmpList()) if (e.getDeptno() == 2) enameList.add(e.getEname());
		 * return enameList;
		 */
	}

	/*
	 * public List<String> getEmpAndProjectEmpList() throws ClassNotFoundException,
	 * SQLException { System.out.println("getEmpListByProject conn");
	 * ScheduleBoard_EmpDao empdao =
	 * sqlSession.getMapper(ScheduleBoard_EmpDao.class);
	 * ScheduleBoard_Project_EmpDao pjdao =
	 * sqlSession.getMapper(ScheduleBoard_Project_EmpDao.class); List<Emp> elist =
	 * empdao.getAllEmpList(); List<Project_Emp> pjlist =
	 * pjdao.getAllProjectEmpList();
	 * 
	 * List<String> resultList = new ArrayList<String>(); for (Project_Emp pe :
	 * pjlist) { for(int i=0; i<elist.size(); i++) { if(pe.getUser_id()) } }
	 * 
	 * return resultList; }
	 */
	// string 으로 임시 변환 상태 --> emp ;service mapper interface
	public List<String> getEmpListByProject() throws ClassNotFoundException, SQLException {
		System.out.println("getEmpListByProject conn");
		ScheduleBoard_EmpDao dao = sqlSession.getMapper(ScheduleBoard_EmpDao.class);
		List<String> list = dao.getEmpListByProject();
		System.out.println("list: " + list);
		return list;
	}

	/*
	 * public List<Emp> getEmpListByProject() throws ClassNotFoundException,
	 * SQLException { System.out.println("getEmpListByProject conn");
	 * ScheduleBoard_EmpDao dao = sqlSession.getMapper(ScheduleBoard_EmpDao.class);
	 * List<Emp> list = dao.getEmpListByProject(); System.out.println("list: " +
	 * list); return list; }
	 */

	public List<ScheduleBoard> getAllPrev() throws ClassNotFoundException, SQLException {
		System.out.println("Prev conn");
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		List<ScheduleBoard> list = dao.getAllPrev();
		System.out.println("list size: " + list.size());
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
