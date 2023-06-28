package com.kosa.scheduleManagement.global.dao;

import java.sql.SQLException;
import java.util.List;

import com.kosa.scheduleManagement.global.dto.Emp;

public interface DeptManageEmpDao {
	List<Emp> getEmpListByDeptno(int deptno, int start, int end);
    int totallistCountByDeptno(int deptno) throws ClassNotFoundException, SQLException;
    List<Emp> getRestEmpListByDeptno(int deptno);
}
