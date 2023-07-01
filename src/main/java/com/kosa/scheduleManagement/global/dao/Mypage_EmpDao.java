package com.kosa.scheduleManagement.global.dao;

import java.util.List;

import com.kosa.scheduleManagement.global.dto.Dept;
import com.kosa.scheduleManagement.global.dto.Emp;

public interface Mypage_EmpDao {
	
	//사원정보 수
	void updateEmpInfo(Emp emp);
	
	//사원 정보 
	Emp getEmpInfo(int user_id);
	
	//부서 정보
	Dept getMypageDeptInfo(int user_id);
	
	//	전체업무 개수 
		int getTotalSchedNum(int user_id);
		
	//	완료업무 개수	
		int getDoneSchedNum(int user_id);
		
	//부사장
	List<Dept> getMypageAdminDeptInfo(int user_id);
}
