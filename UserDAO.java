package com.stationery.DAO;

import com.stationery.model.User;
import com.stationery.util.DBConnection; 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT id, email, name, phone_number, role, password, is_active, created_at FROM users";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                users.add(new User(
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
        return users;
    }
}
