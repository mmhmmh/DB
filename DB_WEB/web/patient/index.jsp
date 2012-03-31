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
            List<Record> rcd= RecordHelper.getRecentRecords(userid, 10);
            

            if (a == null) {
                appContent = "Not future appointment not avialable";
            } else {


                int doctid = a.getDoctorId();
                String doctname = DoctorHelper.getName(doctid);

                DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
                String timestart = format.format(new Date(a.getStartTime()));

                String timeend = format.format(new Date(a.getEndTime()));
                
                 appContent="<table border=\"1\"><tr><td>Doctor Name</td> <td>Appointment Time</td><td>End Time</td></tr>";

                 appContent =appContent + String.format("<tr><td>%s</td> <td>%s</td><td>%s</td></tr><table>"
                        ,doctname, timestart,timeend);
            }


        %>

        
            <a href="../DB/myAccount.jsp">My Account</a>
 
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
                                String diag = "";
                                String prescriptions ="";
                                int recordId = 0;
                                String visitstart = "";
                                String docname="";
                                
                                for (Record record : rcd){
                                     diag = record.getDiagnosis();
                                     prescriptions = record.getPrescriptions();
                                     recordId = record.getRecordId();
                                    
                                    DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
                                     visitstart = format.format(new Date(record.getVisitStart()));
                                    
                                    int doctorId = record.getDoctorId();
                                    UserWithInfo doctor = UserHelper.findUserWithInfo(doctorId);
                                     docname = doctor.getfName() + " " + doctor.getlName();
                        %>
                        <tr>
                            <td><%=recordId%></td>
                            <td><%=docname%></td>
                            <td><%=visitstart%></td>
                            <td><%=prescriptions%></td>
                            <td><%=diag%></td>
                        </tr>
                                    
                        <%
                                }
                            }
                        %>

                        
                    </table>
                    <a href="records.jsp">All Record</a>
                    <a href="">Search Record</a>

<%@include file="/helper/Footer.jsp" %>