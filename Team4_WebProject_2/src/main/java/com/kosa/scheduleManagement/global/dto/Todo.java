package com.kosa.scheduleManagement.global.dto;

import lombok.Data;

@Data
public class Todo {
    private Long id;
    private String title;
    private String startDate;
    private String endDate;
}
