package com.kosa.scheduleManagement.admin.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.scheduleManagement.admin.service.EmpManageService;
import com.kosa.scheduleManagement.global.dto.Emp;

@RequestMapping("/empManage")
@Controller
public class AdminEmpManageController {
	private EmpManageService empManageService;

    @Autowired
    public void setEmpManageService(EmpManageService empManageService) {
        this.empManageService = empManageService;
    }

    //부서사원 보여주기
    @GetMapping
    public String emplist(int deptno,String ps, String cp, Model model) throws SQLException, ClassNotFoundException {
        System.out.println("ps : " + ps + "cp : " + cp);

        if (cp == null || cp.trim().equals("")) {
            cp = "1";
        }
        if (ps == null || ps.trim().equals("")) {
            ps = "5";
        }

        int pagesize = Integer.parseInt(ps);
        int cpage = Integer.parseInt(cp);
        int totalcount = empManageService.totallistCountByDeptno(deptno);
        int pagecount = 0;

        if (totalcount % pagesize == 0) {
            pagecount = totalcount / pagesize;
        } else {
            pagecount = (totalcount / pagesize) + 1;
        }

        List<Emp> elist = empManageService.list(deptno, cpage, pagesize);

        model.addAttribute("deptno", deptno);
        model.addAttribute("list", elist);
        model.addAttribute("pagesize", pagesize);
        model.addAttribute("pagecount", pagecount);
        model.addAttribute("cpage", cpage);
        return "/admin/empManage/empManage";
    }
    @GetMapping("/rest")
    public ResponseEntity<List<Emp>> getEmpByDeptno(@RequestParam("deptno") int deptno){
    	List<Emp> list = new ArrayList();
    	
    	try {
    		list = empManageService.getList(deptno);
    		System.out.println("empListByDeptno rest호출");
    		return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);
		}
    }
}
