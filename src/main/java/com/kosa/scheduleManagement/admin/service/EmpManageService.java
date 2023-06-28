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

    public List<Emp> getList(int deptno) {
        EmpDao empdao = sqlsession.getMapper(EmpDao.class);
        List<Emp> emplist = null;
        try {
            emplist = empdao.getEmpListByDeptno(deptno);
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("listService : " + e.getMessage());
        }
        return emplist;
    }
}
