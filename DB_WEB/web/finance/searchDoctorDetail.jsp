<%@page import="model.Record"%>
<%@page import="java.util.List"%>
<%@page import="helpers.RecordHelper"%>
<%@page import="helpers.DoctorHelper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="helpers.FinanceHelper"%>
<%@include file="/helper/Header.jsp"%>




<%
    int doctorId = 0;
    
    String doctorIdString = request.getParameter("doctor_id");
    
    try {
        doctorId = Integer.parseInt(doctorIdString);
    } catch (Exception e) {
        System.out.print(e.getMessage());
    }
 
    if (doctorId == 0) {
        response.sendRedirect("index.jsp");
        return;
    }        
    
    String doctorName = DoctorHelper.getName(doctorId);
    String start = (String)request.getParameter("appstart");
    String end = (String)request.getParameter("append");
    
    DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
%>

<div><h2>Doctor <%=doctorName%> Detail</h2></div>

<% if (start == null || end == null) {%>

<div><h3>Search By Time</h3></div>
<form action="searchDoctorDetail.jsp">
    <table>
        <tr>
            <td>Appointment Start:</td> <td><input type="text" name="appstart"></td> <td>( mm/dd/yyyy hh:mm )</td>
        </tr>

        <tr>
            <td>Appointment End:</td> <td><input type="text" name="append"> </td> <td>( mm/dd/yyyy hh:mm )</td>
        </tr>  
        
        <input name="doctor_id" value="<%=doctorIdString%>" type="hidden" />
    </table>
    <br/>
    <input type="submit" value="Search"/>
</form>
<%} else {%>

<%    
Date appStart = format.parse(start);
Date appEnd = format.parse(end);
HashMap<Integer,Integer> list = FinanceHelper.findPatientsAndVisits(doctorId, appStart, appEnd);
String patient_id = request.getParameter("patient_id");
if (patient_id == null) {
    
%>

<table>
        <thead>
            <tr>
                <th>Patient ID</th>
                <th>Number of Times Seen</th>
                <th>&nbsp;</th>
            </tr>
        </thead>
        
        <tbody>
            <% 
            for(Integer u : list.keySet()) { 
            %>
            <tr>
                <td style="text-align: center"><%=u%></td>
                <td style="text-align: center"><%=list.get(u)%></td>
                <td><a href="searchDoctorDetail.jsp?doctor_id=<%=doctorId%>&patient_id=<%=u%>&appstart=<%=start%>&append=<%=end%>">search</a></td>
            </tr>
            <% } %>
        </tbody>
            
    </table>
    
<%} else {
    int patientId = Integer.parseInt(patient_id);
    List<Record> recordList = RecordHelper.getAllRecordsForPatientAndDoctor(patientId, doctorId, appStart, appEnd);
    String recordContent = "";
            
            int recordId;

            for (int i = 0; i < recordList.size(); i++) {
                Record r = recordList.get(i);


                recordId = r.getRecordId();
                doctorName = DoctorHelper.getName(r.getDoctorId());

                String visitstart = format.format(new Date(r.getVisitStart()));
                String visitend = format.format(new Date(r.getVisitEnd()));


                String tmpRecord = String.format("<tr><td>%s</td><td>%d</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><tr>"
                        , r.getRecordId(), r.getAppointmentId(),visitstart, visitend, r.getDiagnosis(), r.getPrescriptions(),r.getSchedulingOfTreatment());

                recordContent = recordContent + tmpRecord;
            }    
%>

        <h3>Visit History</h3>
    
        <table border="1">
        	<tr>
                    <th>Record ID</th><th>Appointment ID</th><th>Visit Start</th>
                    <th>Visit End</th><th>Prescription</th><th>Diagnoses</th><th>Schedule of Treatment</th>
        	</tr>
        	
                <%=recordContent%>
          </table>

<%}%>
<%}%>
<%@include file="/helper/Footer.jsp" %>