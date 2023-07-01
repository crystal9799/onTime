package com.kosa.scheduleManagement.kanban;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.amazonaws.util.json.JSONObject;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project_Emp;
import com.kosa.scheduleManagement.global.dto.ScheduleBoard;

@RestController
public class KanbanAjaxController {
	KanbanAjaxController() {
		/* System.out.println("AjaxController constructor controller"); */
	}

	private ScheduleService service;

	@Autowired
	public void setService(ScheduleService service) {
		this.service = service;
	}

	/*
	 * @RequestMapping(value = "/addtest.ajax", method = { RequestMethod.POST })
	 * public void test(@RequestBody ScheduleBoard board) throws Exception {
	 * System.out.println("board print : " + board); }
	 */
	
	@RequestMapping(value = "/uaddSchedule.ajax", method = { RequestMethod.POST })	
	public void test(@RequestParam("user_id") String user_id,
	                 @RequestParam("project_num") String project_num,
	                 @RequestParam("sched_info") String sched_info) {
	        System.out.println(user_id);
	        System.out.println(project_num);
	        System.out.println(sched_info);
	}
	

	@RequestMapping(value = "/ajadd.ajax")
	public ResponseEntity<String> insert() {
		try {
//			service.insert(emp);
			return new ResponseEntity<String>("insert sucess", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("insert fail", HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/addt.ajax")
	public ResponseEntity<String> insert(@RequestBody ScheduleBoard board, HttpServletRequest request) {
		System.out.println("boar:" + board);
		
		//userid에 대한 값 같이 받아와서
		//schedule로 전달필요
		
		
		try {
			service.insertBoard(board);
			service.insertSchedule(null);
			return new ResponseEntity<String>("insert sucess", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("insert fail", HttpStatus.BAD_REQUEST);
		}
	}
	/*
	 * @RequestMapping(value = "/projectemplist.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public List<String> getEmpAndProjectEmpList() throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("empproalllist---- controller connection"); List<String>
	 * list = service.getEmpAndProjectEmpList(); System.out.println("list: " +
	 * list); return list; }
	 */

	// string 으로 임시 변환 상태 --> emp ;service mapper interface
	@RequestMapping(value = "/projectemplist.ajax", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getEmpListByProject() throws ClassNotFoundException, SQLException {
		System.out.println("projectemplist controller connection");
		List<String> list = service.getEmpListByProject();
		System.out.println("list: " + list);
		return list;
	}

	/*
	 * @RequestMapping(value = "/projectemplist.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public List<Emp> getEmpListByProject() throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("projectemplist controller connection"); List<Emp> list =
	 * service.getEmpListByProject(); System.out.println("list: " + list); return
	 * list; }
	 */

	/*
	 * @RequestMapping(value = "/tt.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public List<Project_Emp> getEmpList() throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("ajax EMPPPPPPPPPPPPPP list connection");
	 * List<Project_Emp> list = service.getAllProjectEmpList(); return list; }
	 */

	/*
	 * @RequestMapping(value = "/emplist.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public List<Project_Emp> empList() throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("ajaxlist connection"); List<Project_Emp> list =
	 * service.getAllProjectEmpList(); return list; }
	 */

	/*
	 * @RequestMapping(value = "/add.ajax", method = RequestMethod.POST, consumes =
	 * "application/json;") public void insertBoard(@RequestBody ScheduleBoard
	 * board) throws ClassNotFoundException, SQLException {
	 * System.out.println("------------ajaxlist insert connection-----------");
	 * System.out.println("service board print" + board);
	 * service.insertBoard(board); }
	 */
	/*
	 * @RequestMapping(value = "/insert.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public void insertBoard(ScheduleBoard board) throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("ajaxlist insert connection"); service.insertBoard(board);
	 * }
	 */

	public List<Map<String, Object>> getScheduleMap(@RequestBody List<Map<String, Object>> param) {

		return param;
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
