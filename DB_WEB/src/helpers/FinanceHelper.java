/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import db.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

/**
 *
 * @author Mark
 */




public class FinanceHelper {
    public static HashMap<Integer,Integer> findPatientsAndVisits(int doctorId, Date appStart, Date appEnd) {
        
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.writeExample";
        HashMap<Integer,Integer> result = new HashMap<Integer, Integer>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "SELECT COUNT(appointment_id) AS c, patient_id "
                    + "FROM appointments INNER JOIN userinfo "
                    + "ON user_id=doctor_id WHERE doctor_id=? AND "
                    + "appointment_status='finished' AND appointment_start>? "
                    + "AND appointment_start<?");

            PS.setInt(1, doctorId);
            PS.setTimestamp(2, new Timestamp(appStart.getTime()));
            PS.setTimestamp(3, new Timestamp(appEnd.getTime()));
            
            results = PS.executeQuery();
            while (results.next()) {
                int numTimes = results.getInt("c");
                int patientId = results.getInt("patient_id");
                if (numTimes != 0) {
                    result.put(new Integer(patientId), new Integer(numTimes));
                }
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
    
    
    //SELECT COUNT(DISTINCT appointment_id) FROM records NATURAL JOIN appointments WHERE doctor_id=? AND patient_id=?;
}
