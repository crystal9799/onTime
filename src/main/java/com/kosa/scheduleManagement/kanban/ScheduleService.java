package com.kosa.scheduleManagement.kanban;

import java.net.MulticastSocket;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kosa.scheduleManagement.global.dao.ScheduleBoardDao;
import com.kosa.scheduleManagement.global.dao.ScheduleBoard_EmpDao;
import com.kosa.scheduleManagement.global.dao.ScheduleBoard_Project_EmpDao;
import com.kosa.scheduleManagement.global.dao.ScheduleDao;
import com.kosa.scheduleManagement.global.dao.ScheduleProjectDao;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project;
import com.kosa.scheduleManagement.global.dto.Project_Emp;
import com.kosa.scheduleManagement.global.dto.Schedule;
import com.kosa.scheduleManagement.global.dto.ScheduleBoard;
import com.kosa.scheduleManagement.global.dto.Schedule_Project;

import net.sf.json.JSONArray;

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
	
	public List<Emp> getEmpBySchedNum(int sched_num) throws ClassNotFoundException, SQLException {
		ScheduleBoard_EmpDao empDao = sqlSession.getMapper(ScheduleBoard_EmpDao.class);
		List<Emp> emp=empDao.getEmpBySchedNum(sched_num);
		System.out.println("sevice emp");
		System.out.println(sched_num);
		return emp;
	}

	public ScheduleBoard getSinfoBySchedNum(int sched_num) throws ClassNotFoundException, SQLException {
		ScheduleBoardDao scheduleDao = sqlSession.getMapper(ScheduleBoardDao.class);
		return scheduleDao.getSinfoBySchedNum(sched_num);
	}
	
	public int getUseridByEname(String ename) throws ClassNotFoundException, SQLException {
		ScheduleBoard_EmpDao scheduleEmpDao = sqlSession.getMapper(ScheduleBoard_EmpDao.class);
		return scheduleEmpDao.getUseridByEname(ename);
	}

	public void progUpdate(int sched_seq, String sched_info) throws ClassNotFoundException, SQLException {
		ScheduleBoardDao boardDao = sqlSession.getMapper(ScheduleBoardDao.class);
		// boardDao.progUpdate(sched_seq, sched_info);
	}
	
	public List<Schedule_Project> getProject(int project_num)  throws ClassNotFoundException, SQLException {
		ScheduleProjectDao boardDao= sqlSession.getMapper(ScheduleProjectDao.class);
		List<Schedule_Project> p=boardDao.getProject(project_num);
		return p;
	}

	public void deleteBoard(int sched_num) throws ClassNotFoundException, SQLException {
		System.out.println("conn service del");
		ScheduleBoardDao boardDao = sqlSession.getMapper(ScheduleBoardDao.class);
		ScheduleBoard board = new ScheduleBoard(sched_num, "", 0, 0, 0);
		boardDao.deleteBoard(board);
	}

	public void updateNext(int sched_num, int sched_seq, String sched_info, int project_num)
			throws ClassNotFoundException, SQLException {
		System.out.println("updateNext serviece====================================");
		ScheduleBoardDao boardDao = sqlSession.getMapper(ScheduleBoardDao.class);
		ScheduleBoard board = new ScheduleBoard(sched_num, sched_info, 2, sched_seq, project_num);
		boardDao.updateNext(board);
		System.out.println("sched_num:" + sched_num);
		System.out.println("sched_info:" + sched_info);
		System.out.println("sched_seq:" + sched_seq);
		System.out.println("project_num:" + project_num);
	}

	public void updatePrev(int sched_num, int sched_seq, String sched_info, int project_num)
			throws ClassNotFoundException, SQLException {
		System.out.println("serviece====================================");
		ScheduleBoardDao boardDao = sqlSession.getMapper(ScheduleBoardDao.class);
		ScheduleBoard board = new ScheduleBoard(sched_num, sched_info, 0, sched_seq, project_num);
		boardDao.updatePrev(board);
//			boardDao.updatePrev(sched_seq, sched_info);
		System.out.println("sched_num:" + sched_num);
		System.out.println("sched_info:" + sched_info);
		System.out.println("sched_seq:" + sched_seq);
		System.out.println("project_num:" + project_num);
	}

	public void updateCurr(int sched_num, int sched_seq, String sched_info, int project_num)
			throws ClassNotFoundException, SQLException {
		System.out.println("serviece====================================");
		ScheduleBoardDao boardDao = sqlSession.getMapper(ScheduleBoardDao.class);
		ScheduleBoard board = new ScheduleBoard(sched_num, sched_info, 1, sched_seq, project_num);
		boardDao.updateCurr(board);
//			boardDao.updatePrev(sched_seq, sched_info);
		System.out.println("sched_num:" + sched_num);
		System.out.println("sched_info:" + sched_info);
		System.out.println("sched_seq:" + sched_seq);
		System.out.println("project_num:" + project_num);

	}

	/*
	 * public void updateCurr(int sched_num, int sched_seq, String sched_info)
	 * throws ClassNotFoundException, SQLException { ScheduleBoardDao boardDao =
	 * sqlSession.getMapper(ScheduleBoardDao.class); ScheduleBoard board = new
	 * ScheduleBoard(0, sched_info, 1, sched_seq, 0); boardDao.updateCurr(board); //
	 * boardDao.updatePrev(sched_seq, sched_info); System.out.println("sched_info:"
	 * + sched_info); System.out.println("sched_seq:" + sched_seq);
	 * 
	 * }
	 */

	public void insertBoard(ScheduleBoard board, int project_num) throws ClassNotFoundException, SQLException {
		board.setSched_seq(createMaxSeq(project_num));
		board.setSched_num(createSeq());
		// 값 변경에정///////////////////////////////////////////////
		System.out.println("bbbbbbbbbbbbboard" + board);
		ScheduleBoardDao boardDao = sqlSession.getMapper(ScheduleBoardDao.class);
		boardDao.insertBoard(board);
	}

	public int createMaxSeq(int project_num) throws ClassNotFoundException, SQLException {
		int tmp = 1;
		if (getAllPrev(project_num).size() == 0) {
			tmp = 1;
		} else {
			List<Integer> progList = new ArrayList<Integer>();
			for (ScheduleBoard s : getAllPrev(project_num))
				if (s.getSched_prog() == 0)
					progList.add(s.getSched_seq());

			tmp = Collections.max(progList) + 1;
		}
		return tmp;
	}

	public int createSeq() throws ClassNotFoundException, SQLException {
		List<Integer> list = new ArrayList<Integer>();

		if (getAllList().size() == 0) {
			return 1;
		} else {
			for (ScheduleBoard s : getAllList())
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

	public List<Project_Emp> getAllProjectEmpListByProject() throws ClassNotFoundException, SQLException {
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
	 * public void insertBoard(ScheduleBoard board) throws ClassNotFoundException,
	 * SQLException { // board seq컬럼 최댓값 구하기 int tmp = 1; if (getAllPrev().size() ==
	 * 0) { tmp = 1; } else { List<Integer> progList = new ArrayList<Integer>(); for
	 * (ScheduleBoard s : getAllPrev()) if (s.getSched_prog() == 0)
	 * progList.add(s.getSched_seq());
	 * 
	 * tmp = Collections.max(progList) + 1; } board.setSched_seq(tmp);
	 * board.setSched_num(createSeq()); // 값
	 * 변경에정/////////////////////////////////////////////// board.setProject_num(9);
	 * 
	 * ScheduleBoardDao boardDao = sqlSession.getMapper(ScheduleBoardDao.class);
	 * boardDao.insertBoard(board); }
	 */

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
	public List<String> getEmpListByProject(int project_num) throws ClassNotFoundException, SQLException {

		ScheduleBoard_EmpDao dao = sqlSession.getMapper(ScheduleBoard_EmpDao.class);
		List<String> list = dao.getEmpListByProject(project_num);
		System.out.println("getEmpListByProject conn");
		System.out.println("pnsss"+project_num);
		System.out.println("list: test" + list);
		return list;
	}

	/*
	 * public List<Emp> getEmpListByProject() throws ClassNotFoundException,
	 * SQLException { System.out.println("getEmpListByProject conn");
	 * ScheduleBoard_EmpDao dao = sqlSession.getMapper(ScheduleBoard_EmpDao.class);
	 * List<Emp> list = dao.getEmpListByProject(); System.out.println("list: " +
	 * list); return list; }
	 */
	
	
	public List<ScheduleBoard> getAllList() throws ClassNotFoundException, SQLException {
		System.out.println("AllList service conn");
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		List<ScheduleBoard> list = dao.getAllList();
		System.out.println("list size: " + list.size());
		return list;
	}
	
	//프로젝트 값 가져오기
	public List<ScheduleBoard> getAllPrev(int project_num) throws ClassNotFoundException, SQLException {
		System.out.println("Prev conn");
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		List<ScheduleBoard> list = dao.getAllPrev(project_num);
		System.out.println("list size: " + list.size());
		return list;
	}

	public List<ScheduleBoard> getAllCurr(int project_num) throws ClassNotFoundException, SQLException {
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		List<ScheduleBoard> list = dao.getAllCurr(project_num);
		return list;
	}

	public List<ScheduleBoard> getAllNext(int project_num) throws ClassNotFoundException, SQLException {
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		List<ScheduleBoard> list = dao.getAllNext(project_num);
		return list;
	}

	public void updateSave(ScheduleBoard board) throws ClassNotFoundException, SQLException {
		System.out.println("update conn");
		ScheduleBoardDao dao = sqlSession.getMapper(ScheduleBoardDao.class);
		dao.updateSave(board);
	}

	/*
	 * public void deleteBoard(ScheduleBoard board) throws ClassNotFoundException,
	 * SQLException { System.out.println("update conn"); ScheduleBoardDao dao =
	 * sqlSession.getMapper(ScheduleBoardDao.class); dao.updateSave(board); }
	 */
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
