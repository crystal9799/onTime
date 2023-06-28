package com.kosa.scheduleManagement.admin.controller;

import com.kosa.scheduleManagement.admin.service.EmpManageService;
import com.kosa.scheduleManagement.global.dto.Emp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/admin")
@RestController
public class AdminEmpManageController {
    private EmpManageService empManageService;
    
    @Autowired
    public void setEmpManageService(EmpManageService empManageService) {
        this.empManageService = empManageService;
    }
    
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
}
