<%-- 
    Document   : newRecord
    Created on : Mar 31, 2012, 9:17:48 AM
    Author     : Administrator
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="helpers.UserHelper"%>
<%@page import="helpers.DoctorHelper"%>
<%@page import="model.UserWithInfo"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.ALOAD"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="model.Appointment"%>
<%@page import="helpers.AppointmentHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/helper/Header.jsp"%>
<%
    int doctorId = ((Integer) session.getAttribute("userid")).intValue();

    List<Appointment> al = AppointmentHelper.getFutureAppointments(doctorId);

    session.setAttribute("appointmentlist", al);
%>

    
<div id='doctor_appointments'>
    <h3>Future Appointment</h3>

    <table border="1">
        <thead>
            <tr>
                <th>Appointment ID</th><th>Doctor</th><th>Patient</th><th>Staff</th> <th>Appointment Start</th><th>Appointment End</th><th>Action</th>
            </tr>
        </thead>
        <tbody
        <%
            for (int i = 0; i < al.size(); i++) {
                Appointment a = al.get(i);
                int appointmentID = a.getAppointmentId();
                UserWithInfo u = UserHelper.findUserWithInfo(a.getDoctorId());
                String docName = u.getfName() + ' ' + u.getlName();

                    u = UserHelper.findUserWithInfo(a.getStaffId());
                String staffName = u.getfName() + ' ' + u.getlName();

                    u = UserHelper.findUserWithInfo(a.getPatientId());
                String patName = u.getfName() + ' ' + u.getlName();

                DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
                String timestart = format.format(new Date(a.getStartTime()));
                String timeend = format.format(new Date(a.getEndTime()));

                String actionLink = String.format("<a href=\"newRecord.jsp?appointmentlist=%d\">Start Visit</a>", i);
            %>
            <tr>
                        <td><%=appointmentID%></td>
                        <td><%=docName%></td>
                        <td><%=patName%></td>
                        <td><%=staffName%></td>
                        <td><%=timestart%></td>
                        <td><%=timeend%></td>
                        <td><%=actionLink%></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<div id='my_patients'>
    <h3>My Patients</h3>
    <form action="patientSearchRequest.jsp">
        <div>
            <input type="text" name="keyword">
            <input type="submit" name="sch" value="Search">
            <INPUT type="submit" name="sch" value="Show All">
        </div>
        <%@include file="/helper/ResultDisplay.jsp" %>
    </form>
    
    <table border="1">
        <thead>
            <tr>
                <th>Patient ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody
        <%
          List<UserWithInfo> patients = new LinkedList<UserWithInfo>(); 
         if (session.getAttribute("filteredPatients") == (null)){
            int myID = ((Integer) session.getAttribute("userid")).intValue();
            List<UserWithInfo> allpatients =  DoctorHelper.getAllPatientsForDoctor(myID);
            if (allpatients.isEmpty()){
        %>
          <tr>
                <td>You do have any patients</td>
          </tr>
        <%
            }else{
                patients = allpatients;
            }
         }else{
              List<UserWithInfo> fpatients = ( List<UserWithInfo>) session.getAttribute("filteredPatients");
              if (fpatients.isEmpty()){
        %>
        <tr>
        <td>No matching patient</td>
        </tr>
        <%
              }else{
                  patients = fpatients;
                  session.removeAttribute("filteredPatients");
              }
         
         }
              
                String patientfName="";
                String patientlName="";
                String patientEmail ="";
                int patientID = 0;
                String lastvDate="";
                for(int i = 0; i < patients.size(); i++){
                    UserWithInfo patient = patients.get(i);
                    patientID = patient.getId();
                    patientEmail = patient.getUsername();
                    patientfName = patient.getfName();
                    patientlName = patient.getlName();
         %>
            <tr>
                <td><%=patientID%></td>
                <td><%=patientfName%></td>
                <td><%=patientlName%></td>
                <td><%=patientEmail%></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
     
            
                
                
                
<%@include file="/helper/Footer.jsp" %>
