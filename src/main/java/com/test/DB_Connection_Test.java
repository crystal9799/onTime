package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB_Connection_Test {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        String url = "jdbc:oracle:thin:@192.168.0.38:49161:XE";
        String userName = "kosa";
        String password = "1004";

        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection(url, userName, password);
    }
}
