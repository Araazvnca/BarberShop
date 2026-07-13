package com.barbershop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Koneksi {
    private static final String URL = "jdbc:mysql://localhost:3306/db_barbershop?useSSL=false&serverTimezone=Asia/Makassar";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // default XAMPP kosong

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "Driver MySQL JDBC tidak ditemukan.\nTambahkan mysql-connector-j.jar ke Library project.");
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Gagal konek ke database:\n" + e.getMessage());
        }
        return conn;
    }
}