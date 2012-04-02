<%@page import="helpers.DoctorHelper"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="model.PatientInfo"%>
<%@page import="model.SinInfo"%>
<%@page import="helpers.PatientHelper"%>
<%@page import="model.Patient"%>
<%@include file="/helper/Header.jsp"%>

<%
    int patientId = ((Integer)session.getAttribute("userid")).intValue();
    
    Patient p = PatientHelper.getPatientById(patientId);
    
    
%>

<%
    
    SinInfo si = p.getSi();
    PatientInfo pi = p.getPi();
    
    session.setAttribute("patientEdit", p);

%>

<h1>Edit My Info</h1>

<%@include file="/helper/ResultDisplay.jsp" %>

<form method="POST" action="editPatientRequest.jsp">

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
        <label for="phone">Phone:</label> <input
            type="text" name="phone" id="phone" value="<%=pi.getPhone()%>" />
    </div>

    <input type="submit" value="Submit"/>

</form>
        
        
<%@include file="/helper/Footer.jsp" %>