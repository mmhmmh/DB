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
public class PatientInfo {
    int userId;
    String phone;
    int healthCard;
    int isActive;
    int socialInsurance;
    int defaultDoctor;
    
    public PatientInfo() {
        userId = 0;
        phone = "";
        healthCard = 0;
        isActive = 0;
        socialInsurance = 0;
        defaultDoctor = 0;
    }
    
    public PatientInfo(ResultSet rs) throws Exception {
        userId = rs.getInt("user_id");
        phone = rs.getString("phone");
        healthCard = rs.getInt("health_card");
        isActive = rs.getInt("is_active");
        socialInsurance = rs.getInt("social_insurance");
        defaultDoctor = rs.getInt("default_doctor");
    }

    public int getDefaultDoctor() {
        return defaultDoctor;
    }

    public void setDefaultDoctor(int defaultDoctor) {
        this.defaultDoctor = defaultDoctor;
    }

    
    
    public int getHealthCard() {
        return healthCard;
    }

    public void setHealthCard(int healthCard) {
        this.healthCard = healthCard;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getSocialInsurance() {
        return socialInsurance;
    }

    public void setSocialInsurance(int socialInsurance) {
        this.socialInsurance = socialInsurance;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
}
