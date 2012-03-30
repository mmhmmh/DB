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
import model.Record;

/**
 *
 * @author Mark
 */
public class RecordHelper {
    
    public static List<Record> getAllRecords(int userId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in AppointmentHelper.getFutureAppointments";
        List<Record> result = new LinkedList<Record>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement("SELECT * FROM records INNER JOIN "
                    + "appointments ON records.appointment_id=appointments.appointment_id "
                    + "inner join userinfo ON userinfo.user_id=records.created_by "
                    + "WHERE patient_id=? ORDER BY visit_start ASC"
                    );

            PS.setInt(1, userId);
            
            results = PS.executeQuery();
            while (results.next()) {
                result.add(new Record(results));
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
    
    public static List<Record> getRecentRecords(int userId, int numberOfRecords) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in AppointmentHelper.getFutureAppointments";
        List<Record> result = new LinkedList<Record>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement("SELECT * FROM records INNER JOIN "
                    + "appointments ON records.appointment_id=appointments.appointment_id "
                    + "inner join userinfo ON userinfo.user_id=records.created_by "
                    + "WHERE patient_id=? ORDER BY visit_start ASC LIMIT ?"
                    );

            PS.setInt(1, userId);
            PS.setInt(2, numberOfRecords);
            
            results = PS.executeQuery();
            while (results.next()) {
                result.add(new Record(results));
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
    
    public static Record getRecordById(int recordId) {
        
       Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in AppointmentHelper.getFutureAppointments";
        Record result = null;

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement("SELECT * FROM records INNER JOIN appointments "
                    + "ON records.appointment_id=appointments.appointment_id "
                    + "inner join userinfo as dotor ON dotor.user_"
                    + "id=records.created_by inner join userinfo as patient "
                    + "ON patient.user_id=appointments.patient_id inner "
                    + "join userinfo as staff ON "
                    + "staff.user_id=appointments.patient_id WHERE "
                    + "records.record_id=?"
                    );

            PS.setInt(1, recordId);
            
            results = PS.executeQuery();
            if (results.next()) {
                result = new Record(results);
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
