package com.kosa.scheduleManagement.global.utils;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.scheduleManagement.global.dao.DeptManageEmpDao;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project;
import com.kosa.scheduleManagement.global.dto.Project_Sub;

@Service
public class MailSendService {
	private SqlSession sqlsession;
	private MailSender mailsender;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Autowired
	public void setMailSender(MailSender mailSender) {
		this.mailsender = mailSender;
	}

	public boolean sendMail(Project_Sub genproject) {
		boolean isSuccess = true;
		// genproject를 나누기
		Project project = new Project();
		project.setProject_num(genproject.getProject().getProject_num());
		project.setProject_name(genproject.getProject().getProject_name());
		project.setProject_start(genproject.getProject().getProject_start());
		project.setProject_end(genproject.getProject().getProject_end());
		project.setProject_info(genproject.getProject().getProject_info());
		project.setDEPTNO(genproject.getProject().getDEPTNO());

		System.out.print(project.toString());
		List<Emp> empList = List.copyOf((List<Emp>) genproject.getEmplist());
		List<String> getEmailsByResistedEmp = new ArrayList<>();
		// 부서장 정보
		DeptManageEmpDao empdao = sqlsession.getMapper(DeptManageEmpDao.class);
		int dheadNum = empdao.getDheadNumByDeptno(project.getDEPTNO());
		Emp dheadInfo = empdao.getEmpByUserId(dheadNum);

		// 배정사원 이메일
		for (Emp emp : empList) {
			//메일 찾기
			Emp user = empdao.getEmpByUserId(emp.getUser_id());
			String getEmail = user.getEmail();
			//찾은 메일 
			getEmailsByResistedEmp.add(getEmail);
		}

		// 메일전송 로직
		try {
			mailsender.sendEmail(project, dheadInfo, getEmailsByResistedEmp);   
		} catch (Exception e) {
			isSuccess = false;
			System.out.println("메일전송 실패");
			System.out.println(e.getMessage());
		}

		return isSuccess;
	}
}
