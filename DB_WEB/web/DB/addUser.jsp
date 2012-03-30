<%-- 
    Document   : addUserjsp
    Created on : Mar 30, 2012, 12:35:25 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
    </head>
    <body>
        <H1>New User</H1>
        <form action="addUserRequest.jsp" method="POST">


            <table>

                <tr>
                    <td>First Name:</td><td><input name="fname" size=15 type="text" /></td>
                </tr>


                <tr>
                    <td>Last Name:</td><td><input name="lname" size=15 type="text" /></td>
                </tr>

                <tr>

                    <td> Role: </td>
                    <td>
                        <select name="role"> 
                            <option value="1">Patient</option>
                            <option value="2">Doctor</option>
                            <option value="3">Staff</option>
                            <option value="4">Finance</option>
                        </select> 
                    </td> 

                </tr>

                <tr>
                    <td> Email  : </td>
                    <td> <input name="username" size=15 type="text" /> </td> 
                </tr>
                <tr>
                    <td> Password  : </td>
                    <td> <input name="password" size=15 type="password" /> </td> 
                </tr> 
                <tr>  
                    <td>Retype Password  : </td>
                    <td> <input name="rpassword" size=15 type="password" /> </td> 
                </tr>
            </table>

            <br>
            <br>

            <input type="submit" value="Register" />



        </form>


    </body>
</html>
