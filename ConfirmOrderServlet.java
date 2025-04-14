package com.stationery.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.stationery.util.DBConnection;


public class ConfirmOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conn = DBConnection.getConnection()) {
            
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            
            String orderSQL = "INSERT INTO orders (name, email, address, order_date, total) " +
                              "VALUES (?, ?, ?, NOW(), (SELECT COALESCE(SUM(price * quantity), 0) FROM order_items))";
            PreparedStatement orderStmt = conn.prepareStatement(orderSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            orderStmt.setString(1, name);
            orderStmt.setString(2, email);
            orderStmt.setString(3, address);
            orderStmt.executeUpdate();

            
            ResultSet rs = orderStmt.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            
            String updateOrderItems = "UPDATE order_items SET order_id = ? WHERE order_id IS NULL";
            PreparedStatement updateStmt = conn.prepareStatement(updateOrderItems);
            updateStmt.setInt(1, orderId);
            updateStmt.executeUpdate();

            
            response.sendRedirect("order_success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("order_confirmation.jsp?error=OrderFailed");
        }
    }
}
