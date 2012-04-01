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
import model.Patient;
import model.User;
import model.UserWithInfo;

/**
 *
 * @author Mark
 */
public class DoctorHelper {
    public static String getName(int doctorId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in DoctorHelper.getName";
        String result = "";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "select user_id, first_name, last_name, "
                    + "email from users natural join userinfo "
                    + "natural join roles where role_name='Doctor' AND user_id=?");

            PS.setInt(1, doctorId);
            results = PS.executeQuery();
            if (results.next()) {
                result = results.getString("email");
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
    
    public static List<User> getAllDoctors() {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in DoctorHelper.getAllDoctors";
        List<User> result = new LinkedList<User>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "select user_id, first_name, last_name, "
                    + "email from users natural join userinfo "
                    + "natural join roles where role_name='Doctor'");

            //PS.setString(1, "testString");
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
    
    public static List<UserWithInfo> getAllPatientsForDoctor(int doctorId) {
        
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in getAllPatientsForDoctor";
        List<UserWithInfo> result = new LinkedList<UserWithInfo>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                  "SELECT * FROM userinfo NATURAL JOIN "
                + "(SELECT user_id FROM patientinfo WHERE "
                + "default_doctor=? UNION SELECT user_id "
                + "FROM doctorpatient WHERE doctor_id=?) as allpatients");

            PS.setInt(1, doctorId);
            PS.setInt(2, doctorId);
            results = PS.executeQuery();
            while (results.next()) {
                result.add(new UserWithInfo(results));
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
