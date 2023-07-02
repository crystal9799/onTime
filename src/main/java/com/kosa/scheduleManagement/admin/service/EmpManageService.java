package com.kosa.scheduleManagement.admin.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosa.scheduleManagement.global.dao.DeptManageEmpDao;
import com.kosa.scheduleManagement.global.dto.Emp;





@Service
public class EmpManageService {
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	public int totallistCountByDeptno(int deptno) throws SQLException, ClassNotFoundException {
		System.out.println("total메서드까지는 옴");
		DeptManageEmpDao empdao = sqlsession.getMapper(DeptManageEmpDao.class);
		System.out.println(empdao);
		int result = -1;
		try {
			result = empdao.totallistCountByDeptno(deptno);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("totallistCountService : " + e.getMessage());
		}
		return result;
	}

	public List<Emp> list(int deptno, int cpage, int pagesize) {
		DeptManageEmpDao manageEmpDao = sqlsession.getMapper(DeptManageEmpDao.class);
		List<Emp> emplist = null;
		System.out.println(cpage + " " + pagesize);
		int start = cpage * pagesize - (pagesize - 1); // 1*5 -(5-1) = 1
		int end = cpage * pagesize;
		try {
			emplist = manageEmpDao.getEmpListByDeptno(deptno, start, end);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("listService : " + e.getMessage());
		}
		return emplist;
	}

	public List<Emp> getList(int deptno) {
		DeptManageEmpDao empdao = sqlsession.getMapper(DeptManageEmpDao.class);
		List<Emp> emplist = null;
		try {
			emplist = empdao.getRestEmpListByDeptno(deptno);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("listService : " + e.getMessage());
		}
		return emplist;
	}
	
	public String getDheadNameByDheadNull(int deptno) {
		DeptManageEmpDao empdao = sqlsession.getMapper(DeptManageEmpDao.class);
		String ename = null;
		try {
			ename = empdao.getDheadNameByDheadNull(deptno);
		}catch (Exception e) {
			e.getStackTrace();
			System.out.println("listService : " + e.getMessage());
		}
		return ename;
	}
	public int insertEmp(int deptno, Emp emp) {
		DeptManageEmpDao empdao = sqlsession.getMapper(DeptManageEmpDao.class);
		int user_id = -1;
		try {
			int dhead_num = empdao.getDheadNumByDeptno(deptno);
			emp.setDeptno(deptno);
			emp.setDhead_num(dhead_num);
			user_id = empdao.insertEmp(emp);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("listService : " + e.getMessage());
		}
		return user_id;
	}

	public boolean deleteEmp(long user_id) {
		DeptManageEmpDao empdao = sqlsession.getMapper(DeptManageEmpDao.class);
		boolean result = true;
		try {
			empdao.updateEmpEnabled(user_id);
		} catch (Exception e) {
			e.getStackTrace();
			result = false;
			System.out.println("deleteEmpService : " + e.getMessage());
		}
		return result;
	}
	public boolean updateEmp(Emp enameJobInEmp, int user_id) {
		DeptManageEmpDao empdao = sqlsession.getMapper(DeptManageEmpDao.class);
	    Emp oldEmp = empdao.getEmpByUserId(user_id);
	    System.out.println(oldEmp);
	    enameJobInEmp.setDeptno(oldEmp.getDeptno());
	    enameJobInEmp.setDhead_num(oldEmp.getDhead_num());
	    enameJobInEmp.setEmp_pic(oldEmp.getEmp_pic());
	    enameJobInEmp.setEnabled(oldEmp.getEnabled());
	    enameJobInEmp.setPassword(oldEmp.getPassword());
	    enameJobInEmp.setUser_id(oldEmp.getUser_id());
		int rowsAffected = empdao.updateEmp(enameJobInEmp);
		System.out.println(enameJobInEmp);
	    return rowsAffected > 0;
	}

	public String responseToJson(Map<String, Object> response) throws IOException {
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set(HttpHeaders.ACCEPT_CHARSET, StandardCharsets.UTF_8.name());
        ObjectMapper objectMapper = new ObjectMapper();
        JsonFactory jsonFactory = objectMapper.getFactory();
        JsonGenerator jsonGenerator = jsonFactory.createGenerator(System.out, JsonEncoding.UTF8);
        jsonGenerator.setCodec(objectMapper);
        String jsonResponse = objectMapper.writeValueAsString(response);
		return jsonResponse;
	}

	public boolean updateEmp(int userId, String ename, String job) {
		DeptManageEmpDao empdao = sqlsession.getMapper(DeptManageEmpDao.class);
		int rowsAffected = empdao.updateEmpByREST(userId, ename, job);
		return rowsAffected > 0;
	}

}
