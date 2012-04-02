<%-- 
    Document   : recordsearch
    Created on : Mar 30, 2012, 2:04:32 PM
    Author     : Administrator
--%>


<%@page import="model.UserWithInfo"%>
<%@page import="helpers.UserHelper"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="helpers.DoctorHelper"%>
<%@page import="model.Record"%>
<%@page import="java.util.List"%>
<%@page import="helpers.RecordHelper"%>
<%@include file="/helper/Header.jsp"%>

<%
    int patientId = 0;
    try {
        patientId = Integer.parseInt(request.getParameter("patient_id"));
    } catch (Exception e) {
        
    }
    if (patientId == 0) {
        response.sendRedirect("/DB/login.jsp");
        return;
    }
    
    UserWithInfo info = UserHelper.findUserWithInfo(patientId);
    List<Record> recordList = RecordHelper.getAllRecords(patientId);
    String recordContent = "";

    int recordId;
    String doctorName;

    for (int i = 0; i < recordList.size(); i++) {
        Record r = recordList.get(i);


        recordId = r.getRecordId();
        doctorName = DoctorHelper.getName(r.getDoctorId());

        DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
        String visitstart = format.format(new Date(r.getVisitStart()));
        String visitend = format.format(new Date(r.getVisitEnd()));


        String tmpRecord = String.format("<tr><td>%s</td><td>%d</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><tr>"
                , r.getRecordId(), r.getAppointmentId(),visitstart, visitend, r.getDiagnosis(), r.getPrescriptions(),r.getSchedulingOfTreatment());

        recordContent = recordContent + tmpRecord;
    }
%>


<h3>Full Record History For <%=info.getUsername()%></h3>


<table border="1">
    <thead>
        <tr>
            <th>Record ID</th><th>Appointment ID</th><th>Visit Start</th>
            <th>Visit End</th><th>Prescription</th><th>Diagnoses</th><th>Schedule of Treatment</th>
        </tr>
    </thead>
    <tbody>

        <%=recordContent%>
    </tbody>
</table>

<%@include file="/helper/Footer.jsp" %>