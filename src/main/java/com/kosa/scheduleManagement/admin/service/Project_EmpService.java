package com.kosa.scheduleManagement.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.scheduleManagement.global.dao.Project_EmpDao;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project;
import com.kosa.scheduleManagement.global.dto.Project_Sub;

@Service
public class Project_EmpService {
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	public void insert_Project_Emp(Project_Sub genproject) {
		System.out.println("Project : " + genproject.getProject().toString());
		System.out.println("emplist : " + genproject.getEmplist().toString());
		Project_EmpDao project_empdao = sqlsession.getMapper(Project_EmpDao.class);
		System.out.println("Project_Emp insert 시작");
		
		for(int i=0; i<genproject.getEmplist().size(); i++) {
			int project_num= genproject.getProject().getProject_num();
			int user_id=genproject.getEmplist().get(i).getUser_id();
			project_empdao.insertProject_Emp(project_num,user_id);			
		}
	}
	
	//프로젝트id 리스트
//	public List<Integer> getProjectList(int user_id){
//		Project_EmpDao project_empdao = sqlsession.getMapper(Project_EmpDao.class);
//		System.out.println("프로젝트 리스트 추출");
//		System.out.println(project_empdao.getProjectList(user_id).toString());
//		return project_empdao.getProjectList(user_id);
//	}
}
