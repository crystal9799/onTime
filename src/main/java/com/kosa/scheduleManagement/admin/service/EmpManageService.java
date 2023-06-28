package com.kosa.scheduleManagement.admin.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.scheduleManagement.global.dao.DeptManageEmpDao;
import com.kosa.scheduleManagement.global.dao.EmpDao;
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
        System.out.println(cpage+ " " + pagesize);
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
}
