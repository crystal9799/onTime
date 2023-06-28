package com.kosa.scheduleManagement.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kosa.scheduleManagement.global.dao.Project_EmpDao;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project;

@Service
public class Project_EmpService {
	private SqlSession sqlsession;
	
	
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	public void insert_Project_Emp(Project project, List<Emp> emplist) {
		Project_EmpDao project_empdao = sqlsession.getMapper(Project_EmpDao.class);
		
		for(int index=0; index<emplist.size(); index++) {
			project_empdao.insertProject_Emp(project.getProject_num(), emplist.get(index).getUser_id());
			System.out.println("작업완료 : "+index+"번째");
		}
	}
}