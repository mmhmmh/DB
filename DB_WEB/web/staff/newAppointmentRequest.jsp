<%-- 
    Document   : newAppointmentRequest
    Created on : Mar 30, 2012, 6:59:16 PM
    Author     : Administrator
--%>

<%@page import="model.Appointment"%>
<%@page import="helpers.AppointmentHelper"%>
<%@page import="sun.security.util.Resources_zh_TW"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
    int staffId = ((Integer) session.getAttribute("userid")).intValue();
    int patientId = Integer.parseInt(request.getParameter("patlist"));
    int doctorId = Integer.parseInt(request.getParameter("doclist"));



    DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");

    Date appStart;
    Date appEnd;

    try {

        appStart = format.parse(request.getParameter("appstart"));
        appEnd = format.parse(request.getParameter("append"));

        Appointment a = new Appointment();

        a.setAppiontmentStatus( "scheduled");
        a.setDoctorId(doctorId);
        a.setStaffId(staffId);
        a.setPatientId(patientId);
        a.setStartTime(appStart.getTime());
        a.setEndTime(appEnd.getTime());
        
        AppointmentHelper.addAppointment(a);
        
        response.sendRedirect("newAppointment.jsp");
        return;

    } catch (Exception e) {
        //error parsing date
        response.sendRedirect("newAppointment.jsp");
        return;
    }



%>