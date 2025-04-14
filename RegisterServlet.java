package com.stationery.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String role = request.getParameter("role");
        String password = request.getParameter("password");

        
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/5285_stationery", "root", "chaukul@15D")) {

                
                String checkUser = "SELECT id FROM users WHERE email = ?";
                try (PreparedStatement pst = conn.prepareStatement(checkUser)) {
                    pst.setString(1, email);
                    try (ResultSet rs = pst.executeQuery()) {
                        if (rs.next()) {
                            request.setAttribute("errorMessage", "User already exists! Please login.");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                            return;
                        }
                    }
                }

                String sql = "INSERT INTO users (email, name, phone_number, role, password, is_active) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement pst = conn.prepareStatement(sql)) {
                    pst.setString(1, email);
                    pst.setString(2, name);
                    pst.setString(3, phoneNumber);
                    pst.setString(4, role);
                    pst.setString(5, hashedPassword);
                    pst.setBoolean(6, true); 

                    int rowsAffected = pst.executeUpdate();
                    if (rowsAffected > 0) {
                      
                        HttpSession session = request.getSession();
                        session.setAttribute("userEmail", email);
                        session.setAttribute("userRole", role);

                        if ("Admin".equalsIgnoreCase(role)) {
                            response.sendRedirect("admin.jsp"); 
                        } else {
                            response.sendRedirect("home.jsp");
                        }
                    } else {
                        request.setAttribute("errorMessage", "Registration failed. Try again.");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred. Please try again later.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
