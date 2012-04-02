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
import model.UserWithInfo;

/**
 *
 * @author Mark
 */
public class DoctorPatientHelper {
    public static void grantPermission(int doctorId, int patientId) {
        Connection connection = null;
        PreparedStatement PS = null;
        Boolean success = false;
        String error = "Error in ReadWriteExample.read()";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "INSERT INTO doctorpatient (doctor_id,user_id) VALUES (?,?)");
            PS.setInt(1, doctorId);
            PS.setInt(2, patientId);
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
    
    public static List<Integer> getAllPatientIdForDoctor(int doctorId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.writeExample";
        List<Integer> result = new LinkedList<Integer>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "SELECT * FROM doctorpatient WHERE doctor_id=?");
            PS.setInt(1, doctorId);
            
            results = PS.executeQuery();
            while (results.next()) {
                result.add(new Integer(results.getInt("user_id")));
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

    
    public static boolean hasPermission(int doctorId, int patientId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.writeExample";
        boolean result = false;

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "SELECT * FROM doctorpatient WHERE doctor_id=? AND user_id=?");
            PS.setInt(1, doctorId);
            PS.setInt(2, patientId);
            
            results = PS.executeQuery();
            if (results.next()) {
                result = true;
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
    
    public static void revokePermission(int doctorId, int patientId) {
        Connection connection = null;
        PreparedStatement PS = null;
        Boolean success = false;
        String error = "Error in ReadWriteExample.read()";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "DELETE FROM doctorpatient WHERE doctor_id=? AND user_id=?");
            PS.setInt(1, doctorId);
            PS.setInt(2, patientId);
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
    
    public static List<User> getAllDoctorsForPatient(int patientId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.writeExample";
        List<User> result = new LinkedList<User>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "SELECT * FROM doctorpatient INNER JOIN users ON doctorpatient.doctor_id=users.user_id WHERE doctorpatient.user_id=?");
            PS.setInt(1, patientId);
            
            results = PS.executeQuery();
            while (results.next()) {
                User user = new User();
                user.setId(results.getInt("doctor_id"));
                user.setUsername(results.getString("email"));
                result.add(user);
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
