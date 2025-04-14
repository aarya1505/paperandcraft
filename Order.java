
package com.stationery.model;

public class Order {
    private int orderId;
    private String name;
    private String email;
    private String address;
    private double total;
    private String orderDate;

    // Constructor
    public Order(int orderId, String name, String email, String address, double total, String orderDate) {
        this.orderId = orderId;
        this.name = name;
        this.email = email;
        this.address = address;
        this.total = total;
        this.orderDate = orderDate;
    }

    // Getters and Setters
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public String getOrderDate() { return orderDate; }
    public void setOrderDate(String orderDate) { this.orderDate = orderDate; }
}
