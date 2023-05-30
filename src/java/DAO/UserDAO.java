/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author duy
 */
import Model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private Connection conn;

    public UserDAO() {
        conn = JDBCUtil.getConnection();
    }

    public void addUser(User user) {
        String sql = "INSERT INTO users (userName, email, password, birthDay, weight, height) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setDate(4, (Date) user.getBirthDay());
            ps.setFloat(5, user.getWeight());
            ps.setFloat(6, user.getHeight());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        String sql = "UPDATE users SET userName=?, email=?, password=?, birthDay=?, weight=?, height=? WHERE id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setDate(4, (Date) user.getBirthDay());
            ps.setFloat(5, user.getWeight());
            ps.setFloat(6, user.getHeight());
            ps.setInt(7, user.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) {
        String sql = "DELETE FROM users WHERE id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setBirthDay(rs.getDate("birthDay"));
                user.setWeight(rs.getFloat("weight"));
                user.setHeight(rs.getFloat("height"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public User getUserById(int id) {
        User user = null;
        String sql = "SELECT * FROM users WHERE id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setBirthDay(rs.getDate("birthDay"));
                user.setWeight(rs.getFloat("weight"));
                user.setHeight(rs.getFloat("height"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
