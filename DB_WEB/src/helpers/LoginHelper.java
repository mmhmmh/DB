/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import db.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


/**
 *
 * @author Mark
 */
public class LoginHelper {
    
    public static int getUserId(String email) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in LoginHelper.getUserId";
        int userId = 0;

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement("SELECT * FROM users WHERE email=?"
                );

            PS.setString(1, email);
            
            results = PS.executeQuery();
            if (results.next()) {
                results.getInt("user_id");
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
        return userId;
    }
    
    public static boolean updatePassword(String email, String oldPassword, String newPassword) {
        if (validPassword(email, oldPassword)) {
            Connection connection = null;
            PreparedStatement PS = null;
            Boolean success = false;
            String error = "Error in LoginHelper.updatePassword()";

            try {
                connection = DB.ConnectToDatabase();
                PS = connection.prepareStatement(
                        "UPDATE users SET password=? WHERE email=?");
                PS.setString(1, newPassword);
                PS.setString(2, email);
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
           return true;
        }
        return false;
    }
    
    public static boolean validPassword(String email, String password) {
        boolean isValid = false;
        
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in LoginHelper.validPassword";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "SELECT * FROM users WHERE email=?");

            PS.setString(1, email);
            results = PS.executeQuery();
            if (results.next()) {
                isValid = (results.getString("password")).equals(password);
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
        return isValid;
    }
}
