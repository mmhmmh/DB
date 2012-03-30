/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import db.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.Appointment;

/**
 *
 * @author Mark
 */
public class AppointmentHelper {
    public static List<Appointment> getFutureAppointments(int userId) {
        return null;
    }
    
    public static Appointment getNextAppointment(int userId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.writeExample";
        Appointment result = null;

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "SELECT * FROM appointments INNER JOIN userinfo ON "
                    + "appointments.doctor_id=userinfo.user_id "
                    + "WHERE appointment_status=? AND patient_id=? ORDER BY "
                    + "appointment_start ASC LIMIT 1;");

            PS.setString(1, "scheduled");
            PS.setInt(2, userId);
            
            results = PS.executeQuery();
            if (results.next()) {
                result = new Appointment(results);
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
