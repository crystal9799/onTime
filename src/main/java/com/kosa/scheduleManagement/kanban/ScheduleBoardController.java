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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.scheduleManagement.global.dto.ScheduleBoard;
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
	public String getd(Model model) throws ClassNotFoundException, SQLException {
		System.out.println("getAllDetail conn");

		List<ScheduleBoard> prevList = service.getAllPrev();
		List<ScheduleBoard> currList = service.getAllCurr();
		List<ScheduleBoard> nextList = service.getAllNext();

		System.out.println("plist: ");
		System.out.println(prevList);

		model.addAttribute("plist", prevList);
		model.addAttribute("clist", currList);
		model.addAttribute("nlist", nextList);

		return "/kanban/kanbanViewPage";
	}
}
