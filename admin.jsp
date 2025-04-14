<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession, java.sql.*, java.util.*" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userRole") == null || 
        !"Admin".equals(sessionObj.getAttribute("userRole"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/5285_stationery", "root", "chaukul@15D");

        // Fetch orders
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM orders");
        List<String[]> orders = new ArrayList<>();
        while (rs.next()) {
            orders.add(new String[]{
                rs.getString("order_id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("address"),
                rs.getString("total"),
                rs.getString("order_date")
            });
        }

       rs = stmt.executeQuery("SELECT * FROM users");
            List<String[]> users = new ArrayList<>();

            while (rs.next()) {
                users.add(new String[]{
                    rs.getString("id"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("role"),
                    rs.getString("name"),
                    rs.getString("phone_number"),
                    rs.getBoolean("is_active") ? "Active" : "Inactive",
                    rs.getTimestamp("created_at").toString()
                });
            }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; display: flex; background-color: #f4f4f4; }
        .sidebar { width: 250px; background-color: #333; color: white; height: 100vh; padding: 20px; position: fixed; }
        .sidebar h2 { color: #d2919c; margin-bottom: 20px; font-size: 22px; }
        .sidebar ul { list-style: none; padding: 0; }
        .sidebar ul li { margin: 15px 0; }
        .sidebar ul li a { text-decoration: none; color: white; font-size: 18px; display: block; padding: 10px; border-radius: 5px; transition: 0.3s; }
        .sidebar ul li a:hover { background-color: #555; }
        .main-content { margin-left: 270px; padding: 20px; width: calc(100% - 270px); }
        h1, h2 { color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: white; border-radius: 5px; overflow: hidden; }
        table, th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        table th { background-color: #333; color: white; }
        table td { text-align: center; }
    </style>
</head>
<body>
   
    <nav class="sidebar">
        <h2>Paper & Craft - Admin</h2>
        <ul>
            <li><a href="#dashboard">Dashboard</a></li>
            <li><a href="#orders">Manage Orders</a></li>
            <li><a href="#users">Manage Customers</a></li>
            <li><a href="LogoutServlet">Logout</a></li>
        </ul>
    </nav>

    
    <div class="main-content">
        <section id="dashboard">
            <h1>Admin Dashboard</h1>
            <p>Welcome, <%= (sessionObj.getAttribute("userEmail") != null) ? sessionObj.getAttribute("userEmail") : "Admin" %>!</p>
        </section>

        <!-- Orders Section -->
        <section id="orders">
            <h2>Manage Orders</h2>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Total Price</th>
                        <th>Order Date</th>
                    </tr>
                </thead>
                <tbody id="order-list">
                    <% if (orders.isEmpty()) { %>
                        <tr><td colspan="6">No orders available.</td></tr>
                    <% } else { 
                        for (String[] order : orders) { %>
                            <tr>
                                <td><%= order[0] %></td>
                                <td><%= order[1] %></td>
                                <td><%= order[2] %></td>
                                <td><%= order[3] %></td>
                                <td>₹<%= order[4] %></td>
                                <td><%= order[5] %></td>
                            </tr>
                    <% } } %>
                </tbody>
            </table>
        </section>

        
        <section id="users">
            <h2>Manage Customers</h2>
            <table>
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Role</th>
                        <th>Name</th>
                        <th>Phone Number</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody id="user-list">
                    <% if (users.isEmpty()) { %>
                        <tr><td colspan="6">No users available.</td></tr>
                    <% } else { 
                        for (String[] user : users) { %>
                            <tr>
                                <td><%= user[0] %></td>
                                <td><%= user[1] %></td>
                                <td><%= user[2] %></td>
                                <td><%= user[3] %></td>
                                <td><%= user[4] %></td>
                                <td><%= user[5] %></td>
                            </tr>
                    <% } } %>
                </tbody>
            </table>
        </section>
    </div>

</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
