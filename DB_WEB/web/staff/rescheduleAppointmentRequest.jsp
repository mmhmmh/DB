
<%@page import="model.Appointment"%>
<%@page import="helpers.AppointmentHelper"%>
<%@page import="sun.security.util.Resources_zh_TW"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
    Appointment a = (Appointment) session.getAttribute("appointment");


    DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");

    Date appStart;
    Date appEnd;

    try {

        appStart = format.parse(request.getParameter("appstart"));
        appEnd = format.parse(request.getParameter("append"));

        a.setAppiontmentStatus( "scheduled");
        a.setStartTime(appStart.getTime());
        a.setEndTime(appEnd.getTime());
        
        AppointmentHelper.updateAppointment(a);
        
        session.setAttribute("Success", "Appointment Updated Successfully");
        response.sendRedirect(String.format("rescheduleAppointment.jsp?appointmentid=%d",a.getAppointmentId()));
        return;

    } catch (Exception e) {
        //error parsing date
        session.setAttribute("Error", "Appointment Update Failed");
        response.sendRedirect(String.format("rescheduleAppointment.jsp?appointmentid=%d",a.getAppointmentId()));
        return;
    }



%>