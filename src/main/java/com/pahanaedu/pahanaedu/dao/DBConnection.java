package com.pahanaedu.pahanaedu.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static DBConnection instance;
    private Connection connection;

    private String url = "jdbc:mysql://localhost:3306/pahanaedu_db?useSSL=false";
    private String username = "ubuntu";  // your MySQL username
    private String password = "peLa071it"; // your MySQL password

    private DBConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        this.connection = DriverManager.getConnection(url, username, password);
    }

    public Connection getConnection() {
        return connection;
    }

    public static DBConnection getInstance() throws SQLException, ClassNotFoundException {
        if (instance == null || instance.getConnection().isClosed()) {
            instance = new DBConnection();
        }
        return instance;
    }
}
