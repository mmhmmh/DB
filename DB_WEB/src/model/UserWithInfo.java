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
public class UserWithInfo extends User {
    String fName;
    String lName; 
    int role; 
    
    public UserWithInfo() {
        super();
    }
    
    public UserWithInfo(ResultSet results) throws Exception{
        super(results);
        fName = results.getString("first_name");
        lName = results.getString("last_name");
        role = results.getInt("role_id");
    }
    
    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
}
