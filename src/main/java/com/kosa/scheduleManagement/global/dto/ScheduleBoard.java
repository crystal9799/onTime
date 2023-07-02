package com.kosa.scheduleManagement.global.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScheduleBoard {
	private int sched_num;
	private String sched_info;
	private int sched_prog;
	private int sched_seq;
	private int project_num; 

	public String toString() {
		return "\nScheduleBoard(sched_num=" + sched_num + ", sched_info=" + sched_info + ", sched_prog=" + sched_prog
				+ ", sched_seq=" + sched_seq + ", project_num=" + project_num + ")";
	}

}