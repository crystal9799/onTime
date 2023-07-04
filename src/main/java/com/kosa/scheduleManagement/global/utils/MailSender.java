package com.kosa.scheduleManagement.global.utils;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project;

@Service
public class MailSender {	
	
	ApplicationContext ctx = new ClassPathXmlApplicationContext("NewFile.xml");
	 // 빈 가져오기
    JavaMailSenderImpl mailSender = (JavaMailSenderImpl) ctx.getBean("mailSender");
	
	public void sendEmail(Project project, Emp dheadInfo, List<String> userEmails) throws Exception {

		// 메일 내용
		// 프로젝트 제목, 내용, 시작일, 종료
		String subject = "프로젝트가 생성되었습니다.\n"+"프로젝트명"+project.getProject_name();
		String content = 
				"프로젝트 내용"+ project.getProject_info()+"\n"+
			    "프로젝트 시작일" + project.getProject_start()+"\n"+
				"프로젝트 종료일" + project.getProject_end()+"\n"+
			    "";

		// 보내는 사람
		// 프로젝트 생성자(부서번호 + 부서장이름)
		String from = dheadInfo.getEmail();
		System.out.println(from);

		// 받는 사람
		// 프로젝트 배정받은 사람
		int users = userEmails.size();

		String[] to = new String[users];
		for(int i = 0; i<users; i++) {
			to[i] = userEmails.get(i);
		}

		try {
			// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

			// 메일 내용을 채워줌
			mailHelper.setFrom(from);	// 보내는 사람 셋팅
			mailHelper.setTo(to);		// 받는 사람 셋팅
			mailHelper.setSubject(subject);	// 제목 셋팅
			mailHelper.setText(content);	// 내용 셋팅

			// 메일 전송
			mailSender.send(mail);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
