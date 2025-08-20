package com.pahanaedu.pahanaedu.dao;

import com.pahanaedu.pahanaedu.model.User;
import java.sql.*;

public class UserDAO {
    private Connection conn;

    public UserDAO() throws SQLException, ClassNotFoundException {
        conn = DBConnection.getInstance().getConnection();
    }

    public User getUserByUsername(String username) throws SQLException {
        String sql = "SELECT * FROM users WHERE username=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new User(
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("role")
            );
        }
        return null;
    }

    public boolean addUser(User user) throws SQLException {
        String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user.getUsername());
        ps.setString(2, user.getPassword());
        ps.setString(3, user.getRole());
        return ps.executeUpdate() > 0;
    }
}
