<%@page import="model.PatientInfo"%>
<%@page import="model.UserWithInfo"%>
<%@page import="model.Patient"%>
<%@page import="helpers.UserHelper"%>
<%@page import="helpers.RoleHelper"%>
<%@page import="helpers.PatientHelper"%>
<%
    int userid = ((Integer) session.getAttribute("userid")).intValue();
    UserWithInfo myinfo = UserHelper.findUserWithInfo(userid);
    Enum roleid = RoleHelper.getRoleFromInt(myinfo.getRole());
    if (RoleHelper.Role.Patient==roleid) {
        response.sendRedirect("/patient/editPatient.jsp");
    }      
    session.setAttribute("patientEdit", myinfo);

%>

<%@include file="/helper/Header.jsp"%>

<h3>Edit My Account</h3>

<%@include file="/helper/ResultDisplay.jsp" %>

<form method="POST" action="editUserInfoRequest.jsp">

    <div class="row">
        <label for="password">Password:</label> <input
            type="text" name="password" id="password" value="" />
    </div>

    <div class="row">
        <label for="firstname">First Name:</label> <input
            type="text" name="firstname" id="firstname" value="<%=myinfo.getfName()%>" />
    </div>

    <div class="row">
        <label for="lastname">Last Name:</label> <input
            type="text" name="lastname" id="lastname" value="<%=myinfo.getlName()%>" />
    </div>

    <div style="clear:both"/>
    <br/>
    
    <input type="submit" value="Submit"/>

</form>
<%@include file="/helper/Footer.jsp"%>