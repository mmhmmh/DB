/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;
import javax.naming.spi.DirStateFactory;

/**
 *
 * @author Mark
 */
public class SinInfo {
    int sin;
    String address1;
    String address2;
    String postCode;
    String city;
    String province;
    
    public SinInfo() {
        
    }
    
    public SinInfo(ResultSet rs) throws Exception {
        sin = rs.getInt("social_insurance");
        address1 = rs.getString("address_line_1");
        address2 = rs.getString("address_line_2");
        postCode = rs.getString("post_code");
        city = rs.getString("city");
        province = rs.getString("province");
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public int getSin() {
        return sin;
    }

    public void setSin(int sin) {
        this.sin = sin;
    }
    
    
}
