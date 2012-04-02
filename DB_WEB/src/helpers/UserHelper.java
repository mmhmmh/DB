/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import db.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.UserWithInfo;

/**
 *
 * @author Administrator
 */
public class UserHelper {

    public static int addUser(UserWithInfo info) {
        if (info.getId() == 0 && RoleHelper.getUserRole(info.getUsername()) != RoleHelper.Role.Unknown) {
            return -1;
        }
        Connection connection = null;
        PreparedStatement PS = null;
        Boolean success = false;
        String error = "Error in UserHelper.addUser()";
        int key = 0;
        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "INSERT INTO users(email, password) values (?, ?) ON DUPLICATE KEY UPDATE password=?", PreparedStatement.RETURN_GENERATED_KEYS);

            PS.setString(1, info.getUsername());
            PS.setString(2, info.getPassword());
            PS.setString(3, info.getPassword());
            
            PS.execute();
            if (info.getId() == 0) {
                ResultSet RS = PS.getGeneratedKeys();
            
                if (RS.next()) {
                    key = RS.getInt(1);
                }
            } else {
                key = info.getId();
            }
            

            PS = connection.prepareStatement(
                    "INSERT INTO userinfo(user_id, first_name, last_name, "
                    + "role_id, user_status) values (?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE "
                    + "first_name=?,last_name=?,role_id=?,user_status=?");
            PS.setInt(1,key);
            PS.setString(2,info.getfName());
            PS.setString(3,info.getlName());
            PS.setInt(4,info.getRole());
            PS.setString(5,"active");
            
            PS.setString(6,info.getfName());
            PS.setString(7,info.getlName());
            PS.setInt(8,info.getRole());
            PS.setString(9,"active");
            
            PS.execute();
            success = true;
        } catch (Exception e) {
            System.out.println(error);
            System.err.println(e.toString());
        } finally {
            try {
                PS.close();
            } catch (Exception e) {
                System.out.println(error);
                System.err.println(e.toString());
            }
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(error);
                System.err.println(e.toString());
            }
        }
        return key;
    }
    
    public static UserWithInfo findUserWithInfo(int userId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.findUserWithInfo";
        UserWithInfo result = null;

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                     "SELECT * FROM userinfo NATURAL JOIN users WHERE user_id=?");

            PS.setInt(1, userId);
            results = PS.executeQuery();
            if (results.next()) {
                result = new UserWithInfo(results);
            }

        } catch (Exception e) {
            System.out.println(error);
            System.err.println(e.toString());
        } finally {
            try {
                PS.close();
            } catch (Exception e) {
                System.out.println(error);
                System.err.println(e.toString());
            }
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(error);
                System.err.println(e.toString());
            }
        }
        return result;
    }
}
