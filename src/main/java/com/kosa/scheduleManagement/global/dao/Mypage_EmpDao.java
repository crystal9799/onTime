package com.kosa.scheduleManagement.global.dao;

public interface Mypage_EmpDao {
	//	전체업무 개수 
		int getTotalSchedNum(int user_id);
		
	//	완료업무 개수	
		int getDoneSchedNum(int user_id);
}
