package com.stationery.controller;

import com.stationery.services.AuthService;
import com.stationery.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthServlet extends HttpServlet {
    private AuthService authService = new AuthService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            User user = authService.login(email, password);
            if (user != null) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("/products");
            } else {
                response.sendRedirect("/auth/login.jsp?error=Invalid credentials");
            }
        } else if ("register".equals(action)) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            boolean success = authService.register(email, password, role);
            if (success) {
                response.sendRedirect("/auth/login.jsp");
            } else {
                response.sendRedirect("/auth/register.jsp?error=Registration failed");
            }
        }
    }
}
