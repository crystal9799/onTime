package com.kosa.scheduleManagement.mypage.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.scheduleManagement.global.dao.EmpDao;
import com.kosa.scheduleManagement.global.dao.Mypage_EmpDao;
import com.kosa.scheduleManagement.global.dao.Project_EmpDao;
import com.kosa.scheduleManagement.global.dto.Emp;

@Service
public class mypageService {
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
//	사원 정보 업데이트 
	public void updateEmpInfo(Emp emp) {
		
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		
		try {
			System.out.println("service 진입");
			empdao.updateEmpInfo(emp);
			System.out.println("userInfo update 성공");
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("updateEmpInfoService 오류 :" + e.getMessage());
		}
	}

//	사원 정보 가져오기
	public Emp getEmpInfo(int user_id) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		Emp emp = null;
		
		try {
			System.out.println("service 진");
			emp = empdao.getEmpInfo(user_id);
			System.out.println("getEmpInfo 성공");
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("getEmpInfoService 오류 :" + e.getMessage());
		}
		return emp;
	}
	
//	전체업무일정 개수
	public int getTotalSchedNum(int user_id) {
		Mypage_EmpDao mypage_empdao = sqlsession.getMapper(Mypage_EmpDao.class);
		
		int result = -1;
		
		try {
			System.out.println("service 진입");
			result = mypage_empdao.getTotalSchedNum(user_id);
			System.out.println("getTotalSchedNum 성공");
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("getTotalSchedNumService 오류 :" + e.getMessage());
		}
		return result;
	}
	
//	전체업무일정 개수
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
}
