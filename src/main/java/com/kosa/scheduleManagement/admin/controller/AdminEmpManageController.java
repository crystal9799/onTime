package com.kosa.scheduleManagement.admin.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

@RequestMapping(value = "/admin", produces = "application/text; charset=UTF-8")
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
			ps = "1";
		}

		int pagesize = Integer.parseInt(ps);
		System.out.println(pagesize);
		int cpage = Integer.parseInt(cp);
		System.out.println(cpage);
		int totalcount = empManageService.totallistCountByDeptno(deptno);
		System.out.println(totalcount);
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

		System.out.println("elist : " + elist);
		System.out.println("pagesize : " + pagesize);
		System.out.println("pagecount : " + pagecount);
		System.out.println("page : " + cpage);

		return "/admin/emp/admin_emp";
	}

////////////////////////////////////////rest 방식 코드 	

	// rest 부서별 사원 조회 (테스트)
	@GetMapping("/empManage/show.do")
	public ResponseEntity<String> getEmpByDeptno(@RequestParam("deptno") int deptno,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpSession session) {
		List<Emp> list = new ArrayList<>();
		try {
			list = empManageService.getList(deptno);
			String dheadName = empManageService.getDheadNameByDheadNull(deptno);
			System.out.println(dheadName);
			System.out.println("empListByDeptno rest호출");

			// 새로운 형식의 JSON 데이터 생성
			Map<String, Object> response = new HashMap<>();
			response.put("result", true);
			Map<String, Object> data = new HashMap<>();
			List<Object> contents = new ArrayList<>();

			// 각각의 Emp 객체를 가공하여 contents에 추가
			for (Emp emp : list) {
				Map<String, Object> empData = new HashMap<>();
				empData.put("user_id", emp.getUser_id());
				empData.put("ename", emp.getEname());
				empData.put("emp_pic", emp.getEmp_pic());
				empData.put("job", emp.getJob());
				empData.put("deptno", emp.getDeptno());
				empData.put("dhead_name", !emp.getEname().equals(dheadName) ? dheadName : "");
				empData.put("file", emp.getFile());
				contents.add(empData);
			}

			data.put("contents", contents);
			Map<String, Object> pageData = new HashMap<>();
			pageData.put("page", page);
			data.put("pagination", pageData);

			response.put("data", data);

			String jsonResponse = empManageService.responseToJson(response);

			System.out.println(jsonResponse);
			return ResponseEntity.ok(jsonResponse);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
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
	public ResponseEntity<String> createEmp(@RequestParam("deptno") int deptno,
			@RequestBody Map<String, Object> requestBody, HttpSession session) {
		String message = "";
		String ename = (String) requestBody.get("ename");
		String password = (String) requestBody.get("password");
		String job = (String) requestBody.get("job");
		Emp emp = new Emp();
		Map<String, Object> response = new HashMap<>();

		emp.setEname(ename);
		emp.setPassword(password);
		emp.setJob(job);
		emp.setDeptno(deptno);
		System.out.println(emp);
		int user_id = empManageService.insertEmp(deptno, emp);
		session.removeAttribute("deptno");
		if (user_id > -1) {
			message = String.valueOf(user_id);
			response.put("result", true);
			response.put("message", "사원 생성 성공");
			response.put("data", "insert");
			System.out.println("사원 생성 성공");
		} else {
			message = "사원 생성 실패";
			System.out.println("사원 생성 실패");
		}
		String jsonResponse = "";
		try {
			jsonResponse = empManageService.responseToJson(response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ResponseEntity.ok(jsonResponse);
	}

	// 사원 삭제
	@PostMapping("/empManage/deleteOk.do")
	public ResponseEntity<String> deleteEmp(@RequestBody Map<String, Object> requestBody) {
	    System.out.println(requestBody);
	    List<Map<String, Object>> checkedRows = (List<Map<String, Object>>) requestBody.get("deletedRows");
	    
	    // Get user_id values from checkedRows
	    List<Integer> userIds = checkedRows.stream()
	            .map(row -> (int) row.get("user_id"))
	            .collect(Collectors.toList());
	    
	    // 삭제가 완료되면 true를 반환, update enabled 0
	    Map<String, Object> response = new HashMap<>();
	    boolean isDeleted = false;
	    
	    for (int userId : userIds) {
	        // 삭제 수행 로직
	        isDeleted = empManageService.deleteEmp(userId);
	        
	        if (!isDeleted) {
	            break;
	        }
	    }
	    
	    if (!isDeleted) {
	        response.put("result", false);
	    } else {
	        response.put("result", true);
	        response.put("data", "delete");
	    }
	    
	    String jsonResponse = "";
	    
	    try {
	        jsonResponse = empManageService.responseToJson(response);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    return ResponseEntity.ok(jsonResponse);
	}


	// 사원 수정
	@PutMapping("/empManage/updateOk.do")
	public ResponseEntity<String> updateEmp(@RequestBody Map<String, Object> requestBody) {
		List<Map<String, Object>> updatedRows = (List<Map<String, Object>>) requestBody.get("updatedRows");
		boolean isUpdated = false;
		Map<String, Object> response = new HashMap<>();
		for (Map<String, Object> row : updatedRows) {
			int userId = (int) row.get("user_id");
			String ename = (String) row.get("ename");
			String job = (String) row.get("job");

			// 업데이트 수행 로직
			isUpdated = empManageService.updateEmp(userId, ename, job);
			if (isUpdated == false)
				break;
		}
		if (isUpdated == false) {
			response.put("result", false);
		} else {
			response.put("result", true);
			response.put("data", "update");
		}

		String jsonResponse = "";
		try {
			jsonResponse = empManageService.responseToJson(response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ResponseEntity.ok(jsonResponse);
	}

}