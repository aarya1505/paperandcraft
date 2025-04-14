package com.stationery.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/5285_stationery";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "chaukul@15D";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String contactMethod = request.getParameter("contact-method");
        String message = request.getParameter("message");

        // Database connection and insertion
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Insert query
            String sql = "INSERT INTO contact_us (name, email, phone, contact_method, message) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setString(3, phone);
                statement.setString(4, contactMethod);
                statement.setString(5, message);

                // Execute query
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    response.getWriter().write("Thank you for contacting us! We will get back to you soon.");
                } else {
                    response.getWriter().write("There was an error. Please try again.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}