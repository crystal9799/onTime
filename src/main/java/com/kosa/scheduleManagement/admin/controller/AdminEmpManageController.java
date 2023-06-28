package com.kosa.scheduleManagement.admin.controller;

import com.kosa.scheduleManagement.admin.service.EmpManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("empManage.do")
@Controller
public class AdminEmpManageController {
    private EmpManageService empManageService;

    @Autowired

    public void setEmpManageService(EmpManageService empManageService) {
        this.empManageService = empManageService;
    }
}
