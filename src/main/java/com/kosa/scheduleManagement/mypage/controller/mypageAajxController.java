package com.kosa.scheduleManagement.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.mypage.service.mypageService;

@RestController
@RequestMapping("/mypage")
public class mypageAajxController {
	
	private mypageService mypageservice;
	
	@Autowired
	public void setMypageservice(mypageService mypageservice) {
		this.mypageservice = mypageservice;
	}
	
	@PutMapping("/update.do")
	@ResponseBody
	public ResponseEntity<String> mypageUpdate(@RequestBody Emp emp) {
		System.out.println("controller");
		try {
			mypageservice.updateEmpInfo(emp);
			return new ResponseEntity<String>("insert sucess", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("insert fail", HttpStatus.BAD_REQUEST);
		}
	}
}
