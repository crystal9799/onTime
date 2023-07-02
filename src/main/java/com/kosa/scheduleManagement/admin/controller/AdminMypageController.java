package com.kosa.scheduleManagement.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.scheduleManagement.admin.service.Mypage_AdminService;
import com.kosa.scheduleManagement.global.dto.Dept;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Mypage_AdminChartInfo;
import com.kosa.scheduleManagement.global.dto.Project;

@Controller
@RequestMapping("/admin/")
public class AdminMypageController {
	private Mypage_AdminService mypageAdminService;
	
	@Autowired
	public void setMypageAdminService(Mypage_AdminService mypageAdminService) {
		this.mypageAdminService = mypageAdminService;
	}

	@GetMapping("mypage.do")
	public String mypage(@Param("user_id") int user_id, Model model) {
		try {
			Emp emp = mypageAdminService.getEmpInfo(user_id);
			Dept dept = mypageAdminService.getMypageDeptInfo(user_id);
			List<Project> project = mypageAdminService.getMypageAdminProjectInfo(user_id);
			List<Mypage_AdminChartInfo> adminChartInfo = new ArrayList<Mypage_AdminChartInfo>();
			
			for (Project pro : project) {
				Mypage_AdminChartInfo mypageAdminChartInfo = new Mypage_AdminChartInfo();
				int totalnum = mypageAdminService.getMypageAdminProjectTotalNum(user_id, pro.getProject_num());
				int donenum = mypageAdminService.getMypageAdminProjectDoneNum(user_id, pro.getProject_num());
				double percentNum = Math.floor(totalnum/donenum);
				mypageAdminChartInfo.setProjectName(pro.getProject_name());
				mypageAdminChartInfo.setTotalNum(totalnum);
				mypageAdminChartInfo.setDoneNum(donenum);
				mypageAdminChartInfo.setProjectSchedulePercent(percentNum);				
				adminChartInfo.add(mypageAdminChartInfo);
			};
			
			System.out.println(adminChartInfo);
			
			model.addAttribute("emp", emp);
			model.addAttribute("dept", dept);
			model.addAttribute("chart", adminChartInfo);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("admin mypage controller 오류 : " + e.getMessage());
		}
		
		return	"mypageAdmin";
	}

}
