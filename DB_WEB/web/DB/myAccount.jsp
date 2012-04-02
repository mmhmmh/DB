<%-- 
    Document   : myAccount
    Created on : 28-Mar-2012, 1:21:49 PM
    Author     : Michael

    Purpose:  review address, phone, etc
    User: Patient
--%>

<%@page import="model.PatientInfo"%>
<%@page import="model.UserWithInfo"%>
<%@page import="model.Patient"%>
<%@page import="helpers.UserHelper"%>
<%@page import="helpers.RoleHelper"%>
<%@page import="helpers.PatientHelper"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/helper/Header.jsp"%>
        <%
           String email = (String) session.getAttribute("username");
           int userid = ((Integer) session.getAttribute("userid")).intValue();
           UserWithInfo myinfo = UserHelper.findUserWithInfo(userid);
           String fname = myinfo.getfName();
           String lname = myinfo.getlName();
           Enum roleid = RoleHelper.getRoleFromInt(myinfo.getRole());
           String role = roleid.name();
          
        %>
        <h3>Account Information</h3>
        
        <dl>
            <dt>First Name:</dt><dd><%=fname%></dd>
            <dt>Last Name:</dt><dd><%=lname%></dd>
            <dt>Email:</dt><dd><%=email%></dd>
            <%
                if (RoleHelper.Role.Patient==roleid) {
                    Patient result = PatientHelper.getPatientById(userid);
                    int dfdocid = result.getPi().getDefaultDoctor();
                    UserWithInfo dfdoc = UserHelper.findUserWithInfo(dfdocid);
                    String defaultDoctor = dfdoc.getfName() + " " + dfdoc.getlName();
                    String phone = result.getPi().getPhone();
                    String address1 = result.getSi().getAddress1();
                    String address2 = result.getSi().getAddress2();
                    if(address2.trim().length() != 0){
                    address1 = address1 + "/n" + address2;
                    }
                    String city = result.getSi().getCity();
                    String province = result.getSi().getProvince();
                    String pcode = result.getSi().getPostCode();
                    int hcard = result.getPi().getHealthCard();
                    int sinnum = result.getPi().getSocialInsurance();
                    String hstatus = result.getCurrentHealth();
            %>
            <dt>Phone #:</dt><dd><%=phone%></dd>
            <dt>Address:</dt><dd><%=address1%></dd>
            <dt>City:</dt><dd><%=city%></dd>
            <dt>Province:</dt><dd><%=province%></dd>
            <dt>Postal Code:</dt><dd><%=pcode%></dd>
            <dt>Health Card Number:</dt><dd><%=hcard%></dd>
            <dt>Social Insurance Number:</dt><dd><%=sinnum%></dd>
            <dt>Heath Status:</dt><dd><%=hstatus%></dd>
            <dt>Default Doctor:</dt><dd><%=defaultDoctor%></dd>
            <% } %>
            <dt>Role:</dt><dd><%=role%></dd>
        	

        </dl>
        <a href="editAccount.jsp">Edit Account Info</a>
        
    </body>
</html>
