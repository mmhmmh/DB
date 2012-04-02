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
import java.util.LinkedList;
import java.util.List;
import model.Record;
import model.UserWithInfo;

/**
 *
 * @author Mark
 */
public class RecordHelper {

    public static List<Record> getAllRecords(int userId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in RecordHelper.getAllRecords";
        List<Record> result = new LinkedList<Record>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement("SELECT * FROM records INNER JOIN "
                    + "appointments ON records.appointment_id=appointments.appointment_id "
                    + "inner join userinfo ON userinfo.user_id=records.created_by "
                    + "WHERE patient_id=? ORDER BY visit_start ASC");

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

    public static HashMap<Record, UserWithInfo> getRecentRecords(int userId, int numberOfRecords) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in RecordHelper.getRecentRecords";
        HashMap<Record, UserWithInfo> result = new HashMap<Record, UserWithInfo>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement("SELECT * FROM records "
                    + "NATURAL JOIN appointments INNER JOIN (SELECT "
                    + "max(record_id) AS mr FROM records NATURAL JOIN "
                    + "appointments GROUP BY appointment_id) AS mar ON "
                    + "mar.mr=records.record_id INNER JOIN userinfo on "
                    + "appointments.doctor_id=userinfo.user_id INNER JOIN "
                    + "users ON users.user_id=userinfo.user_id "
                    + "WHERE patient_id=? ORDER BY created_on DESC LIMIT ?");

            PS.setInt(1, userId);
            PS.setInt(2, numberOfRecords);

            results = PS.executeQuery();
            while (results.next()) {
                result.put(new Record(results), new UserWithInfo(results));
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

    public static List<Record> getRecordeRevisionByBaseId(int baseId) {
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in RecordHelper.getRecentRecords";
        List<Record> result = new LinkedList<Record>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement("SELECT * FROM records NATURAL "
                    + "JOIN appointments WHERE doctor_id=? AND "
                    + "(record_id=? OR base_id=?);");

            PS.setInt(1, baseId);
            PS.setInt(2, baseId);

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
                    + "records.record_id=?");

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
    public static HashMap<Record,UserWithInfo> searchRecordsForDoctor(int doctor_id, String keyword){
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.writeExample";
        HashMap<Record,UserWithInfo> result = new HashMap<Record,UserWithInfo>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement("SELECT * FROM records NATURAL JOIN "
                    + "appointments INNER JOIN (SELECT user_id FROM patientinfo "
                    + "WHERE default_doctor=? UNION SELECT user_id FROM "
                    + "doctorpatient WHERE doctor_id=?) AS allpatients ON "
                    + "appointments.patient_id=allpatients.user_id INNER JOIN "
                    + "userinfo ON userinfo.user_id=allpatients.user_id "
                    + "INNER JOIN users ON users.user_id=allpatients.user_id "
                    + "WHERE email like '%" + keyword 
                    + "%' OR first_name like '%" + keyword 
                    + "%' OR last_name like '%" + keyword 
                    + "%' OR appointment_start like '%" + keyword
                    + "%' OR diagnosis like '%" + keyword
                    + "%' OR comment like '%" + keyword
                    + "%' OR allpatients.user_id=?"
                    + " ORDER BY record_id DESC");
            PS.setInt(1, doctor_id);
            PS.setInt(2, doctor_id);
            PS.setString(3, keyword);
            results = PS.executeQuery();

            while (results.next()) {
                result.put(new Record(results), new UserWithInfo(results));
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
    
    
    public static HashMap<Record,UserWithInfo> getAllRecordsForDoctor(int doctor_id){
        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.writeExample";
        HashMap<Record,UserWithInfo> result = new HashMap<Record,UserWithInfo>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement("SELECT * FROM records NATURAL JOIN "
                    + "appointments INNER JOIN (SELECT user_id FROM patientinfo "
                    + "WHERE default_doctor=? UNION SELECT user_id FROM "
                    + "doctorpatient WHERE doctor_id=?) AS allpatients ON "
                    + "appointments.patient_id=allpatients.user_id INNER JOIN "
                    + "userinfo ON userinfo.user_id=allpatients.user_id "
                    + "INNER JOIN users ON users.user_id=allpatients.user_id"
                    + " ORDER BY record_id DESC");

            PS.setInt(1, doctor_id);
            PS.setInt(2, doctor_id);
            
            results = PS.executeQuery();

            while (results.next()) {
                result.put(new Record(results), new UserWithInfo(results));
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

    public static List<Record> getAllRecordsForPatientAndDoctor(int patient_id, int doctor_id, Date start, Date end) {

        Connection connection = null;
        ResultSet results;
        PreparedStatement PS = null;
        String error = "Error in WriteExample.writeExample";
        List<Record> result = new LinkedList<Record>();

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "SELECT * FROM records "
                    + "NATURAL JOIN appointments "
                    + "WHERE patient_id=? "
                    + "AND doctor_id=? "
                    + "AND visit_start>? "
                    + "AND visit_start<?");

            PS.setInt(1, patient_id);
            PS.setInt(2, doctor_id);
            PS.setTimestamp(3, new Timestamp(start.getTime()));
            PS.setTimestamp(4, new Timestamp(end.getTime()));
            
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

    public static void saveRecord(Record r) {
        Connection connection = null;
        PreparedStatement PS = null;
        Boolean success = false;
        String error = "Error in RecordHelper.saveRecord()";

        try {
            connection = DB.ConnectToDatabase();
            PS = connection.prepareStatement(
                    "INSERT INTO records (appointment_id, visit_start, "
                    + "visit_end, diagnosis, prescriptions, "
                    + "scheduling_of_treatment, base_id, created_by,comment) "
                    + "VALUES (?,?,?,?,?,?,?,?,?)");
            PS.setInt(1, r.getAppointmentId());
            PS.setTimestamp(2, new Timestamp(r.getVisitStart()));
            PS.setTimestamp(3, new Timestamp(r.getVisitEnd()));
            PS.setString(4, r.getDiagnosis());
            PS.setString(5, r.getPrescriptions());
            PS.setString(6, r.getSchedulingOfTreatment());
            if (r.getBase_id() == 0) {
                PS.setNull(7, java.sql.Types.INTEGER);
            } else {
                PS.setInt(7, r.getBase_id());
            }
            PS.setInt(8, r.getCreatedBy());
            PS.setString(9, r.getComment());
            

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
