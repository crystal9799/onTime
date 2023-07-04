package com.kosa.scheduleManagement.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosa.scheduleManagement.admin.service.Project_AdminService;
import com.kosa.scheduleManagement.admin.service.Project_EmpService;
import com.kosa.scheduleManagement.admin.service.Project_Service;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project;
import com.kosa.scheduleManagement.global.dto.Project_Sub;

@CrossOrigin(origins = "http://localhost:8090, http://localhost:9090")
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
    @GetMapping("/createProject.do")
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
    
    //시퀀스 불러오기
    @GetMapping("/getSeq.do")
    public  ResponseEntity<Map<String,Integer>> getSeq(){
    	int seq;
    	Map<String,Integer> project_num;
    	try {
    		System.out.println("try실행");
    		seq = project_Service.getSeq();	
    		System.out.println("seq 의 값은 : "+seq);
    		project_num = new HashMap<String, Integer>();
    		project_num.put("seq", seq);
    		return new ResponseEntity<Map<String,Integer>>(project_num,HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			project_num = new HashMap<String, Integer>();
			return new ResponseEntity<Map<String,Integer>>(project_num,HttpStatus.BAD_REQUEST);
		}
    }
    
    //프로젝트 생성하고, Project / Project_Sub 에 Insert
    @PostMapping("/createProjectOk.do")
    public ResponseEntity<Map<String, String>> insertProject(@RequestBody Project_Sub genproject){    	
    	try {
    		System.out.println(genproject.toString());
    		System.out.println("try블록의 시작");
    		project_Service.insertProject(genproject.getProject());
    		
    		System.out.println("project insert success");
    		System.out.println("Project : " + genproject.getProject().toString());
    		System.out.println("List<Emp> : " + genproject.getEmplist().toString());
    		
    		
			project_empservice.insert_Project_Emp(genproject);
			System.out.println("empinsert success");
			Map<String, String> result = new HashMap<String, String>();
			result.put("message", "success");
			return new ResponseEntity<Map<String, String>>(result,HttpStatus.OK);
		} catch (Exception e) {
			Map<String, String> result = new HashMap<String, String>();
			result.put("message", "fail");
			return new ResponseEntity<Map<String, String>>(result,HttpStatus.BAD_REQUEST);
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
    @GetMapping("/async")
    public List<Project> callMain() {
    	List<Project> projectlist;
    	try {
			projectlist=project_Service.getAllProjectList();
			System.out.println(projectlist.toString());
			return projectlist;
		} catch (Exception e) {
			System.out.println("예외발생");
			e.getMessage();
			return null;
		}
    	
    }
    
}
