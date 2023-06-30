package com.kosa.scheduleManagement.user.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosa.scheduleManagement.global.dto.ScheduleBoard;
import com.kosa.scheduleManagement.user.service.ScheduleService;

@RestController
public class KanbanAjaxController {
	KanbanAjaxController() {
		System.out.println("AjaxController constructor controller");
	}

	private ScheduleService service;

	@Autowired
	public void setService(ScheduleService service) {
		this.service = service;
	}

	@RequestMapping(value = "/insert.ajax", method = RequestMethod.POST)
	@ResponseBody
	public void insertBoard(ScheduleBoard board) throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist insert connection");
		service.insertBoard(board);
	}

	@RequestMapping(value = "/listPrev.ajax", method = RequestMethod.POST)
	@ResponseBody
	public List<ScheduleBoard> getAllPrev() throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist connection");
		List<ScheduleBoard> list = service.getAllPrev();
		System.out.println("list: " + list);
		return list;
	}

	@RequestMapping(value = "/listCurr.ajax", method = RequestMethod.GET)
	@ResponseBody
	public List<ScheduleBoard> getAllCurr() throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist connection");
		List<ScheduleBoard> list = service.getAllNext();
		System.out.println("list: " + list);
		return list;
	}

	@RequestMapping(value = "/listNext.ajax", method = RequestMethod.GET)
	@ResponseBody
	public List<ScheduleBoard> getAllNext() throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist connection");
		List<ScheduleBoard> list = service.getAllNext();
		System.out.println("list: " + list);
		return list;
	}

	@RequestMapping(value = "/update.ajax", method = RequestMethod.POST)
	@ResponseBody
	public void updateSave(ScheduleBoard board) throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist update connection");
		service.updateSave(board);
	}

	@RequestMapping(value = "/delete.ajax", method = RequestMethod.GET)
	@ResponseBody
	public void deleteBoard(ScheduleBoard board) throws ClassNotFoundException, SQLException {
		System.out.println("delete connection");
		service.deleteBoard(board);
	}

}
