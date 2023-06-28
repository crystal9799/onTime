package com.kosa.scheduleManagement.global.dto;

import lombok.Data;

@Data
public class Emp {
	private int user_id;
	private String password;
	private char enabled;
	private String ename;
	private String emp_pic;
	private String job;
	private int deptno;
	private int dhead_num;
}
