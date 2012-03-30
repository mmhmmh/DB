/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import db.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;
import model.User;

/**
 *
 * @author Mark
 */
public class PatientHelper {
    public static List<User> getAllPatients() {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in PatientHelper.getAllPatients";
        List<User> result = new LinkedList<User>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "select user_id, first_name, last_name, "
                    + "email from users natural join userinfo "
                    + "natural join roles where role_name='Patient'");

            results = PS.executeQuery();
            while (results.next()) {
                result.add(new User(results));
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
