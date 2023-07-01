package com.kosa.scheduleManagement.admin.service;

import java.util.List;

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
	
	//프로젝트 상세보기
	public Project project(int project_num) {
		ProjectDao projectdao = sqlsession.getMapper(ProjectDao.class);
		
		return projectdao.projectDetail(project_num);
	}
	
	//Project 전체 호출
	public List<Project> getAllProjectList(){
		ProjectDao projectdao = sqlsession.getMapper(ProjectDao.class);
		
		return projectdao.getAllProjectList();
	}
}
