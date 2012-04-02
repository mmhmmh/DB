<%@page import="model.UserWithInfo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="helpers.DoctorHelper"%>
<%@page import="model.Record"%>
<%@page import="java.util.List"%>
<%@page import="helpers.RecordHelper"%>
<%@include file="/helper/Header.jsp"%>

<h3>All Patient Visiting Records</h3>
    <form action="recordSearchRequest.jsp">
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
            <th>Record ID</th>
            <th>Patient ID</th>
            <th>Patient Name</th>
            <th>Patient Email</th>
            <th>Date of Visit</th>
            <th>Diagnoses</th>
            <th>Prescription</th>
            <th>Schedule of Treatment</th>
            <th>Comment</th>
        </tr>
    </thead>
     <tbody>
        <%  
            HashMap<Record,UserWithInfo> recordList = new HashMap<Record,UserWithInfo>();
            if (session.getAttribute("filteredRecords") == (null)){
                    int doctorId = ((Integer) session.getAttribute("userid")).intValue();
                    HashMap<Record,UserWithInfo> allrecords = RecordHelper.getAllRecordsForDoctor(doctorId);
                    if (allrecords.isEmpty()){
        %>
        <div>There are no records</div>
        <%
                    }else{
                        recordList = allrecords;
                    }
                }else{
                HashMap<Record,UserWithInfo> frecords = (HashMap<Record,UserWithInfo>) session.getAttribute("filteredRecords");
                    if(frecords.isEmpty()){
                        session.removeAttribute("filteredRecords");
        %>
        <tr>
        <td>No matching record</td>
        </tr>
        <%
                    }else{
                        recordList = frecords;
                        session.removeAttribute("filteredRecords");
                    }
                }
            int patientId = 0;
            String pName = "";
            String pEmail = "";
            int recordId=0;
            String visitDate = "";
            String diagnosis = "";
            String schedulingOfTreatment = "";
            String prescriptions = "";
            String comment = "";
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            for (Record r:recordList.keySet()) {
                UserWithInfo u = recordList.get(r);
                patientId = ((Integer) u.getId()).intValue();
                pName = u.getfName() + " " +  u.getlName();
                pEmail = u.getUsername();

                recordId = r.getRecordId();

                visitDate = format.format(new Date(r.getVisitStart()));
                diagnosis = r.getDiagnosis();
                prescriptions = r.getPrescriptions();
                schedulingOfTreatment = r.getSchedulingOfTreatment();
                comment = r.getComment();
        %>
        <td><%=recordId%></td>
        <td><%=patientId%></td>
        <td><%=pName%></td>
        <td><%=pEmail%></td>
        <td><%=visitDate%></td>
        <td><%=diagnosis%></td>
        <td><%=prescriptions%></td>
        <td><%=schedulingOfTreatment%></td>
        <td><%=comment%></td>
    </tbody>
    <%
        }
    %>

</table>
<br>

<INPUT type="button" value="Back    " onClick="location.href='/doctor/index.jsp'">
<%@include file="/helper/Footer.jsp" %>