<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body {
            background-color: #d19193;
            font-family: Arial, sans-serif;
        }
        .cart-container {
            width: 60%;
            margin: 50px auto;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: black;
            color: white;
        }
        .checkout-btn {
            background-color: black;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="cart-container">
        <h2>Your Cart</h2>
        <table>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            <% 
                double grandTotal = 0.0;
                java.sql.Connection conn = null;
                java.sql.PreparedStatement stmt = null;
                java.sql.ResultSet rs = null;
                String sessionId = session.getId();
                try {
                    // Correct MySQL Driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Debugging: Print session ID
                    out.println("<p>Session ID: " + sessionId + "</p>");

                    // Database Connection
                    conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/5285_stationery?useSSL=false&serverTimezone=UTC", "root", "chaukul@15D");

                    // SQL Query
                    String sql = "SELECT p.name, p.price, c.quantity FROM cart c JOIN products p ON c.product_id = p.product_id WHERE c.session_id = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, sessionId);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        String name = rs.getString("name");
                        double price = rs.getDouble("price");
                        int quantity = rs.getInt("quantity");
                        double total = price * quantity;
                        grandTotal += total;
            %>
            <tr>
                <td><%= name %></td>
                <td>&#8377;<%= price %></td>
                <td><%= quantity %></td>
                <td>&#8377;<%= total %></td>
            </tr>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            %>
        </table>
        <h3>Grand Total: &#8377;<%= grandTotal %></h3>
        <a href="checkout.jsp" class="checkout-btn">Proceed to Checkout</a>
    </div>
</body>
</html>
