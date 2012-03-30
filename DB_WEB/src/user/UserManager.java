/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import db.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Administrator
 */
public class UserManager {

    public static void addUser(String fName, String lName, int role, String email, String password) {
        Connection connection = null;
        PreparedStatement PS = null;
        Boolean success = false;
        String error = "Error in ReadWriteExample.read()";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "INSERT INTO users(email, password) values (?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);

            PS.setString(1, email);
            PS.setString(2, password);
            PS.execute();
            ResultSet RS = PS.getGeneratedKeys();
            
            int key = 0;
            if (RS.next()) {
                key = RS.getInt(1);
            }

            PS = connection.prepareStatement(
                    "INSERT INTO userinfo(user_id, first_name, last_name, role_id, user_status) values (?, ?, ?, ?, ?)");
            PS.setInt(1,key);
            PS.setString(2,fName);
            PS.setString(3,lName);
            PS.setInt(4,1);
            PS.setString(5,"active");
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
    }
}
