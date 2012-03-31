<%-- 
    Document   : myAccount
    Created on : 28-Mar-2012, 1:21:49 PM
    Author     : Michael

    Purpose:  review address, phone, etc
    User: Patient
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password Page</title>
    </head>
    <body>
        <h3>Change Password</h3>
        
        
        <form action="changePasswordRequest.jsp" method="POST">
        <table>
        	

        	<tr>
        		<td>Old Password:</td><td><input type="text" name="oldpassword" type="password"/></td>
        	</tr>
<tr><td>&nbsp;&nbsp;</td></tr>


        	<tr>
        		<td>New Password:</td><td><input type="text" name="newpassword" type="password"/></td>
        	</tr>
        	
        	<tr>
        		<td>Retype Password:</td><td><input type="text" name="repassword" type="password"/></td>
        	</tr>
        	
        	

        </table>
        
        <br>
        
        
        <input type="submit" value="Submit" />
        
        </form>
 
        
        
    </body>
</html>



