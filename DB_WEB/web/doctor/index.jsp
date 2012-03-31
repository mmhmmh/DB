<%-- 
    Document   : newRecord
    Created on : Mar 31, 2012, 9:17:48 AM
    Author     : Administrator
--%>

<%@page import="java.util.List"%>
<%@page import="model.Appointment"%>
<%@page import="helpers.AppointmentHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int doctorId = ((Integer) session.getAttribute("userid")).intValue();

            List<Appointment> a = AppointmentHelper.getFutureAppointments(doctorId);

            String appointmentListContent = "<select name=\"appointmentlist\" >";
            for (int i = 0; i < a.size() ; i++) {
                appointmentListContent=appointmentListContent
                        + String.format("<option>%d</option>",a.get(i).getAppointmentId());
            }
            appointmentListContent = appointmentListContent + "</select>";

            session.setAttribute("appointment", a);
        %>
        <h3>Future Appointment</h3>
        <form action="newRecord.jsp">
            <table>
                <tr>
                    <td>Appointment ID:</td>
                    <td><%=appointmentListContent%></td>
                    <td><input type="submit" value="Start Appointment" /></td>
                </tr>
            </table>
        </form>
                    
                    
                    


    </body>
</html>
