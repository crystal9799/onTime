package com.kosa.scheduleManagement.admin.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.scheduleManagement.global.dto.ScheduleBoard;
import com.kosa.scheduleManagement.user.service.ScheduleService;

@Controller
@RequestMapping("/admin/")
public class AdminScheduleManagementController {

	public AdminScheduleManagementController() {
		System.out.println("Controller Connection UserSchedule");
	}

	private ScheduleService service;

	// page load. page data load 피룡
	@GetMapping("schedule.do")
	public String getAllList() throws ClassNotFoundException, SQLException {
		System.out.println("getAllLIst conn");
		return "/kanban/temp";
	}
	
	@GetMapping("scheduletest.do")
	public String getAllListestt() throws ClassNotFoundException, SQLException {
		System.out.println("getAllLIst conn");
		return "/kanban/dataTestPage";
	}
	
	@GetMapping("kanbanviewtest.do")
	public String kanviewTest() throws ClassNotFoundException, SQLException {
		System.out.println("view conn");
		return "/kanban/viewKanbanTemp";
	}

	@GetMapping("viewtest.do")
	public String viewTest() throws ClassNotFoundException, SQLException {
		System.out.println("view conn");
		return "/kanban/modalViewTestPage";
	}

	/*
	 * @RequestMapping(value = "scheduleList.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public List<ScheduleBoard> getAjaxList() throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("ajaxlist connection"); List<ScheduleBoard> list =
	 * service.getAllPrev(); return list; }
	 */

	@PostMapping("schedule/create.do")
	public String insertBoard(ScheduleBoard scheduleBoard) throws ClassNotFoundException, SQLException {
		System.out.println("create admin controller");
		return null;
	}

	@PostMapping("schedule/createOk.do")
	public String createOk(ScheduleBoard scheduleBoard) throws ClassNotFoundException, SQLException {
		return null;
	}

	// rest / put
	public String updateSave() throws ClassNotFoundException, SQLException {
		return null;
	}

}
