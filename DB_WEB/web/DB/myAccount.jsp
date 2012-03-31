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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Page</title>
    </head>
    <body>
        <%
           String email = (String) session.getAttribute("username");
           int userid = ((Integer) session.getAttribute("userid")).intValue();
           UserWithInfo myinfo = UserHelper.findUserWithInfo(userid);
           String fname = myinfo.getfName();
           String lname = myinfo.getlName();
           Enum roleid = RoleHelper.getRoleFromInt(myinfo.getRole());
           String role = roleid.name();
          String phone="";
           if (RoleHelper.Role.Patient==roleid) {
               Patient result = PatientHelper.getPatientById(userid);
               phone = result.getPi().getPhone();
           }
        %>
        <h3>Account Information</h3>
        
        <table>
        
        	<tr>
        		<td>First Name:</td><td><%=fname%></td>
        	</tr>
        	
        	<tr>
        		<td>Last Name:</td><td><%=lname%></td>
        	</tr>
        	        	<tr>
        		<td>Email:</td><td><%=email%></td>
        	</tr>
        	</tr>
                <%
                if (RoleHelper.Role.Patient==roleid) {
                %>
        	<tr>
        		<td>Phone #:</td><td><%=phone%></td>
        	</tr>
                <%
                               }
                %>
        	<tr>
        		<td>Role:</td><td><%=role%></td>
        	</tr>
        	

        </table>
        <br>
        
        <a href="editAccount.jsp">Edit Account Info</a>
        
    </body>
</html>
