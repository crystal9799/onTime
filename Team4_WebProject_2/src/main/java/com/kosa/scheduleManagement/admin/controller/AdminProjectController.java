package com.kosa.scheduleManagement.admin.controller;

import com.kosa.scheduleManagement.admin.service.Project_AdminService;
import com.kosa.scheduleManagement.admin.service.Project_Service;
import com.kosa.scheduleManagement.admin.service.Project_EmpService;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project;
import com.kosa.scheduleManagement.global.dto.Project_Sub;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/admin")
@RestController
public class AdminProjectController {
    private Project_AdminService project_adminservice;
    private Project_Service project_Service;
    private Project_EmpService project_empservice;
    
    @Autowired
    public void setProject_empservice(Project_EmpService project_empservice) {
		this.project_empservice = project_empservice;
	}

	@Autowired
    public void setEmpManageService(Project_AdminService project_adminservice) {
        this.project_adminservice = project_adminservice;
    }
    
    @Autowired
    public void setProjectService(Project_Service project_Service) {
        this.project_Service = project_Service;
    }
    
    //부서번호로 해당부서 사원들 목록 받기.
    @GetMapping
    public ResponseEntity<List<Emp>> empShow(@RequestParam("deptno") int deptno){
    	List<Emp> list = new ArrayList();
    	
    	try {
    		System.out.println("정상실행");
    		list = project_adminservice.getList(deptno);
    		return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);
		}
    }
    
    //프로젝트 생성하고, Project / Project_Sub 에 Insert
    @PostMapping("/createProject")
    public ResponseEntity<String> insertProject(@RequestBody Project_Sub genproject){    	
    	try { 
    		System.out.println("try블록의 시작");
    		project_Service.insertProject(genproject.getProject());
    		
    		System.out.println("project insert success");
    		System.out.println("Project : " + genproject.getProject().toString());
    		System.out.println("List<Emp> : " + genproject.getEmplist().toString());
    		
    		
			project_empservice.insert_Project_Emp(genproject);
			System.out.println("empinsert success");
			return new ResponseEntity<String>("insert success",HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("insert failed",HttpStatus.BAD_REQUEST);
		}
    }
    
    //프로젝트 상세보기
    @GetMapping("/getProjectDetail")
    public Project showProject(@RequestParam("project_num") int project_num){
    	Project project;
    	
    	try {
    		System.out.println("호출");
			project = project_Service.project(project_num);
			System.out.println(project.toString());
			return project;
		} catch (Exception e) {
			System.out.println("예외발생");
			e.getMessage();
			return null;
		}
    }
    
    //생성된 프로젝트의 목록()
    @GetMapping("/main.do")
    public List<Project> callMain() {
    	List<Project> projectlist;
    	try {
			projectlist=project_Service.getAllProjectList();
			return projectlist;
		} catch (Exception e) {
			System.out.println("예외발생");
			e.getMessage();
			return null;
		}
    	
    }
    
    //프로젝트 상세보기(캘린더 클릭 시)
    
}
