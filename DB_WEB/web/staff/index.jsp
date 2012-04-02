<%-- 
    Document   : index
    Created on : Mar 31, 2012, 11:45:39 AM
    Author     : Administrator
--%>

<%@page import="helpers.AppointmentHelper"%>
<%@page import="java.util.List"%>
<%@page import="model.Appointment"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="helpers.UserHelper"%>
<%@page import="model.UserWithInfo"%>
<%@include file="/helper/Header.jsp"%>
<%
    List<Appointment> al = AppointmentHelper.getAllFutureAppointments();

    String appInfoContent = "";


    for (int i = 0; i < al.size(); i++) {
        Appointment a = al.get(i);

        UserWithInfo u;

        u = UserHelper.findUserWithInfo(a.getDoctorId());
        String docName = u.getfName() + ' ' + u.getlName();

        u = UserHelper.findUserWithInfo(a.getStaffId());
        String staffName = u.getfName() + ' ' + u.getlName();

        u = UserHelper.findUserWithInfo(a.getPatientId());
        String patName = u.getfName() + ' ' + u.getlName();

        DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
        String timestart = format.format(new Date(a.getStartTime()));
        String timeend = format.format(new Date(a.getEndTime()));


        String deleteLink = String.format("<a href=\"deleteAppointmentRequest.jsp?appointmentid=%d\">Delete</a>", a.getAppointmentId());
        String rescheduleLink = String.format("<a href=\"rescheduleAppointment.jsp?appointmentid=%d\">Reschedule</a>", a.getAppointmentId());
        String actionStr = deleteLink + "&nbsp;&nbsp;&nbsp;&nbsp;" + rescheduleLink;

        appInfoContent = appInfoContent + String.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
                a.getAppointmentId(), docName, patName, staffName, timestart, timeend, actionStr);

    }

%>




<h1>Appointment Management</h1>

<%@include file="/helper/ResultDisplay.jsp" %>

<br>
<input type="button" value="Create Appointment" onClick="location.href='selectDoctor.jsp'">

<br>
<br>

<table border="1">
    <thead>
        <tr>
            <th>ID</th><th>Doctor</th><th>Patient</th><th>Staff</th> <th>Appointment Start</th><th>Appointment End</th><th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%=appInfoContent%>



</tbody>
</table>


<%@include file="/helper/Footer.jsp" %>