package com.kosa.scheduleManagement.global.dto;

import java.util.List;

import lombok.Data;

@Data
public class Project_Sub {
	private Project project;
	private List<Emp> emplist;
}
