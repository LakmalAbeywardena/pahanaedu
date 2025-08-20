package com.pahanaedu.pahanaedu.service;
import com.pahanaedu.pahanaedu.dao.UserDAO;
import com.pahanaedu.pahanaedu.model.User;

public class AuthService {
    private UserDAO userDAO;

    public AuthService() throws Exception {
        userDAO = new UserDAO();
    }

    public User authenticate(String username, String password, String role) throws Exception {
        User user = userDAO.getUserByUsername(username);

        if (user != null &&
                user.getPassword().equals(password) &&
                user.getRole().equalsIgnoreCase(role)) {
            return user;
        }
        return null;
    }

    // Keep backward compatibility
    public boolean authenticate(String username, String password) throws Exception {
        User user = userDAO.getUserByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return true;
        }
        return false;
    }

    public boolean isAdmin(String username) throws Exception {
        User user = userDAO.getUserByUsername(username);
        return user != null && "admin".equalsIgnoreCase(user.getRole());
    }

    public String getUserRole(String username) throws Exception {
        User user = userDAO.getUserByUsername(username);
        return user != null ? user.getRole() : null;
    }
}