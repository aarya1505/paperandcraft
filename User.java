package com.stationery.model;

import com.stationery.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

public class User {
    private int id;
    private String email;
    private String password;
    private String role;
    private String name;
    private String phoneNumber;
    private boolean isActive;
    private Timestamp createdAt;

    // Default constructor
    public User() {}

    // Parameterized constructor
    public User(int id, String email, String name, String phoneNumber, String role, String password, boolean isActive, Timestamp createdAt) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.role = role;
        this.password = password;
        this.isActive = isActive;
        this.createdAt = createdAt;
    }

    public User(int aInt, String string, String string0, String string1, String string2, boolean aBoolean) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    // Get user by email
    public static User getUserByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new User(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("name"),
                        rs.getString("phone_number"),
                        rs.getString("role"),
                        rs.getString("password"),
                        rs.getBoolean("is_active"),
                        rs.getTimestamp("created_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Create user
    public static boolean createUser(String email, String password, String role, String name, String phoneNumber, boolean isActive) {
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        String query = "INSERT INTO users (email, password, role, name, phone_number, is_active) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            ps.setString(2, hashedPassword);
            ps.setString(3, role);
            ps.setString(4, name);
            ps.setString(5, phoneNumber);
            ps.setBoolean(6, isActive);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Database error during user creation: " + e.getMessage());
        }
    }

    // Update user (ensures password is stored correctly)
    public static boolean updateUser(int id, String email, String password, String role, String name, String phoneNumber, boolean isActive) {
        String query = "UPDATE users SET email = ?, password = ?, role = ?, name = ?, phone_number = ?, is_active = ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);

            // Ensure the password is hashed before updating
            if (!password.startsWith("$2a$")) { 
                System.out.println("Hashing new password for user ID: " + id);
                password = BCrypt.hashpw(password, BCrypt.gensalt());
            } else {
                System.out.println("Password already hashed for user ID: " + id);
            }

            ps.setString(2, password);
            ps.setString(3, role);
            ps.setString(4, name);
            ps.setString(5, phoneNumber);
            ps.setBoolean(6, isActive);
            ps.setInt(7, id);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete user
    public static boolean deleteUser(int id) {
        String query = "DELETE FROM users WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all users
    public static List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String query = "SELECT * FROM users";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                userList.add(new User(
                    rs.getInt("id"),
                    rs.getString("email"),
                    rs.getString("name"),
                    rs.getString("phone_number"),
                    rs.getString("role"),
                    rs.getString("password"),
                    rs.getBoolean("is_active"),
                    rs.getTimestamp("created_at")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}
