package com.test;

import java.sql.SQLException;
import java.util.List;

import com.test.Emp;

public interface EmpDao {
	List<Emp> getAllEmp() throws ClassNotFoundException, SQLException;
	List<Emp> search(int empno) throws ClassNotFoundException, SQLException;
	int insert(Emp emp) throws ClassNotFoundException, SQLException;
	void delete(int empno) throws ClassNotFoundException, SQLException;
    void update(Emp emp) throws ClassNotFoundException, SQLException;
}