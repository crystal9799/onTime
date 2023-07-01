package com.kosa.scheduleManagement.global.dao;

import com.kosa.scheduleManagement.global.dto.Todo;

import java.sql.SQLException;
import java.util.List;

public interface TodoDao {
    List<Todo> getTodoList() throws SQLException;
    void insertTodo(Todo todo) throws SQLException;
}
