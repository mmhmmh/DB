<%-- 
    Document   : newRecordRequest
    Created on : Mar 31, 2012, 9:17:59 AM
    Author     : Administrator
--%>

<%@page import="helpers.RecordHelper"%>
<%@page import="java.util.Date"%>
<%@page import="model.Record"%>
<%@page import="model.Appointment"%>
<%


    Appointment a =  (Appointment)session.getAttribute("appointment");
    Date visitStart =  (Date)session.getAttribute("visitstart");
    Date visitEnd =new Date();


    String diagnosis = request.getParameter("diagnosis");
    String prescriptions = request.getParameter("prescriptions");
    String treatment = request.getParameter("treatment");

    Record record = new Record();
    record.setAppointmentId(a.getAppointmentId());
 
    RecordHelper.saveRecord(record);
    
 //   0,a.getAppointmentId(), visitStart.getTime()
  //          ,visitEnd.getTime(),a.getStaffId(),a.getDoctorId(),a.getStaffId()
   //         ,diagnosis,prescriptions,treatment,0
    
    
    session.setAttribute("record", record);
%>
