package com.kosa.scheduleManagement.kanban;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.scheduleManagement.global.dto.Project;
import com.kosa.scheduleManagement.global.dto.ScheduleBoard;
import com.kosa.scheduleManagement.global.dto.Schedule_Project;
import com.kosa.scheduleManagement.kanban.ScheduleService;

@Controller
public class ScheduleBoardController {

	ScheduleBoardController() {
		System.out.println("schedulec contolrlrlrlr testc onn");
	}

	private ScheduleService service;

	@Autowired
	public void setService(ScheduleService service) {
		this.service = service;
	}

	@GetMapping("getProjectDetail.do")
	public String getScheduleList(@RequestParam("project_num") int project_num, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("getAllDetail conn");
		
		List<ScheduleBoard> prevList = service.getAllPrev(project_num);
		List<ScheduleBoard> currList = service.getAllCurr(project_num);
		List<ScheduleBoard> nextList = service.getAllNext(project_num);

		List<Schedule_Project> p=service.getProject(project_num);

		System.out.println("proejct contorlllrlelele=======");
		System.out.println(p);

		model.addAttribute("plist", prevList);
		model.addAttribute("clist", currList);
		model.addAttribute("nlist", nextList);
		model.addAttribute("project_num", project_num);
		model.addAttribute("p", p);

		return "/kanban/kanbanViewPage";
	}
}