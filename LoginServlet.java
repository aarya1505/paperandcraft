package com.stationery.controller;

import com.stationery.model.User;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Login attempt for email: " + email);

        
        User user = User.getUserByEmail(email);

        if (user == null) {
            System.out.println("User not found in the database.");
            request.setAttribute("errorMessage", "Invalid login credentials.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        System.out.println("User found: " + user.getEmail() + " | Role: " + user.getRole());

        
        if (BCrypt.checkpw(password, user.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getId()); 
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userRole", user.getRole());

            if (user.getRole().equals("Admin")) {
                System.out.println("Admin login successful. Redirecting to admin.jsp.");
                response.sendRedirect("admin.jsp");
            } else {
                System.out.println("Customer login successful. Redirecting to home.jsp.");
                response.sendRedirect("home.jsp");
            }
        } else {
            System.out.println("Password does not match for email: " + email);
            request.setAttribute("errorMessage", "Invalid login credentials.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
