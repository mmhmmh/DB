<%-- 
    Document   : newRecordRequest
    Created on : Mar 31, 2012, 9:17:59 AM
    Author     : Administrator
--%>

<%@page import="model.Appointment"%>
<%


    Appointment a =  (Appointment)session.getAttribute("appointment");
    

    String diagnoses = request.getParameter("diagnoses");
    String diagnoses = request.getParameter("prescriptions");
    String diagnoses = request.getParameter("treatment");








%>
