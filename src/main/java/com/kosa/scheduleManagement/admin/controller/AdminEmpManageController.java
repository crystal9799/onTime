package com.kosa.scheduleManagement.admin.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

	// 遺��꽌�궗�썝 蹂댁뿬二쇨린
	@GetMapping
	public String emplist(int deptno, String ps, String cp, Model model) throws SQLException, ClassNotFoundException {
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

////////////////////////////////////////rest 諛⑹떇 肄붾뱶 	

// rest 遺��꽌蹂� �궗�썝 議고쉶
	@GetMapping("/rest")
	public ResponseEntity<List<Emp>> getEmpByDeptno(@RequestParam("deptno") int deptno) {
		List<Emp> list = new ArrayList();

		try {
			list = empManageService.getList(deptno);
			System.out.println("empListByDeptno rest�샇異�");
			return new ResponseEntity<List<Emp>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Emp>>(list, HttpStatus.BAD_REQUEST);
		}
	}

// �궗�썝�깮�꽦�럹�씠吏� 蹂댁뿬二쇨린. 遺��꽌�옣�쓽 deptno�쓣 �뙆�씪誘명꽣濡� 諛쏆븘�� �꽭�뀡�뿉 ���옣�븯怨� �씠瑜� post�슂泥� �떆�뿉 emp�뿉 媛� �꽔湲�.
// 鍮꾨룞湲곕줈 泥섎━�븷 寃�.
	@GetMapping("/create")
	public ResponseEntity<Integer> showCreateForm(@RequestParam("deptno") int deptno) {
		return ResponseEntity.ok(deptno);
	}

// rest 遺��꽌蹂� �궗�썝 �깮�꽦
	@PostMapping("/create")
	public ResponseEntity<String> createEmp(@RequestBody Emp emp, HttpSession session) {
		int deptno = (int) session.getAttribute("deptno");
		String message = "";
		emp.setDeptno(deptno);
		int user_id = empManageService.insertEmp(deptno, emp);
		session.removeAttribute("deptno");
		if (user_id > -1) {
			message = String.valueOf(user_id);
			System.out.println("�궗�썝 �깮�꽦 �꽦怨�");
		} else {
			message = "�궗�썝 �깮�꽦 �떎�뙣";
			System.out.println("�궗�썝 �깮�꽦 �떎�뙣");
		}
		return ResponseEntity.ok(message);
	}

//�궗�썝 �궘�젣
	@GetMapping("/delete")
	public ResponseEntity<String> deleteEmp(@RequestParam("user_id") long user_id) {
		int result = empManageService.deleteEmp(user_id);
		String message = "";
		if(user_id > -1) {
			message = user_id + "踰� �궗�썝�씠 �궘�젣�릺�뿀�뒿�땲�떎.";
		}else {
			message = "�궘�젣 �떎�뙣";
		}
		
		return ResponseEntity.ok(message);
	}
}
