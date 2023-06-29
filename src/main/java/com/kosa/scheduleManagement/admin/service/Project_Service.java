package com.kosa.scheduleManagement.admin.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.scheduleManagement.global.dao.ProjectDao;
import com.kosa.scheduleManagement.global.dto.Project;
import com.kosa.scheduleManagement.global.dto.Project_Sub;

@Service
public class Project_Service {
	
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//Project테이블 INSERT
	public int insertProject(Project project) {
		ProjectDao projectdao = sqlsession.getMapper(ProjectDao.class);
		
		return projectdao.insertProject(project);
	}
	
	public Project project(int project_num) {
		ProjectDao projectdao = sqlsession.getMapper(ProjectDao.class);
		
		return projectdao.projectDetail(project_num);
	}
	
	
}
