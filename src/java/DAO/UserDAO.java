package DAO;

import Controller.encryptPassword;
import static Controller.encryptPassword.encryptPassword;
import Model.User;
import java.io.File;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class UserDAO {

    private Connection conn;

    public UserDAO() {
        conn = JDBCUtil.getConnection();
    }

    public boolean addUser(User user) {
        String sqlProfile = "INSERT INTO user_profile (birthDay, weight, height) VALUES (?, ?, ?)";
        String sqlUser = "INSERT INTO users (userName, email, password, profile_id) VALUES (?, ?, ?, ?)";
        try {
            // Insert user profile first
            PreparedStatement psProfile = conn.prepareStatement(sqlProfile, Statement.RETURN_GENERATED_KEYS);
            psProfile.setDate(1, (Date) user.getBirthDay());
            psProfile.setFloat(2, user.getWeight());
            psProfile.setFloat(3, user.getHeight());
            psProfile.executeUpdate();
            ResultSet profileKeys = psProfile.getGeneratedKeys();
            if (!profileKeys.next()) {
                return false;
            }
            int profileId = profileKeys.getInt(1);
            // Insert user with profile ID as foreign key
            PreparedStatement psUser = conn.prepareStatement(sqlUser);
            psUser.setString(1, user.getUserName());
            psUser.setString(2, user.getEmail());
            psUser.setString(3, user.getPassword());
            psUser.setInt(4, profileId);
            psUser.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void updateUser(User user) {
        String sqlProfile = "UPDATE user_profile SET birthDay=?, weight=?, height=? WHERE id=?";
        String sqlUser = "UPDATE users SET userName=?, email=?, password=? WHERE id=?";
        try {
            // Update user profile first
            PreparedStatement psProfile = conn.prepareStatement(sqlProfile);
            psProfile.setDate(1, (Date) user.getBirthDay());
            psProfile.setFloat(2, user.getWeight());
            psProfile.setFloat(3, user.getHeight());
            psProfile.setInt(4, user.getId());
            psProfile.executeUpdate();
            // Update user
            PreparedStatement psUser = conn.prepareStatement(sqlUser);
            psUser.setString(1, user.getUserName());
            psUser.setString(2, user.getEmail());
            psUser.setString(3, user.getPassword());
            psUser.setInt(4, user.getId());
            psUser.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) {
        String sqlUser = "DELETE FROM users WHERE id=?";
        String sqlProfile = "DELETE FROM user_profile WHERE id=?";
        try {
            // Delete user first (foreign key constraint will delete user profile)
            PreparedStatement psUser = conn.prepareStatement(sqlUser);
            psUser.setInt(1, id);
            psUser.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM users INNER JOIN user_profile ON users.profile_id = user_profile.id";
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("users.id"));
                user.setUserName(rs.getString("users.userName"));
                user.setEmail(rs.getString("users.email"));
                user.setPassword(rs.getString("users.password"));
                user.setBirthDay(rs.getDate("user_profile.birthDay"));
                user.setWeight(rs.getFloat("user_profile.weight"));
                user.setHeight(rs.getFloat("user_profile.height"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public User getUserById(int id) {
        User user = null;
        String sql = "SELECT * FROM users INNER JOIN user_profile ON users.profile_id = user_profile.id WHERE users.id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("users.id"));
                user.setUserName(rs.getString("users.userName"));
                user.setEmail(rs.getString("users.email"));
                user.setPassword(rs.getString("users.password"));
                user.setBirthDay(rs.getDate("user_profile.birthDay"));
                user.setWeight(rs.getFloat("user_profile.weight"));
                user.setHeight(rs.getFloat("user_profile.height"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User checkAccount(String email, String password) {
        User user = null;
        String sql = "SELECT * FROM users INNER JOIN user_profile ON users.profile_id = user_profile.id WHERE email=? and password=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            String passwordEn = null;
            try {
                passwordEn = encryptPassword.encryptPassword(password);
            } catch (Exception ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps.setString(2, passwordEn);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("users.id"));
                user.setUserName(rs.getString("users.userName"));
                user.setEmail(rs.getString("users.email"));
                user.setPassword(rs.getString("users.password"));
                user.setBirthDay(rs.getDate("user_profile.birthDay"));
                user.setWeight(rs.getFloat("user_profile.weight"));
                user.setHeight(rs.getFloat("user_profile.height"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public static ArrayList<HashMap<String, String>> readUsersFromXML(String filePath) {
        ArrayList<HashMap<String, String>> users = new ArrayList<HashMap<String, String>>();
        try {
            File xmlFile = new File(filePath);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();
            NodeList nodeList = doc.getElementsByTagName("user");
            for (int i = 0; i < nodeList.getLength(); i++) {
                Element userElement = (Element) nodeList.item(i);
                HashMap<String, String> user = new HashMap<String, String>();
                user.put("userName", userElement.getElementsByTagName("userName").item(0).getTextContent());
                user.put("email", userElement.getElementsByTagName("email").item(0).getTextContent());
                user.put("age", userElement.getElementsByTagName("age").item(0).getTextContent());
                user.put("weight", userElement.getElementsByTagName("weight").item(0).getTextContent());
                user.put("height", userElement.getElementsByTagName("height").item(0).getTextContent());
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public User findByEmail(String email) {
        User user = null;
        String sql = "SELECT * FROM users INNER JOIN user_profile ON users.profile_id = user_profile.id WHERE email=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("users.id"));
                user.setUserName(rs.getString("users.userName"));
                user.setEmail(rs.getString("users.email"));
                user.setPassword(rs.getString("users.password"));
                user.setBirthDay(rs.getDate("user_profile.birthDay"));
                user.setWeight(rs.getFloat("user_profile.weight"));
                user.setHeight(rs.getFloat("user_profile.height"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updatePasswordByEmail(String email, String newPassword) {
        String sql = "UPDATE users SET password=? WHERE email=?";
        try {
            String hashedPassword = encryptPassword(newPassword); // Hash the new password
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, hashedPassword);
            ps.setString(2, email);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private String encryptPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(password.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashText = no.toString(16);
            while (hashText.length() < 32) {
                hashText = "0" + hashText;
            }
            return hashText;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

}
