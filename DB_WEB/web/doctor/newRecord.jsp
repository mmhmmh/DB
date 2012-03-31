<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<!-- 
    Document   : newRecord
    Created on : Mar 31, 2012, 9:17:48 AM
    Author     : Administrator
-->

<%@page import="java.util.List"%>
<%@page import="model.Appointment"%>
<%@page import="helpers.AppointmentHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Record Page</title>
    </head>
    <body>
        <%
            int doctorId = ((Integer) session.getAttribute("userid")).intValue();
            Appointment a = (Appointment)session.getAttribute("appointment");

            
            Date visitStart =new Date();
            session.setAttribute("visitstart", visitStart.getTime());

        %>

        <%@include file="/helper/ResultDisplay.jsp" %>
        
        	<h1>New Record</h1>
			<br>
			<h3>Appointment Information</h3>

            <table border="1">
            	<thead>
            		<tr>
            			<th>ID</th><th>Doctor</th><th>Patient</th><th>Staff</th> <th>Appointment Start</th><th>Appointment End</th><th>Status</th>
            		</tr>
            	</thead>
            	<tbody>
            	</tbody>
                <tr>
                    <td>a</td><td>a</td><td>a</td><td>a</td><td>a</td><td>a</td><td>a</td>
                </tr>
            </table>
            
            <br>

            
            <h3>Visit Information</h3>

        <form action="newRecordRequest.jsp" method="POST">
        
        
        		Diagnosis:
        		<br>
        	    <textarea name="diagnosis" rows="8" cols="60"></textarea>
                <br>
                <br>
        
        		Prescriptions:
        		<br>
        	    <textarea name="prescriptions" rows="8" cols="60"></textarea>
                
                <br>
                <br>
                
                Scheduling of Treatment:
        		<br>
        	    <textarea name="treatment" rows="8" cols="60"></textarea>
                
                <br>
                <br>
                
                <input type="submit"/>

        </form>

    </body>
</html>
