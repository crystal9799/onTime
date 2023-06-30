package com.kosa.scheduleManagement.global.dto;

import lombok.Data;

@Data
public class Project_Cal {
	private int id;
	private String start;
	private String end;
	private String project_info;
	private String title;
	private char is_deleted;
	private int deptno;
}
