<%-- 
    Document   : recordsearch
    Created on : Mar 30, 2012, 2:04:32 PM
    Author     : Administrator
--%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="helpers.DoctorHelper"%>
<%@page import="model.Record"%>
<%@page import="java.util.List"%>
<%@page import="helpers.RecordHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Record Page</title>
    </head>
    <body>
        
        <%
            int userId = ((Integer)session.getAttribute("userid")).intValue();
            List<Record> recordList = RecordHelper.getAllRecords(userId);
            
            
            String recordContent = "";
            
            int recordId;
            String doctorName;

            for (int i=0;i<recordList.size();i++)
            {
                Record r = recordList.get(i);
                
                
                recordId = r.getRecordId();
                doctorName = DoctorHelper.getName(r.getDoctorId());
                
                DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
                String visitstart = format.format(new Date(r.getVisitStart()));
                String visitend = format.format(new Date(r.getVisitEnd()));
                
                
                String tmpRecord= String.format("<td>%s</td><td>%d</td><td>&s</td><td>&s</td><td>%s</td><td>%s</td>"
                        ,doctorName,recordId,visitstart,visitend,r.getDiagnosis(),r.getPrescriptions());
                
                recordContent = recordContent + tmpRecord;
            }
        %>
        
        
        <h3>Full Record History</h3>
        
        
        <table border="1">
        	
        	<tr>
                    <td>Record ID</td><td>Doctor Name</td><td>Visit Start</td>
                    <td>Visit End</td><td>Prescription</td><td>Diagnoses</td>
        	</tr>
        	
        	<tr>
                    <%=recordContent%>
        	</tr>
          </table>
        
    </body>
</html>
