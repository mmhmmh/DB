<%-- 
    Document   : newRecord
    Created on : Mar 31, 2012, 9:17:48 AM
    Author     : Administrator
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="helpers.UserHelper"%>
<%@page import="model.UserWithInfo"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.ALOAD"%>
<%@page import="java.util.List"%>
<%@page import="model.Appointment"%>
<%@page import="helpers.AppointmentHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/helper/Header.jsp"%>
        <%
            int doctorId = ((Integer) session.getAttribute("userid")).intValue();

            List<Appointment> al = AppointmentHelper.getFutureAppointments(doctorId);

            String appointmentListContent = "";
            String actionLink;
            Appointment a;
            UserWithInfo u;
            for (int i = 0; i < al.size(); i++) {
                a = al.get(i);

                u = UserHelper.findUserWithInfo(a.getDoctorId());
                String docName = u.getfName() + ' ' + u.getlName();

                u = UserHelper.findUserWithInfo(a.getStaffId());
                String staffName = u.getfName() + ' ' + u.getlName();

                u = UserHelper.findUserWithInfo(a.getPatientId());
                String patName = u.getfName() + ' ' + u.getlName();

                DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
                String timestart = format.format(new Date(a.getStartTime()));
                String timeend = format.format(new Date(a.getEndTime()));

                actionLink = String.format("<a href=\"newRecord.jsp?appointmentlist=%d\">Start Visit</a>", i);


                appointmentListContent = appointmentListContent
                        + String.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
                        a.getAppointmentId(), docName, patName, staffName, timestart, timeend, actionLink);
            }

            session.setAttribute("appointmentlist", al);
        %>

        <%@include file="/helper/ResultDisplay.jsp" %>

        <h3>Future Appointment</h3>

        <table border="1">
            <thead>
                <tr>
                    <th>ID</th><th>Doctor</th><th>Patient</th><th>Staff</th> <th>Appointment Start</th><th>Appointment End</th><th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%=appointmentListContent%>
            </tbody>
            <tr>

            </tr>
        </table>
                
                
                
<%@include file="/helper/Footer.jsp" %>
