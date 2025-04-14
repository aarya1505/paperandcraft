package com.stationery.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddToCartServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/5285_stationery";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "chaukul@15D";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_id = request.getParameter("product_id"); 
        String quantityStr = request.getParameter("quantity");

        if (product_id == null || product_id.isEmpty() || quantityStr == null || quantityStr.isEmpty()) {
            response.sendRedirect("home.jsp");
            return;
        }

        try {
            int product_idInt = Integer.parseInt(product_id);
            int quantityInt = Integer.parseInt(quantityStr);

            if (quantityInt <= 0) {
                response.sendRedirect("home.jsp");
                return;
            }

            HttpSession session = request.getSession();
            String sessionId = session.getId();

            Class.forName("com.mysql.cj.jdbc.Driver");

            String sql = "INSERT INTO cart (session_id, product_id, quantity) VALUES (?, ?, ?) " +
                         "ON DUPLICATE KEY UPDATE quantity = quantity + ?";

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, sessionId);
                stmt.setInt(2, product_idInt);
                stmt.setInt(3, quantityInt);
                stmt.setInt(4, quantityInt);
                stmt.executeUpdate();
            }

            response.sendRedirect("cart.jsp");

        } catch (NumberFormatException | SQLException | ClassNotFoundException e) {
            response.sendRedirect("home.jsp"); 
        }
    }
}
