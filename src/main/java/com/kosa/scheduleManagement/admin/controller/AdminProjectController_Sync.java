package com.kosa.scheduleManagement.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosa.scheduleManagement.admin.service.Project_Service;
import com.kosa.scheduleManagement.global.dto.Project;

@Controller
public class AdminProjectController_Sync {
	
    private Project_Service project_Service;
	
	@Autowired
    public void setProjectService(Project_Service project_Service) {
        this.project_Service = project_Service;
    }
	
	
	@GetMapping("/main.do")

    public String callMain() {
    	return "home";
    }
}
