<%@page import="helpers.DoctorHelper"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="model.PatientInfo"%>
<%@page import="model.SinInfo"%>
<%@page import="helpers.PatientHelper"%>
<%@page import="model.Patient"%>
<%@include file="/helper/Header.jsp"%>

<%
    String idString = request.getParameter("patient_id");
    
    Patient p;
    
    int patientId = 0;

    try {
        patientId = Integer.parseInt(idString);
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    }
    
    List<User> docList = DoctorHelper.getAllDoctors();

    String docListContent;

    docListContent = "<select name=\"doctor\">";
    for (int i = 0; i < docList.size(); i++) {
        docListContent = docListContent
                + String.format("<option value=\"%d\">%s</option>",
                docList.get(i).getId(), docList.get(i).getUsername());
    }
    docListContent = docListContent + "</select>";

    
%>

<%

    if (patientId == 0) {
        p = new Patient();
    } else {
        p = PatientHelper.getPatientById(patientId);
    }
    
    SinInfo si = p.getSi();
    PatientInfo pi = p.getPi();
    
    session.setAttribute("patientEdit", p);

%>

<%
    if (patientId == 0) {
%>
<h1>Create Patient</h1>
<%} else {
%>
<h1>Edit Patient</h1>
<%}%>

<%@include file="/helper/ResultDisplay.jsp" %>

<form method="POST" action="editPatientRequest.jsp">

    <div class="row">
        <label for="email">Email:</label> <input
            type="text" name="email" id="email" value="<%=p.getUsername()%>" />
    </div>

    <div class="row">
        <label for="password">Password:</label> <input
            type="text" name="password" id="password" value="" />
    </div>

    <div class="row">
        <label for="firstname">First Name:</label> <input
            type="text" name="firstname" id="firstname" value="<%=p.getfName()%>" />
    </div>

    <div class="row">
        <label for="lastname">Last Name:</label> <input
            type="text" name="lastname" id="lastname" value="<%=p.getlName()%>" />
    </div>

    <div class="row">
        <label for="sin">SIN:</label> <input
            type="text" name="sin" id="sin" value="<%=si.getSin()%>" />
    </div>

    <div class="row">
        <label for="address1">Address1:</label> <input
            type="text" name="address1" id="address1" value="<%=si.getAddress1()%>" />
    </div>

    <div class="row">
        <label for="address2">Address2:</label> <input
            type="text" name="address2" id="address2" value="<%=si.getAddress2()%>" />
    </div>

    <div class="row">
        <label for="city">City:</label> <input
            type="text" name="city" id="city" value="<%=si.getCity()%>" />
    </div>

    <div class="row">
        <label for="postcode">Postcode:</label> <input
            type="text" name="postcode" id="postcode" value="<%=si.getPostCode()%>" />
    </div>

    <div class="row">
        <label for="province">Province:</label> <input
            type="text" name="province" id="province" value="<%=si.getProvince()%>" />
    </div>

    <div class="row">
        <label for="healthcard">Health Card:</label> <input
            type="text" name="healthcard" id="healthcard" value="<%=pi.getHealthCard()%>" />
    </div>
    
    <div class="row">
        <label for="currenthealth">Current Health:</label> <input
            type="text" name="currenthealth" id="currenthealth" value="<%=p.getCurrentHealth()%>" />
    </div>

    <div class="row">
        <label for="phone">Phone:</label> <input
            type="text" name="phone" id="phone" value="<%=pi.getPhone()%>" />
    </div>

    <div class="row">
        <label for="doctor">Doctor:</label> <%=docListContent%>
    </div>
    
    <input type="submit" value="Submit"/>

</form>
        
        
<%@include file="/helper/Footer.jsp" %>