package com.test;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.EmpDao;
import com.test.Emp;

@Service
public class EmpService {
	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<Emp> getAllEmp() throws ClassNotFoundException, SQLException {
		System.out.println("service connection");
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		List<Emp> list = dao.getAllEmp();
		System.out.println("list" + list);
		return list;
	}

	public List<Emp> search(int empno) throws ClassNotFoundException, SQLException {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		List<Emp> list = dao.search(empno);
		System.out.println("search list" + list);
		return list;
	}

	public int insert(Emp emp) throws ClassNotFoundException, SQLException {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		int row = dao.insert(emp);
		if (row > 0)
			System.out.println("insert success");
		return row;
	}

	public void delete(int empno) throws ClassNotFoundException, SQLException {
		System.out.println("delete service connection");
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		dao.delete(empno);
	}

	public void update(Emp emp) throws ClassNotFoundException, SQLException {
		System.out.println("update service");
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		dao.update(emp);
	}

}
