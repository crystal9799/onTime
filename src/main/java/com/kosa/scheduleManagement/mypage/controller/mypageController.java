package com.kosa.scheduleManagement.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
public class mypageController {
	
	@GetMapping("mypage.do")
	public String mypage() {
		System.out.println("요청 진");
		return	"mypage";
	}
	
	@PutMapping("mypage.do/update.do")
	public String mypageUpdate() {
		System.out.println("요청 진");
		return	"todo";
	}
}
