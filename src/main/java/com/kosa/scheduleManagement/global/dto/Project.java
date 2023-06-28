package com.kosa.scheduleManagement.global.dto;

import lombok.Data;

@Data
public class Project {
	private int project_num;
	private String project_start;
	private String project_end;
	private String project_info;
	private String project_name;
	private char is_deleted;
	private int deptno;
}
