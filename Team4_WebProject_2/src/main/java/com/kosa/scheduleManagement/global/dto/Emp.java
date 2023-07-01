package com.kosa.scheduleManagement.global.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Emp {
	private int user_id;
	private String password;
	private char enabled;
	private String ename;
	private String emp_pic;
	private String job;
	private int deptno;
	private int dhead_num;
	private MultipartFile file;
}
