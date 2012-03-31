/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;

/**
 *
 * @author Mark
 */
public class Appointment {
    int appointmentId;
    int patientId;
    int staffId;
    int doctorId;
    long startTime;
    long endTime;
    String appiontmentStatus;
    
    public Appointment() {
        
    }

    public Appointment(ResultSet results) throws Exception {
        appointmentId = results.getInt("appointment_id");
        patientId = results.getInt("patient_id");
        staffId = results.getInt("staff_id");
        doctorId = results.getInt("doctor_id");
        startTime = results.getTimestamp("appointment_start").getTime();
        endTime = results.getTimestamp("appointment_end").getTime();
        appiontmentStatus = results.getString("appointment_status");
    }

    public void setAppiontmentStatus(String appiontmentStatus) {
        this.appiontmentStatus = appiontmentStatus;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public void setEndTime(long endTime) {
        this.endTime = endTime;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }
    
    public String getAppiontmentStatus() {
        return appiontmentStatus;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public long getEndTime() {
        return endTime;
    }

    public int getPatientId() {
        return patientId;
    }

    public int getStaffId() {
        return staffId;
    }

    public long getStartTime() {
        return startTime;
    }
}
