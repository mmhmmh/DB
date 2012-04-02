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
    int base_id;
    String comment;

    public Record() {
        diagnosis = "";
        prescriptions = "";
        schedulingOfTreatment = "";
        comment = "";
    }
    
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Record other = (Record) obj;
        if (this.recordId != other.recordId) {
            return false;
        }
        if (this.appointmentId != other.appointmentId) {
            return false;
        }
        if (this.visitStart != other.visitStart) {
            return false;
        }
        if (this.visitEnd != other.visitEnd) {
            return false;
        }
        if (this.createdBy != other.createdBy) {
            return false;
        }
        if (this.doctorId != other.doctorId) {
            return false;
        }
        if ((this.diagnosis == null) ? (other.diagnosis != null) : !this.diagnosis.equals(other.diagnosis)) {
            return false;
        }
        if ((this.prescriptions == null) ? (other.prescriptions != null) : !this.prescriptions.equals(other.prescriptions)) {
            return false;
        }
        if ((this.schedulingOfTreatment == null) ? (other.schedulingOfTreatment != null) : !this.schedulingOfTreatment.equals(other.schedulingOfTreatment)) {
            return false;
        }
        if (this.base_id != other.base_id) {
            return false;
        }
        if ((this.comment == null) ? (other.comment != null) : !this.comment.equals(other.comment)) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 37 * hash + this.recordId;
        hash = 37 * hash + this.appointmentId;
        hash = 37 * hash + (int) (this.visitStart ^ (this.visitStart >>> 32));
        hash = 37 * hash + (int) (this.visitEnd ^ (this.visitEnd >>> 32));
        hash = 37 * hash + this.createdBy;
        hash = 37 * hash + this.doctorId;
        hash = 37 * hash + (this.diagnosis != null ? this.diagnosis.hashCode() : 0);
        hash = 37 * hash + (this.prescriptions != null ? this.prescriptions.hashCode() : 0);
        hash = 37 * hash + (this.schedulingOfTreatment != null ? this.schedulingOfTreatment.hashCode() : 0);
        hash = 37 * hash + this.base_id;
        hash = 37 * hash + (this.comment != null ? this.comment.hashCode() : 0);
        return hash;
    }


    public Record(ResultSet results) throws Exception {
        recordId = results.getInt("record_id");
        appointmentId = results.getInt("appointment_id");
        visitStart = (results.getTimestamp("visit_start")).getTime();
        visitEnd = (results.getTimestamp("visit_end")).getTime();
        createdBy = results.getInt("created_by");
        doctorId = results.getInt("doctor_id");
        diagnosis = results.getString("diagnosis");
        prescriptions = results.getString("prescriptions");
        schedulingOfTreatment = results.getString("scheduling_of_treatment");
        base_id = 0;
        try {
            base_id = results.getInt("base_id");
        } catch (Exception e) {
        }
        comment = results.getString("comment");
    }

    public int getBase_id() {
        return base_id;
    }

    public void setBase_id(int base_id) {
        this.base_id = base_id;
    }

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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
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
