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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.scheduleManagement.admin.service.EmpManageService;
import com.kosa.scheduleManagement.global.dto.Emp;

@RequestMapping("/admin")
@Controller
public class AdminEmpManageController {
	private EmpManageService empManageService;

	@Autowired
	public void setEmpManageService(EmpManageService empManageService) {
		this.empManageService = empManageService;
	}

	// 부서사원 보여주기
	@GetMapping("empManage.do")
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

		model.addAttribute("countByDept", totalcount);
		model.addAttribute("deptno", deptno);
		model.addAttribute("list", elist);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("cpage", cpage);
		return "/admin/emp/admin_emp";
	}

////////////////////////////////////////rest 방식 코드 	

// rest 부서별 사원 조회 (테스트)
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

// 사원생성페이지 보여주기. 부서장의 deptno을 파라미터로 받아와 세션에 저장하고 이를 post요청 시에 emp에 세션의 deptno 값 넣기.
// 시큐리티 적용 후에는 사용자의 user_id를 가져오는게 나을까? -> user_id로 emp 조회하기 vs 세션에 deptno를 가지고 사용하기.
// 비동기로 처리할 것.
	@GetMapping("/empManage/create.do")
	public ResponseEntity<Integer> showCreateForm(@RequestParam("deptno") int deptno, HttpSession session) {
		session.setAttribute("deptno", deptno);
		return ResponseEntity.ok(deptno);
	}

// rest 부서별 사원 생성
	@PostMapping("/empManage/createOk.do")
	public ResponseEntity<String> createEmp(@RequestParam("deptno") int deptno, @RequestBody Emp emp, HttpSession session) {
//		int deptno = (int) session.getAttribute("deptno");
		String message = "";
		emp.setDeptno(deptno);
		System.out.println(emp);
		int user_id = empManageService.insertEmp(deptno, emp);
		session.removeAttribute("deptno");
		if (user_id > -1) {
			message = String.valueOf(user_id);
			System.out.println("사원 생성 성공");
		} else {
			message = "사원 생성 실패";
			System.out.println("사원 생성 실패");
		}
		return new ResponseEntity<String>(message,HttpStatus.OK);
	}

//사원 삭제
	@GetMapping("/empManage/deleteOk.do")
	public ResponseEntity<String> deleteEmp(@RequestParam("user_id") long user_id) {
		//삭제가 완료되면 true를 반환, update enabled 0
		boolean result = empManageService.deleteEmp(user_id); 
		String message = "";
		if(result != true) {
			message = "삭제 실패";
			return new ResponseEntity<String>(message,HttpStatus.OK);
		}else {
			message = user_id + "번 사원이 삭제되었습니다.";
			return new ResponseEntity<String>(message,HttpStatus.BAD_REQUEST);
		}
	}
	
	//사원 수정
	@PutMapping("/empManage/updateOk.do")
	public ResponseEntity<String> updateEmp(@RequestParam("user_id") int user_id, @RequestBody Emp emp) {
	    boolean isUpdated = empManageService.updateEmp(emp, user_id);
	    if (isUpdated) {
	        return new ResponseEntity<String>("사원 정보가 성공적으로 수정되었습니다.",HttpStatus.OK);
	    } else {
	        return new ResponseEntity<String>("사원 정보 수정에 실패했습니다.",HttpStatus.OK);
	    }
	}

}