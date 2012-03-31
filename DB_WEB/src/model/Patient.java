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
public class Patient extends UserWithInfo {
    SinInfo si;
    PatientInfo pi;
    
    int healthCard;
    String currentHealth;

    public Patient() {
        super();
    }
    
    public PatientInfo getPi() {
        return pi;
    }

    public void setPi(PatientInfo pi) {
        this.pi = pi;
    }

    public SinInfo getSi() {
        return si;
    }

    public void setSi(SinInfo si) {
        this.si = si;
    }

    public String getCurrentHealth() {
        return currentHealth;
    }

    public void setCurrentHealth(String currentHealth) {
        this.currentHealth = currentHealth;
    }

    public int getHealthCard() {
        return healthCard;
    }

    public void setHealthCard(int healthCard) {
        this.healthCard = healthCard;
    }
    
    public Patient(ResultSet results) throws Exception{
        super(results);
        this.si = new SinInfo(results);
        this.pi = new PatientInfo(results);
        this.healthCard = results.getInt("health_card");
        this.currentHealth = results.getString("current_health");
    }
}
