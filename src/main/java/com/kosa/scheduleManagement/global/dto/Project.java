package com.kosa.scheduleManagement.global.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Project {
	@JsonProperty("id")
	private int project_num;
	
    @JsonProperty("start")
	private String project_start;
    
    @JsonProperty("end")
	private String project_end;
    
	private String project_info;
	
	@JsonProperty("title")
	private String project_name;
	private char is_deleted;
	private int deptno;
	
	// Getter and Setter for 'deptno'
    public int getDEPTNO() {
        return deptno;
    }
    
    public void setDEPTNO(int deptno) {
        this.deptno = deptno;
    }
}
