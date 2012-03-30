<%-- 
    Document   : index
    Created on : Mar 30, 2012, 1:33:58 AM
    Author     : Administrator
--%>

<%@page import="helpers.DoctorHelper"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.java.swing.plaf.windows.WindowsBorders.DashedBorder"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Appointment"%>
<%@page import="helpers.AppointmentHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Page</title>
    </head>
    <body>

        <%

            String myname = (String) session.getAttribute("username");
            int userid = ((Integer) session.getAttribute("userid")).intValue();
            userid = 7;
            Appointment a = AppointmentHelper.getNextAppointment(userid);
            
            
            int doctid =  a.getDoctorId();
            String doctname = DoctorHelper.getName(doctid);
            
            
            DateFormat format = new SimpleDateFormat("MM/dd/YYYY HH:mm");
            String timestart = format.format(new Date(a.getStartTime()));

            String timeend = format.format(new Date(a.getEndTime()));
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
                            <td>Doctor Name</td> <td>Appointment Time</td><td>End Time</td>
                        </tr>
                        <tr>
                            <td><%=doctname%></td> <td><%=timestart%></td> <td><%=timeend%></td>
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
                            <td>Record ID</td><td>Doctor Name</td><td>Appointment Time</td><td>Prescription</td><td>Diagnoses</td>

                        </tr>
                        <tr>
                            <td>a</td><td>a</td><td>a</td><td>a</td><td>a</td>

                        </tr>
                    </table>
                </td>

            <tr >

                <td align="right">
                    <a href="">All Record</a>
                    <a href="">Search Record</a>
                </td>
            </tr>


        </tr>


    </table>




</body>
</html>
