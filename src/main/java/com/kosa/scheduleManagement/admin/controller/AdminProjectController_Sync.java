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
	
	
	@GetMapping("/admin/main.do")
    public String callMain(Model model) {
    	List<Project> projectlist;
    	try {
			projectlist=project_Service.getAllProjectList();
			System.out.println(projectlist.toString());
			model.addAttribute("projects",projectlist);
			return "home";
		} catch (Exception e) {
			System.out.println("예외발생");
			e.getMessage();
			return null;
		}
    	
    }
}
