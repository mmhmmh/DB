<%@page import="model.UserWithInfo"%>
<%@page import="helpers.UserHelper"%>
<%@page import="helpers.PatientHelper"%>
<%@page import="javax.sound.midi.Patch"%>
<%@page import="helpers.DoctorHelper"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Appointment"%>
<%@page import="helpers.AppointmentHelper"%>
<%@include file="/helper/Header.jsp"%>

<%@include file="/doctor/sublinks.jsp"%>

        <%
            int doctorId = ((Integer) session.getAttribute("userid")).intValue();
            
            int appId = Integer.parseInt((String)request.getParameter("appointmentlist"));
            
            List<Appointment> al = (List<Appointment>) session.getAttribute("appointmentlist");
            Appointment a = al.get(appId);
            
            //update appointmet;
            //a.setAppiontmentStatus("started");
            //AppointmentHelper.updateAppointment(a);
            
            session.setAttribute("appointment", a);
            
            Date visitStart = new Date();
            session.setAttribute("visitstart",visitStart);

            UserWithInfo u;

            u = UserHelper.findUserWithInfo(a.getDoctorId());
            String docName = u.getfName() + ' ' + u.getlName();

            u = UserHelper.findUserWithInfo(a.getStaffId());
            String staffName = u.getfName() + ' ' + u.getlName();

            u = UserHelper.findUserWithInfo(a.getPatientId());
            String patName = u.getfName() + ' ' + u.getlName();
            
            DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
            String timestart = format.format(new Date(a.getStartTime()));
            String timeend =  format.format(new Date(a.getEndTime()));


            String appInfoContent = String.format("<td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>", 
                    a.getAppointmentId(),docName,patName,staffName,timestart,timeend);
            
            
        %>

        <%@include file="/helper/ResultDisplay.jsp" %>

        <h1>New Record</h1>
        <br>
        <h3>Appointment Information</h3>

        <table border="1">
            <thead>
                <tr>
                    <th>ID</th><th>Doctor</th><th>Patient</th><th>Staff</th> <th>Appointment Start</th><th>Appointment End</th>
                </tr>
            </thead>
            <tbody>
                <%=appInfoContent%>
            </tbody>
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
<%@include file="/helper/Footer.jsp" %>
