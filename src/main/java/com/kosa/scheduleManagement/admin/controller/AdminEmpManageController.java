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

	// 부서사원 보여주기
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

////////////////////////////////////////rest 방식 코드 	

// rest 부서별 사원 조회
	@GetMapping("/rest")
	public ResponseEntity<List<Emp>> getEmpByDeptno(@RequestParam("deptno") int deptno) {
		List<Emp> list = new ArrayList();

		try {
			list = empManageService.getList(deptno);
			System.out.println("empListByDeptno rest호출");
			return new ResponseEntity<List<Emp>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Emp>>(list, HttpStatus.BAD_REQUEST);
		}
	}

// 사원생성페이지 보여주기. 부서장의 deptno을 파라미터로 받아와 세션에 저장하고 이를 post요청 시에 emp에 값 넣기.
// 비동기로 처리할 것.
	@GetMapping("/create")
	public ResponseEntity<Integer> showCreateForm(@RequestParam("deptno") int deptno) {
		return ResponseEntity.ok(deptno);
	}

// rest 부서별 사원 생성
	@PostMapping("/create")
	public ResponseEntity<String> createEmp(@RequestBody Emp emp, HttpSession session) {
		int deptno = (Integer)session.getAttribute("deptno");
		String message = "";
		emp.setDeptno(deptno);
		int user_id = empManageService.insertEmp(deptno, emp);
		session.removeAttribute("deptno");
		if (user_id > -1) {
			message = String.valueOf(user_id);
			System.out.println("사원 생성 성공");
		} else {
			message = "사원 생성 실패";
			System.out.println("사원 생성 실패");
		}
		return ResponseEntity.ok(message);
	}

//사원 삭제
	@GetMapping("/delete")
	public ResponseEntity<String> deleteEmp(@RequestParam("user_id") long user_id) {
		int result = empManageService.deleteEmp(user_id);
		String message = "";
		if(user_id > -1) {
			message = user_id + "번 사원이 삭제되었습니다.";
		}else {
			message = "삭제 실패";
		}
		
		return ResponseEntity.ok(message);
	}
}
