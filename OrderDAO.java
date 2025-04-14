
package com.stationery.DAO;
import com.stationery.model.Order;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    public static List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/5285_stationery", "root", "chaukul@15D");
            PreparedStatement ps = con.prepareStatement("SELECT order_id, name, email, address, total, order_date FROM orders");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                orders.add(new Order(
                    rs.getInt("order_id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("address"),
                    rs.getDouble("total"),
                    rs.getString("order_date")
                ));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
}
