/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Mark
 */
public class Record {
    int recordId;
    int appointmentId;
    long visitStart;
    long visitEnd;
    int createdBy;
    int doctorId;
    String diagnosis;
    String prescriptions;
    String schedulingOfTreatment;

    public int getAppointmentId() {
        return appointmentId;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public String getPrescriptions() {
        return prescriptions;
    }

    public int getRecordId() {
        return recordId;
    }

    public String getSchedulingOfTreatment() {
        return schedulingOfTreatment;
    }

    public long getVisitEnd() {
        return visitEnd;
    }

    public long getVisitStart() {
        return visitStart;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public void setPrescriptions(String prescriptions) {
        this.prescriptions = prescriptions;
    }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }

    public void setSchedulingOfTreatment(String schedulingOfTreatment) {
        this.schedulingOfTreatment = schedulingOfTreatment;
    }

    public void setVisitEnd(long visitEnd) {
        this.visitEnd = visitEnd;
    }

    public void setVisitStart(long visitStart) {
        this.visitStart = visitStart;
    }
    
}
