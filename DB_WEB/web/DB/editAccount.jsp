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
%>

<%@include file="/helper/Header.jsp"%>
        <h3>Edit Account</h3>
<%@include file="/helper/Footer.jsp"%>