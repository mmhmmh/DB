<%-- 
    Document   : newAppointment
    Created on : 28-Mar-2012, 2:05:00 PM
    Author     : Michael

    Purpose:  make an appointment
    User: Staff
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Appointment Page</title>
    </head>
    <body>
    
    	<h2>Create New Appointment</h2>
    	<br>
    	
    	
    	<form action="newAppintmentRequest.jsp" method="post">
        
        <table>
        
        	<tr>
                    <td>User:</td>
                    <td><select name="userlist">
                            <option>zz</option>
                            <option>xxx</option>
                        </select>
                    </td>
                    <td><a href="../DB/addUser.jsp">Create User</a> </td>
        	</tr>
        	
        	<tr>
                    <td>Doctor:</td>
                    <td><select name="userlist">
                            <option>zz</option>
                            <option>xxx</option>
                        </select>
                    </td>
        	</tr>
        	
        	<tr>
                    <td>Appointment Start:</td> <td><input type="text"></td> <td>( mm/dd/yyyy-hh:mm )</td>

        	</tr>
        	
        	
        	<tr>
                    <td>Appointment End:</td> <td><input type="text"> </td> <td>( mm/dd/yyyy-hh:mm )</td>
        	</tr>        
        	
        
        
        
        </table>
        
        <br>
        <br>
        
        <input type="submit" value="Create"
        
        </form>
        
        
    </body>
</html>
