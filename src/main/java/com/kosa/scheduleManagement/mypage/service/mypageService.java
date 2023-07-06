package com.kosa.scheduleManagement.mypage.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.scheduleManagement.global.dao.Mypage_EmpDao;
import com.kosa.scheduleManagement.global.dto.Dept;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project;

@Service
public class mypageService {
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
//	사원 정보 업데이트 
	public void updateEmpInfo(Emp emp) {
		
		Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
		
		try {
			System.out.println("service 진입");
			mypage_empdao.updateEmpInfo(emp);
			System.out.println("userInfo update 성공");
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("updateEmpInfoService 오류 :" + e.getMessage());
		}
	}

//	사원 정보 가져오기
	public Emp getEmpInfo(int user_id) {
		Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
		Emp emp = null;
		
		try {
			System.out.println("service 진");
			emp = mypage_empdao.getEmpInfo(user_id);
			System.out.println("getEmpInfo 성공");
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("getEmpInfoService 오류 :" + e.getMessage());
		}
		return emp;
	}
	
//	부서 정보 가져오기
	public Dept getMypageDeptInfo(int user_id) {
		Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
		Dept dept = null;
		
		try {
			System.out.println("service 진");
			dept = mypage_empdao.getMypageDeptInfo(user_id);
			System.out.println("getEmpInfo 성공");
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("getEmpInfoService 오류 :" + e.getMessage());
		}
		return dept;
	}
	
//	시작 전 업무일정 개수
	public int getBeforeSchedNum(int user_id) {
		Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
		
		int result = -1;
		
		try {
			System.out.println("service 진입");
			result = mypage_empdao.getBeforeSchedNum(user_id);
			System.out.println("getTotalSchedNum 성공");
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("getTotalSchedNumService 오류 :" + e.getMessage());
		}
		return result;
	}
	
//	진행중업무일정 개수
	public int getProgSchedNum(int user_id) {
		Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
		
		int result = -1;
		
		try {
			System.out.println("service 진입");
			result = mypage_empdao.getProgSchedNum(user_id);
			System.out.println("getProgSchedNumb 성공");
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("getProgSchedNumbService 오류 :" + e.getMessage());
		}
		return result;
	}
	
//	완료업무일정 개수
	public int getDoneSchedNum(int user_id) {
		Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
		
		int result = -1;
		
		try {
			System.out.println("service 진입");
			result = mypage_empdao.getDoneSchedNum(user_id);
			System.out.println("getDoneSchedNum 성공");
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("getDoneSchedNumService 오류 :" + e.getMessage());
		}
		return result;
	}
	
	//부서 정보 가져오기
		public List<Project> getMypageAdminProjectInfo(int user_id) {
			Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
			List<Project> project = null;
			
			try {
				System.out.println("service 진");
				project = mypage_empdao.getMypageAdminProjectInfo(user_id);
				System.out.println("getEmpInfo 성공");
			} catch (Exception e) {
				e.getStackTrace();
				System.out.println("getMypageAdminProjectInfoService 오류 :" + e.getMessage());
			}
			return project;
		}
		
		//프로젝트 별 개인 일정 총 수
		public int getMypageAdminProjectTotalNum(int user_id, int project_num) {
			Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
			int project = -1;
			
			try {
				System.out.println("service 진");
				project = mypage_empdao.getMypageAdminProjectTotalNum(user_id, project_num);
				System.out.println("getEmpInfo 성공");
			} catch (Exception e) {
				e.getStackTrace();
				System.out.println("getMypageAdminProjectTotalNumService 오류 :" + e.getMessage());
			}
			return project;
		}
		
		//프로젝트 별 완료된 개인 일정 총 수
		public int getMypageAdminProjectDoneNum(int user_id, int project_num) {
			Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
			int project = -1;
			
			try {
				System.out.println("service 진");
				project = mypage_empdao.getMypageAdminProjectDoneNum(user_id, project_num);
				System.out.println("getEmpInfo 성공");
			} catch (Exception e) {
				e.getStackTrace();
				System.out.println("getMypageAdminProjectDoneNumService 오류 :" + e.getMessage());
			}
			return project;
		}
		
//		개인별 전체업무일정 project_num 불러오기
		public List<Integer> getTotalSchedList(int user_id) {
			Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
			
			List<Integer> result = new ArrayList<>();
			
			try {
				System.out.println("service 진입");
				result = mypage_empdao.getTotalScheduleList(user_id);
				System.out.println("getTotalSchedNum 성공");
			} catch (Exception e) {
				e.getStackTrace();
				System.out.println("getTotalSchedNumService 오류 :" + e.getMessage());
			}
			return result;
		}
//		부서장의 개인별 전체업무일정 project_num 불러오기
		public List<Integer> getDheadTotalSchedList(int user_id) {
			Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
			
			List<Project> result = new ArrayList<>();
			List<Integer> projectList = new ArrayList<>();
			
			try {
				System.out.println("service 진입");
				result = mypage_empdao.getMypageAdminProjectInfo(user_id);
				for(int i = 0; i<result.size(); i++) {
					projectList.add(result.get(i).getProject_num());
				}
				System.out.println("getTotalSchedNum 성공");
			} catch (Exception e) {
				e.getStackTrace();
				System.out.println("getTotalSchedNumService 오류 :" + e.getMessage());
			}
			return projectList;
		}
}
