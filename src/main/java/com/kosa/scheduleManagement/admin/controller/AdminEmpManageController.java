package com.kosa.scheduleManagement.admin.controller;

import com.kosa.scheduleManagement.admin.service.EmpManageService;
import com.kosa.scheduleManagement.admin.service.ProjectService;
import com.kosa.scheduleManagement.global.dto.Emp;
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
public class AdminEmpManageController {
    private EmpManageService empManageService;
    private ProjectService projectService;
    @Autowired
    public void setEmpManageService(EmpManageService empManageService) {
        this.empManageService = empManageService;
    }
    
    @Autowired
    public void setProjectService(ProjectService projectService) {
        this.projectService = projectService;
    }
    
    //부서번호로 해당부서 사원들 목록 받기.
    @GetMapping
    public ResponseEntity<List<Emp>> empShow(@RequestParam("deptno") int deptno){
    	List<Emp> list = new ArrayList();
    	
    	try {
    		System.out.println("정상실행");
    		list = empManageService.getList(deptno);
    		return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);
		}
    }
    
    @PostMapping
    public ResponseEntity<String> insertProject(@RequestBody Project_Sub genproject){    	
    	try {
			projectService.insertProject(genproject.getProject());
		} catch (Exception e) {
			
		}
    	
    	return null;
    }
    
    
    
}
