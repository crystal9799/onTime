package com.kosa.scheduleManagement.admin.service;

import com.kosa.scheduleManagement.global.dao.EmpDao;
import com.kosa.scheduleManagement.global.dto.Emp;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EmpManageService {
    private SqlSession sqlsession;

    @Autowired
    public void setSqlsession(SqlSession sqlsession) {
        this.sqlsession = sqlsession;
    }

    public List<Emp> list(int deptno, int cpage, int pagesize) {
        EmpDao empdao = sqlsession.getMapper(EmpDao.class);
        List<Emp> emplist = null;
        System.out.println(cpage+ " " + pagesize);
        int start = cpage * pagesize - (pagesize - 1); // 1*5 -(5-1) = 1
        int end = cpage * pagesize;
        try {
            emplist = empdao.getEmpListByDeptno(deptno, start, end);
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("listService : " + e.getMessage());
        }
        return emplist;
    }
}
