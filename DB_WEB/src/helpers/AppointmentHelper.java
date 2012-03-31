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
import java.util.LinkedList;
import java.util.List;
import model.Appointment;

/**
 *
 * @author Mark
 */
public class AppointmentHelper {
    public static List<Appointment> getFutureAppointments(int userId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in AppointmentHelper.getFutureAppointments";
        List<Appointment> result = new LinkedList<Appointment>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "SELECT * FROM appointments INNER JOIN userinfo "
                    + "ON appointments.doctor_id=userinfo.user_id WHERE "
                    + "appointment_status=? AND (patient_id=? OR doctor_id=?) ORDER BY "
                    + "appointment_start ASC");

            PS.setString(1, "scheduled");
            PS.setInt(2, userId);
            PS.setInt(3, userId);
            
            results = PS.executeQuery();
            while (results.next()) {
                result.add(new Appointment(results));
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
    
    public static Appointment getNextAppointment(int userId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in AppointmentHelper.getNextAppointment";
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
    
    public static void updateAppointment(Appointment appointment) {
        
        Connection connection = null;
        PreparedStatement PS = null;
        Boolean success = false;
        String error = "Error in ReadWriteExample.read()";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "UPDATE appointments SET patient_id=?, staff_id=?, doctor_id=?, appointment_start=?, appointment_end=?, appointment_status=? WHERE appointment_id=?");
            PS.setInt(1, appointment.getPatientId());
            PS.setInt(2, appointment.getStaffId());
            PS.setInt(3, appointment.getDoctorId());
            PS.setTimestamp(4, new Timestamp(appointment.getStartTime()));
            PS.setTimestamp(5, new Timestamp(appointment.getEndTime()));
            PS.setString(6, appointment.getAppiontmentStatus());
            PS.setInt(7, appointment.getAppointmentId());
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
    
    public static void addAppointment(Appointment appointment) {
        Connection connection = null;
        PreparedStatement PS = null;
        Boolean success = false;
        String error = "Error in ReadWriteExample.read()";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "INSERT INTO appointments (patient_id, doctor_id, staff_id, appointment_start, appointment_end, appointment_status) VALUES (?,?,?,?,?,?)");
            PS.setInt(1, appointment.getPatientId());
            PS.setInt(2, appointment.getDoctorId());
            PS.setInt(3, appointment.getStaffId());
            PS.setTimestamp(4, new Timestamp(appointment.getStartTime()));
            PS.setTimestamp(5, new Timestamp(appointment.getEndTime()));
            PS.setString(6,appointment.getAppiontmentStatus());
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
