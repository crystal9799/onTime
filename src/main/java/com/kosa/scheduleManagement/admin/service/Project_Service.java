package com.kosa.scheduleManagement.admin.service;

import java.util.List;
import java.util.Map;

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
		System.out.println(projectdao.getAllProjectList().toString());
		return projectdao.getAllProjectList();
	}
	
	//현재 시퀀스
	public int getSeq() {
		ProjectDao projectdao = sqlsession.getMapper(ProjectDao.class);
		return projectdao.getSeq();
	}
	
	public List<Map<String, Object>> getProjectList(int user_id){
	    ProjectDao projectdao = sqlsession.getMapper(ProjectDao.class);
	    
	    return projectdao.getprojectList(user_id);
	}
}
