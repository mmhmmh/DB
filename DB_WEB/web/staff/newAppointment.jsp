<%-- 
    Document   : newAppointment
    Created on : 28-Mar-2012, 2:05:00 PM
    Author     : Michael

    Purpose:  make an appointment
    User: Staff
--%>

<%@page import="helpers.PatientHelper"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="helpers.DoctorHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Appointment Page</title>
    </head>
    <body>
        
        
<%
    List<User> docList = DoctorHelper.getAllDoctors();
    List<User> patList = PatientHelper.getAllPatients();

    String docListContent;
    String patListContent;
    
    docListContent= "<select name=\"doclist\">";
    for (int i = 0;i<docList.size();i++){
        docListContent=docListContent 
                + String.format("<option value=\"%d\">%s</option>",
                docList.get(i).getId(),docList.get(i).getUsername());
    }
    docListContent = docListContent + "</select>";
    

    patListContent= "<select name=\"patlist\">";
    for (int i = 0;i<patList.size();i++){
        patListContent=patListContent 
                + String.format("<option value=\"%d\">%s</option>",
                patList.get(i).getId(),patList.get(i).getUsername());
    }
    patListContent = patListContent + "</select>";
    

    
%>
        
    
    	<h2>Create New Appointment</h2>
        
        <%@include file="/helper/ResultDisplay.jsp" %>
    	<br>
    	

    	<form action="newAppointmentRequest.jsp">
        
        <table>
        
        	<tr>
                    <td>Patient:</td>
                    <td><%=patListContent%></td>
                    <td><a href="../DB/addUser.jsp">Create User</a> </td>
        	</tr>

        	<tr>
                    <td>Doctor:</td>
                    <td><%=docListContent%></td>
        	</tr>
        	
        	<tr>
                    <td>Appointment Start:</td> <td><input type="text" name="appstart"></td> <td>( mm/dd/yyyy hh:mm )</td>

        	</tr>
        	
        	
        	<tr>
                    <td>Appointment End:</td> <td><input type="text" name="append"> </td> <td>( mm/dd/yyyy hh:mm )</td>
        	</tr>        
        
        </table>
        
        <br>
        <br>
        
        <input type="submit" value="Create"/>
        
        </form>
        
        
    </body>
</html>
