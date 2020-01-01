package com.ttre16.jordan.logic;

import java.sql.*;

public class Customer {
    private int id;
    private String name;
    private String password;
    private String email;
    private String phone;
    private Cart cart;
    private boolean isLogin;

    public Customer() {
        this.isLogin = false;
    }

    public String getName() {
        return name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Cart getCart() {
        return cart;
    }

    public boolean isLogin() {
        return isLogin;
    }

    public void setLogin(boolean login) {
        isLogin = login;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", cart=" + cart +
                '}';
    }

    private Connection connectionSetup() throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/shop";
        String user = "postgres";
        String password = "password";
        return DriverManager.getConnection(url, user, password);
    }

    private String checkUser() {
        String sql = "SELECT * FROM customer WHERE name = '%s'";
        sql = String.format(sql, this.name);
        boolean check = false;
        try (Statement statement = connectionSetup().createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            if (resultSet.next())
                check = resultSet.getString("password").equals(this.password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check ? "log1" : "log0";
    }

    private String createUser() {
        if (!uniqueName(this.name)) return "insert0";
        String sql = "INSERT INTO customer (name, password, email, phone) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connectionSetup().prepareStatement(sql)) {
            statement.setString(1, this.name);
            statement.setString(2, this.password);
            statement.setString(3, this.email);
            statement.setString(4, this.phone);
            statement.executeUpdate();
            new Cart().createCart(this);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "insert1";
    }

    private boolean uniqueName(String name) {
        boolean unique = true;
        String sql = "SELECT name FROM customer WHERE name = '%s'";
        sql = String.format(sql, name);
        try (Statement statement = connectionSetup().createStatement()) {
            unique = statement.executeQuery(sql).next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return !unique;
    }

    public String come() {
        if (this.email == null) return this.checkUser();
        return this.createUser();
    }

    public int getId() {
        String sql =
                "SELECT id FROM customer " +
                        "WHERE name = '%s'";
        sql = String.format(sql, this.name);
        try (Statement statement = connectionSetup().createStatement()) {
            ResultSet set = statement.executeQuery(sql);
            if (set.next()) return set.getInt("id");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}