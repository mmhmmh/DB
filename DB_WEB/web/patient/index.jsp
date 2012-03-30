<%-- 
    Document   : index
    Created on : Mar 30, 2012, 1:33:58 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Page</title>
    </head>
    <body>
        
        <%
        String myname =  (String)session.getAttribute("username");
        %>

        <table>
            <tr>
                <td>
                    <a href="../DB/myAccount.jsp">My Account</a>
                    <br>
                    <br>

                </td>
            </tr>

            <tr>
                <td><h3> Next Appointment:</h3>

                    <table border="1">
                        <tr border="1">
                            <td>Doctor Name</td> <td>Appointment Time</td><td>Duratin</td>
                        </tr>
                        <tr>
                            <td>zhima</td> <td>10:00 am</td> <td>1 h</td>

                        </tr>
                    </table>

                </td>

            </tr>

            <tr>
                <td>
                    <br>
                    <h3>Record History</h3>

                    <table border="1">
                        <tr>
                            <td>Record ID</td><td>Doctor Name</td><td>Appointment Time</td><td>Prescription</td>

                        </tr>
                        <tr>
                            <td>a</td><td>a</td><td>a</td><td>a</td>

                        </tr>



                    </table>

                </td>

            <tr align="right"><td><a href="">more</a></td></tr>


        </tr>


    </table>




</body>
</html>
