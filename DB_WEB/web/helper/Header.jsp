<%@page import="helpers.RoleHelper"%>
<%@page import="helpers.RoleHelper.Role"%>
<html>
<head>
<link rel="stylesheet" href="/DB/default.css" type="text/css">
<title>ECE456</title>

<script>

</script>

</head>

<body>

<%
String username = (String)session.getAttribute("username");
RoleHelper.Role role = Role.Unknown;
if (username != null && !username.equals("")) {
role = RoleHelper.getUserRole(username);
%>
<div style="float:right;margin-right:10px;margin-top:10px;font-size:1.1em;font-weight: bold;color: #0E0E11;">
    Welcome <%=username%>!</div>
<%
}
%>    
<div id="container">
<%
if (role == Role.Doctor){
%>

<ul>
<li><a href="/doctor/index.jsp">Home</a></li>
<li><a href="/doctor/records.jsp">My Patients</a></li>
<li><a href="/doctor/enableDoctorPermission.jsp">Patient Record Permission</a></li>
<li><a href="/DB/myAccount.jsp">My Account</a></li>
<li><a href="/DB/logout.jsp">Logout</a></li>
</ul> 

<%} else if (role == Role.Patient) {%>
<ul>
<li><a href="/patient/index.jsp">Home</a></li>
<li><a href="/patient/records.jsp">My Visit Records</a></li>
<li><a href="/patient/editPatient.jsp">My Account</a></li>
<li><a href="/DB/logout.jsp">Logout</a></li>
</ul> 
<%} else if (role == Role.Finance) {%>
<ul>
<li><a href="/finance/index.jsp">Home</a></li>
<li><a href="/DB/myAccount.jsp">My Account</a></li>
<li><a href="/DB/logout.jsp">Logout</a></li>
</ul> 

<%} else if (role == Role.Staff) {%>
<ul>
<li><a href="/staff/index.jsp">Home</a></li>
<li><a href="/staff/selectPatient.jsp">Patients Records</a></li>
<li><a href="/DB/myAccount.jsp">My Account</a></li>
<li><a href="/DB/logout.jsp">Logout</a></li>
</ul> 
<%}%>