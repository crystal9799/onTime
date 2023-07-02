package com.kosa.scheduleManagement.global.dto;

import lombok.Data;

@Data
public class Mypage_AdminChartInfo {
	private String projectName;
	private int totalNum;
	private int doneNum;
	private double projectSchedulePercent;
}
