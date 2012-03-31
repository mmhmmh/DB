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
public class RoleHelper {
    public enum Role {
        Patient,
        Doctor,
        Staff,
        Finance,
        Unknown
    }
    
    public static Role getRoleFromInt(int key) {
        Role result = Role.Unknown;
        if (key == 1) {
            result = Role.Patient;
        } else if (key == 2) {
            result = Role.Doctor;
        } else if (key == 3) {
            result = Role.Staff;
        } else if (key == 4) {
            result = Role.Finance;
        }
        return result;
    }
    
    public static Role getUserRole(String username) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.writeExample";
        Role result = Role.Unknown;

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "SELECT * FROM users NATURAL JOIN userinfo INNER JOIN roles on userinfo.role_id=roles.role_id WHERE email=?");

            PS.setString(1, username);
            results = PS.executeQuery();
            if (results.next()) {
                int key = results.getInt("role_id");
                result = getRoleFromInt(key);
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
