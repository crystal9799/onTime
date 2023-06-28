package com.kosa.scheduleManagement.admin.controller;

import com.kosa.scheduleManagement.admin.service.EmpManageService;
import com.kosa.scheduleManagement.global.dto.Emp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/admin")
@Controller
public class AdminEmpManageController {
    private EmpManageService empManageService;
    
    @Autowired
    public void setEmpManageService(EmpManageService empManageService) {
        this.empManageService = empManageService;
    }
    
    @GetMapping
    public List<Emp> empShow(@RequestParam("deptno") int deptno){
    	System.out.println("empShow 실행");
    	List<Emp> list = empManageService.getList(deptno);
    	System.out.println("서비스 호출 성공");
    	System.out.println(list.toString());
    	return list;
    }
}
