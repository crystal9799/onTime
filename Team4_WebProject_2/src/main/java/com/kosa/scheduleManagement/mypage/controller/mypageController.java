package com.kosa.scheduleManagement.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.mypage.service.mypageService;

@Controller
public class mypageController {
	
	private mypageService mypageservice;
	
	@Autowired
	public void setMypageservice(mypageService mypageservice) {
		this.mypageservice = mypageservice;
	}

	@GetMapping("mypage.do")
	public String mypage(@RequestParam("user_id") int user_id, Model model) {
		int totalSchedNum = mypageservice.getTotalSchedNum(user_id);
		System.out.println(totalSchedNum); 
		int doneSchedNum = mypageservice.getDoneSchedNum(user_id);
		System.out.println(doneSchedNum); 

		Emp emp = mypageservice.getEmpInfo(user_id);
		System.out.println("emp : " + emp);
		
		model.addAttribute("emp", emp);
		model.addAttribute("totalSchedNum", totalSchedNum);
		model.addAttribute("doneSchedNum", doneSchedNum);		
		
		return	"mypage";
	}
	
	@GetMapping("test_mypage.do")
	public String test_upload(@RequestParam("user_id") int user_id, Model model) {
		int totalSchedNum = mypageservice.getTotalSchedNum(user_id);
		System.out.println(totalSchedNum); 
		int doneSchedNum = mypageservice.getDoneSchedNum(user_id);
		System.out.println(doneSchedNum); 

		Emp emp = mypageservice.getEmpInfo(user_id);
		System.out.println("emp : " + emp);
		
		model.addAttribute("emp", emp);
		model.addAttribute("totalSchedNum", totalSchedNum);
		model.addAttribute("doneSchedNum", doneSchedNum);
		
		return	"test_upload_mypage";
	}
	
//	@GetMapping("mypage.do")
//	public String mypage(@RequestBody Schedule_Emp schedule_emp) {
//		int result1 = mypageservice.getTotalSchedNum(schedule_emp.getSchedule().getUser_id());
//		System.out.println(result1); 
//		int result2 = mypageservice.getDoneSchedNum(schedule_emp.getSchedule().getUser_id());
//		System.out.println(result2); 
//
//		Emp emp = mypageservice.getEmpInfo(schedule_emp.getSchedule().getUser_id());
//		System.out.println("emp : " + emp);
//		return	"mypage";
//	}
	

}