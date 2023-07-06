package com.kosa.scheduleManagement.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.scheduleManagement.global.dto.Dept;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Mypage_AdminChartInfo;
import com.kosa.scheduleManagement.global.dto.Project;
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
		Emp emp = mypageservice.getEmpInfo(user_id);
		Dept dept = mypageservice.getMypageDeptInfo(user_id);
		
		if ( emp.getDhead_num() == 0 ) {
			List<Project> project = mypageservice.getMypageAdminProjectInfo(user_id);
			List<Mypage_AdminChartInfo> adminChartInfo = new ArrayList<Mypage_AdminChartInfo>();
			
			for (Project pro : project) {
				Mypage_AdminChartInfo mypageAdminChartInfo = new Mypage_AdminChartInfo();
				int totalnum = mypageservice.getMypageAdminProjectTotalNum(user_id, pro.getProject_num());
				int donenum = mypageservice.getMypageAdminProjectDoneNum(user_id, pro.getProject_num());
				double chartNum = totalnum == 0 ? 0 : (double) donenum/ (double) totalnum * 100.0;
				double percentNum = Math.floor(chartNum);
				mypageAdminChartInfo.setProjectName(pro.getProject_name());
				mypageAdminChartInfo.setProjectSchedulePercent(percentNum);				
				adminChartInfo.add(mypageAdminChartInfo);
			};
			model.addAttribute("chart", adminChartInfo);	
		} else if (emp.getDhead_num() > 0) {
			int beforeSchedNum = mypageservice.getBeforeSchedNum(user_id);
			int progSchedNum = mypageservice.getProgSchedNum(user_id);
			int doneSchedNum = mypageservice.getDoneSchedNum(user_id);
			int totalSchedNum = beforeSchedNum + progSchedNum + doneSchedNum;
			double resultDone = Math.floor((double) doneSchedNum/(double)totalSchedNum * 100);
			double resultProg = Math.floor((double) progSchedNum/(double)totalSchedNum * 100);
			double resultBefore = Math.floor((double) beforeSchedNum/(double)totalSchedNum * 100);
			model.addAttribute("resultDone", resultDone);
			model.addAttribute("resultBefore", resultBefore);
			model.addAttribute("resultProg", resultProg);
			model.addAttribute("empDhead_num", emp.getDhead_num());
		}
		
		model.addAttribute("emp", emp);
		model.addAttribute("dept", dept);
		
		return	"mypage";
	}	
}