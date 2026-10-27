package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    private static final String URL = "jdbc:mysql://localhost:3306/story-app";
    private static final String USER = "root";
    private static final String PASSWORD = "Applet";

    // Returns a new Connection each time
    public static Connection getConn() throws SQLException {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
            throw new SQLException(e); // propagate exception
        }

        // Create and return a new connection
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
