<%-- 
    Document   : index
    Created on : Mar 30, 2012, 1:33:58 AM
    Author     : Administrator
--%>

<%@page import="helpers.RecordHelper"%>
<%@page import="helpers.DoctorHelper"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.java.swing.plaf.windows.WindowsBorders.DashedBorder"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Appointment"%>
<%@page import="helpers.AppointmentHelper"%>
<%@include file="/helper/Header.jsp"%>


        <%

            String myname = (String) session.getAttribute("username");
            int userid = ((Integer) session.getAttribute("userid")).intValue();

            String appContent = "";

            Appointment a = AppointmentHelper.getNextAppointment(userid);


            if (a == null) {
                appContent = "Not future appointment not avialable";
            } else {


                int doctid = a.getDoctorId();
                String doctname = DoctorHelper.getName(doctid);


                DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
                String timestart = format.format(new Date(a.getStartTime()));

                String timeend = format.format(new Date(a.getEndTime()));
                
                 appContent="<table border=\"1\"><tr><td>Doctor Name</td> <td>Appointment Time</td><td>End Time</td></tr>";

                 appContent =appContent + String.format("<tr><td>%s</td> <td>%s</td><td>%s</td></tr><table>"
                        ,doctname, timestart,timeend);
            }


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

                            <%=appContent%>

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

            <tr>

                <td align="right">
                    <a href="records.jsp">All Record</a>
                    <a href="">Search Record</a>
                </td>
            </tr>

    </table>

<%@include file="/helper/Footer.jsp" %>