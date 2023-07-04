package com.kosa.scheduleManagement;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.mypage.service.mypageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private mypageService mypageservice;
	
	@Autowired
	public void setMypageservice(mypageService mypageservice) {
		this.mypageservice = mypageservice;
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login";
	}
	
	//GET 요청
	//join.jsp 화면
	@GetMapping("/join")  //  /joinus/join.htm
	public String join() {
		return "login";
	}
	
	//POST 요청
	@PostMapping("/join")
	public String join2() {
		return "home";
	}
	
	@GetMapping("/main.do")
	public String login(HttpServletRequest request, Principal principal, Model model) {
		HttpSession session = request.getSession();
		Emp emp = mypageservice.getEmpInfo(Integer.valueOf(principal.getName()));
		model.addAttribute("emp",emp);
		session.setAttribute("emp", emp);
		return "home";
	}
	
	@GetMapping("/error")
	public String error() {
		return "404";
	}
	
	
}
