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
    //int doctorId = Integer.parseInt(request.getParameter("doclist"));

    Appointment a =  (Appointment) session.getAttribute("appointment");

    DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");

    Date appStart;
    Date appEnd;

    try {

        appStart = format.parse(request.getParameter("appstart"));
        appEnd = format.parse(request.getParameter("append"));

        

        a.setAppiontmentStatus( "scheduled");
        //a.setDoctorId(doctorId);
        a.setStaffId(staffId);
        a.setPatientId(patientId);
        a.setStartTime(appStart.getTime());
        a.setEndTime(appEnd.getTime());
        
        AppointmentHelper.addAppointment(a);
        
        session.setAttribute("Success", "Appointment Created Successfully");
        response.sendRedirect(String.format("newAppointment.jsp?doclist=%d",a.getDoctorId()));
        return;

    } catch (Exception e) {
        //error parsing date
        session.setAttribute("Error", "Appointment Creation Failed");
        response.sendRedirect(String.format("newAppointment.jsp?doclist=%d",a.getDoctorId()));
        return;
    }



%>