<%@page import="helpers.PatientHelper"%>
<%@page import="helpers.DoctorHelper"%>
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
    int staffId = ((Integer) session.getAttribute("userid")).intValue();
    int doctorId = Integer.parseInt(request.getParameter("doclist"));

    List<UserWithInfo> patList = DoctorHelper.getAllPatientsForDoctor(doctorId);

    Appointment ca = (Appointment) session.getAttribute("conflictappointment");
    session.setAttribute("conflictappointment", null);

    Appointment a = new Appointment();
    a.setDoctorId(doctorId);

    session.setAttribute("appointment", a);


    String patListContent = "";


    patListContent = "<select name=\"patlist\">";
    for (int i = 0; i < patList.size(); i++) {
        patListContent = patListContent
                + String.format("<option value=\"%d\">%s</option>",
                patList.get(i).getId(), patList.get(i).getUsername());
    }
    patListContent = patListContent + "</select>";


    UserWithInfo u;



    u = UserHelper.findUserWithInfo(doctorId);
    String doctor = u.getUsername();


    DateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
    String timestart;
    String timeend;
    boolean[] timeSlot;

    timeend = format.format(new Date());
    timestart = format.format(new Date());
    timeSlot = AppointmentHelper.getAvailableTime(doctorId, (new Date()).getTime(), (new Date()).getTime());

    DateFormat dateformat = new SimpleDateFormat("MM/dd/yyyy");
    String slotDateContent = dateformat.format(new Date());
    
    if (ca != null) {
        timestart = format.format(ca.getStartTime());
        timeend = format.format(ca.getEndTime());
        slotDateContent = dateformat.format(ca.getStartTime());
        timeSlot = AppointmentHelper.getAvailableTime(doctorId, ca.getStartTime(), ca.getEndTime());
    }


    
    
    
    String timeSlotContent = "";

    String s[] = new String[4];
    for (int i = 0; i < timeSlot.length; i = i + 4) {

        for (int j = 0; j < 4; j++) {

            s[j] = (timeSlot[i + j]) ? "<td bgcolor=\"#00FF00\">A</td>" : "<td bgcolor=\"#FF0000\">O</td>";

        }

        timeSlotContent = timeSlotContent + String.format(
                "<tr><td>%d</td>%s%s%s%s</tr>",
                i / 4, s[0], s[1], s[2], s[3]);
    }
%>


<h1> New Appointment </h1>

<%@include file="/helper/ResultDisplay.jsp" %>
<br>


<form action="newAppointmentRequest.jsp">

    <table>

        <tr>
            <td>Patient:</td>
            <td><%=patListContent%></td>
            <td><a href="/staff/editPatient.jsp">Add Patient</a> </td>
        </tr>

        <tr>
            <td>Doctor:</td>
            <td><%=doctor%></td>
            <td><a href="/staff/selectDoctor.jsp">Change Doctor</a> </td>
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

    <input type="submit" value="Create"/>

</form>

<h3>Available Time Slots</h3>
A = Avaliable<br>
O = Occupied<br>

<br>
<%=slotDateContent%>
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