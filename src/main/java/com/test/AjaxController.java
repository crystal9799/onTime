package com.test;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
 
@RestController
public class AjaxController {
	AjaxController() {
		System.out.println("AjaxController constructor controller");
	}

	private EmpService service;

	@Autowired
	public void setService(EmpService service) {
		this.service = service;
	}

	@RequestMapping(value = "/ajax/list.ajax", method = RequestMethod.POST)
	@ResponseBody
	public List<Emp> empList() throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist connection");
		List<Emp> list = service.getAllEmp();
		return list;
	}

	@RequestMapping(value = "/ajax/add.ajax")
	public ResponseEntity<String> insert(@RequestBody Emp emp, HttpServletRequest request) {
		try {
			service.insert(emp);
			return new ResponseEntity<String>("insert sucess", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("insert fail", HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/ajax/del.ajax")
	public ResponseEntity<String> delete(@RequestBody int empno, HttpServletRequest request) {
		try {
			service.delete(empno);
			return new ResponseEntity<String>("de sucess", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("de fail", HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/ajax/update.ajax")
	public ResponseEntity<String> update(@RequestBody Emp emp, HttpServletRequest request) {
		System.out.println("update controller connnnnn");
		System.out.println(emp.toString());
		try {
			service.update(emp);
			return new ResponseEntity<String>("u sucess", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("uuSS fail", HttpStatus.BAD_REQUEST);
		}
	}
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/ajax/add.ajax", method = RequestMethod.POST) public
	 * String testJson(@RequestBody Emp emp) throws Exception {
	 * System.out.println("insert ajax controoleerr======"); int
	 * dao=service.insert(emp); System.out.println(emp.toString()); return null; }
	 */
	/*
	 * @RequestMapping("/ajax/list.ajax") public List<Emp> empList() throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("ajaxlist connection"); List<Emp> list =
	 * service.getAllEmp(); return list; }
	 */
}
