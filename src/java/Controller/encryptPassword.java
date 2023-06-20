/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.security.MessageDigest;

/**
 *
 * @author duy
 */
public class encryptPassword {

    public static String encryptPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] bytes = md.digest();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < bytes.length; i++) {
            sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
        }
        String hashedPassword = sb.toString();
        return hashedPassword;
    }

    public static boolean checkPassword(String password, String hashedPassword) throws Exception {
        String hashedInput = encryptPassword(password);
        boolean passwordMatch = hashedInput.equals(hashedPassword);
        return passwordMatch;
    }
}
