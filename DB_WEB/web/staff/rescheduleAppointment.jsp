<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="helpers.UserHelper"%>
<%@page import="model.UserWithInfo"%>
<%@page import="model.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="helpers.AppointmentHelper"%>

<%@include file="/helper/Header.jsp"%>

<%@include file="/staff/sublinks.jsp"%>



<%
    int appointmentid = Integer.parseInt(request.getParameter("appointmentid"));

    List<Appointment> al = AppointmentHelper.getAllFutureAppointments();
    Appointment a = new Appointment();
    for (int i = 0; i < al.size(); i++) {

        a = al.get(i);

        if (a.getAppointmentId() == appointmentid) {
            break;
        }
    }
    
    session.setAttribute("appointment", a);
    
    UserWithInfo u;
    
    u = UserHelper.findUserWithInfo(a.getPatientId());
    String patient = u.getfName() + " " + u.getlName();
    
    u = UserHelper.findUserWithInfo(a.getDoctorId());
    String doctor = u.getfName() + " " + u.getlName();
    
    
    DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
    String timestart = format.format(new Date(a.getStartTime()));
    
    String timeend = format.format(new Date(a.getEndTime()));

    boolean [] timeSlot = AppointmentHelper.getAvailableTime(a.getDoctorId(), a.getStartTime(), a.getEndTime());
    String timeSlotContent="";
    
    String s [] = new String[4];
    for (int i=0;i<timeSlot.length;i=i+4){

      for (int j=0;j<4;j++){

         s[j]=(timeSlot[i+j])?"<td bgcolor=\"#00FF00\">A</td>":"<td bgcolor=\"#FF0000\">O</td>";
          
      }
        
      timeSlotContent = timeSlotContent + String.format(
              "<tr><td>%d</td>%s%s%s%s</tr>", 
              i/4,s[0],s[1],s[2],s[3]);
    }
%>


<h1> Reschedule Appointment </h1>

<%@include file="/helper/ResultDisplay.jsp" %>
<br>


<form action="rescheduleAppointmentRequest.jsp">

    <table>

        <tr>
            <td>Patient:</td>
            <td><%=patient%></td>
        </tr>

        <tr>
            <td>Doctor:</td>
            <td><%=doctor%></td>
        </tr>

        <tr>
            <td>Appointment Start:</td> <td><input type="text" name="appstart" value="<%=timestart%>"></td> <td>( mm/dd/yyyy hh:mm )</td>

        </tr>


        <tr>
            <td>Appointment End:</td> <td><input type="text" name="append" value="<%=timeend%>"> </td> <td>( mm/dd/yyyy hh:mm )</td>
        </tr>        

    </table>

    <br>
    <br>

    <input type="submit" value="Reschedule"/>

</form>
      
<h3>Available Time Slots</h3>
A = Avaliable<br>
O = Occupied<br>
<table border="1">
    <thead>
    <tr>
        <th>Hour</th><th>0 Min</th><th>15 Min</th><th>30 Min</th><th>45 Min</th>
    </tr>
    </thead>
    <tbody>
        <%=timeSlotContent%>
    </tbody>
    
    
</table>

<%@include file="/helper/Footer.jsp" %>