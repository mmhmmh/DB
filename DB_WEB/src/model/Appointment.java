/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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
