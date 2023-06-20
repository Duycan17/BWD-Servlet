/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.UserDAO.readUsersFromXML;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author duy
 */
public class Main {

    public static void main(String[] args) {
        ArrayList<HashMap<String, String>> users = UserDAO.readUsersFromXML("/media/duy/33e9c786-2adc-46bf-8c3b-56bb1843c2e7/Download/apache-tomcat-9.0.74/bin/users.xml");
        for (HashMap<String, String> user : users) {
            System.out.println("  Name: " + user.get("userName"));
            System.out.println("  Email: " + user.get("email"));
            System.out.println("  Age: " + user.get("age"));
            System.out.println("  Weight: " + user.get("weight"));
            System.out.println("  Height: " + user.get("height"));
        }
    }
}
