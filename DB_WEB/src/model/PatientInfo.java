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
    
    public PatientInfo() {
        
    }
    
    public PatientInfo(ResultSet rs) throws Exception {
        userId = rs.getInt("user_id");
        phone = rs.getString("phone");
        healthCard = rs.getInt("health");
        isActive = rs.getInt("is_active");
        socialInsurance = rs.getInt("social_insurance");
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
