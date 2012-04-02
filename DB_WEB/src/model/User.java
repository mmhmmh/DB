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
public class User {
    int id;
    String username;
    String password;

    public User() {
        id = 0;
        username = "";
        password = "";
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 23 * hash + this.id;
        hash = 23 * hash + (this.username != null ? this.username.hashCode() : 0);
        //hash = 23 * hash + (this.password != null ? this.password.hashCode() : 0);
        return hash;
    }

    
    
    @Override
    public boolean equals(Object obj) {
        if (obj instanceof User){
            return this.id == ((User)obj).getId() && this.username.equals(((User)obj).getUsername());
        } else {
            return false;
        }
    }
    
    public User(ResultSet results) throws Exception{
        id = results.getInt("user_id");
        username = results.getString("email");
        password = results.getString("password");
        //String tmp = results.getString("password");
        //password = tmp == null ? "" : tmp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
