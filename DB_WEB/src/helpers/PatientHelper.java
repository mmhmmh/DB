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
import model.PatientInfo;
import model.SinInfo;
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
                    "select * from users natural join userinfo "
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
    
    public static void addAndUpdatePatient(Patient p) {
        int key = UserHelper.addUser(p);
        if (key != 0) {
            p.getPi().setUserId(key);
        }
        addAndUpdatePatientHealth(p.getHealthCard(), p.getCurrentHealth());
        addAndUpdateSinInfo(p.getSi());
        addAndUpdatePatientInfo(p.getPi());
    }
    
    public static void addAndUpdateSinInfo(SinInfo si) {
        Connection connection = null;
        PreparedStatement PS = null;
        Boolean success = false;
        String error = "Error in ReadWriteExample.read()";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "INSERT INTO sininfo (social_insurance, address_line_1, "
                    + "address_line_2, post_code, city, province) VALUES "
                    + "(?,?,?,?,?,?) ON DUPLICATE KEY UPDATE "
                    + "address_line_1=?,"
                    + "address_line_2=?,"
                    + "post_code=?,"
                    + "city=?,"
                    + "province=?");
            
            PS.setInt(1, si.getSin());
            PS.setString(2, si.getAddress1());
            PS.setString(3, si.getAddress2());
            PS.setString(4, si.getPostCode());
            PS.setString(5, si.getCity());
            PS.setString(6, si.getProvince());
            PS.setString(7, si.getAddress1());
            PS.setString(8, si.getAddress2());
            PS.setString(9, si.getPostCode());
            PS.setString(10, si.getCity());
            PS.setString(11, si.getProvince());
            
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
            
    public static void addAndUpdatePatientInfo(PatientInfo pi) {
        Connection connection = null;
        PreparedStatement PS = null;
        Boolean success = false;
        String error = "Error in ReadWriteExample.read()";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "INSERT INTO patientinfo (user_id, phone, health_card, "
                    + "is_active, social_insurance,default_doctor) VALUES (?,?,?,?,?,?) "
                    + "ON DUPLICATE KEY UPDATE phone=?,"
                    + "health_card=?,"
                    + "is_active=?,"
                    + "social_insurance=?,"
                    + "default_doctor=?");
            
            PS.setInt(1, pi.getUserId());
            PS.setString(2, pi.getPhone());
            PS.setInt(3, pi.getHealthCard());
            PS.setInt(4, pi.getIsActive());
            PS.setInt(5, pi.getSocialInsurance());
            PS.setInt(6, pi.getDefaultDoctor());
            PS.setString(7, pi.getPhone());
            PS.setInt(8, pi.getHealthCard());
            PS.setInt(9, pi.getIsActive());
            PS.setInt(10, pi.getSocialInsurance());
            PS.setInt(11, pi.getDefaultDoctor());
            
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
    
    public static void addAndUpdatePatientHealth(int healthCard, String currentHealth) {
        Connection connection = null;
        PreparedStatement PS = null;
        Boolean success = false;
        String error = "Error in ReadWriteExample.read()";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "INSERT INTO patienthealth(health_card, "
                    + "current_health) values (?, ?) "
                    + "ON DUPLICATE KEY UPDATE current_health=?");
            PS.setInt(1, healthCard);
            PS.setString(2, currentHealth);
            PS.setString(3, currentHealth);
            
            
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
    
    public static Patient getPatientById(int patientId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.writeExample";
        Patient result = null;
       
        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "SELECT * FROM users NATURAL JOIN userinfo "
                    + "NATURAL JOIN patientinfo INNER JOIN "
                    + "patienthealth ON patienthealth.health_card="
                    + "patientinfo.health_card INNER JOIN sininfo ON "
                    + "sininfo.social_insurance=patientinfo.social_insurance "
                    + "WHERE user_id=?");

            PS.setInt(1, patientId);
            results = PS.executeQuery();
            if (results.next()) {
                result = new Patient(results);
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
