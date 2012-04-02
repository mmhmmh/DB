<%-- 
    Document   : index
    Created on : Mar 30, 2012, 1:33:58 AM
    Author     : Administrator
--%>

<%@page import="helpers.RecordHelper"%>
<%@page import="helpers.DoctorHelper"%>
<%@page import="helpers.UserHelper"%>
<%@page import="model.Record"%>
<%@page import="model.UserWithInfo"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.java.swing.plaf.windows.WindowsBorders.DashedBorder"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Appointment"%>
<%@page import="java.util.*"%>
<%@page import="helpers.AppointmentHelper"%>
<%@include file="/helper/Header.jsp"%>

        <%

            String myname = (String) session.getAttribute("username");
            int userid = ((Integer) session.getAttribute("userid")).intValue();

            String appContent = "";
            String recordList = "";

            Appointment a = AppointmentHelper.getNextAppointment(userid);
            HashMap<Record, UserWithInfo> rcd= RecordHelper.getRecentRecords(userid, 10);
            
            DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
            if (a == null) {
                appContent = "Not future appointment not avialable";
            } else {


                int doctid = a.getDoctorId();
                String doctname = DoctorHelper.getName(doctid);

                
                String timestart = format.format(new Date(a.getStartTime()));

                String timeend = format.format(new Date(a.getEndTime()));
                
                 appContent="<table border=\"1\"><tr><td>Doctor Name</td> <td>Appointment Time</td><td>End Time</td></tr>";

                 appContent =appContent + String.format("<tr><td>%s</td> <td>%s</td><td>%s</td></tr><table>"
                        ,doctname, timestart,timeend);
            }


        %>
 
                <h3> Next Appointment:</h3>
                <text><%=appContent%></text>


                    <h3>Record History</h3>

                    <table border="1">
                        <tr>
                            <th>Record ID</th>
                            <th>Doctor Name</th>
                            <th>Time of Visit</th>
                            <th>Prescription</th>
                            <th>Diagnoses</th>
                        </tr>
                        <% 
                            if (rcd.isEmpty()){
                        %>
                        <tr><td>no records</td></tr>
                        <%
                            }else{
                                String diagnosis = "";
                                String prescriptions ="";
                                int recordId = 0;
                                String dName="";
                                String visitDate = "";
                                
                                for (Record r:rcd.keySet()) {
                                    UserWithInfo u = rcd.get(r);
                                    dName = u.getfName() + " " +  u.getlName();
                                    recordId = r.getRecordId();
                                    visitDate = format.format(new Date(r.getVisitStart()));
                                    diagnosis = r.getDiagnosis();
                                    prescriptions = r.getPrescriptions();
                            %>  
                        <tr>
                            <td><%=recordId%></td>
                            <td><%=dName%></td>
                            <td><%=visitDate%></td>
                            <td><%=diagnosis%></td>
                            <td><%=prescriptions%></td>
                        </tr>
                                    
                        <%
                                }
                            }
                        %>

                        
                    </table>
                    <a href="records.jsp">All Record</a>

<%@include file="/helper/Footer.jsp" %>