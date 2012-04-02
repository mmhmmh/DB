<%-- 
    Document   : selectPatient
    Created on : Apr 2, 2012, 3:02:59 AM
    Author     : Administrator
--%>

<%@page import="helpers.DoctorHelper"%>
<%@page import="helpers.PatientHelper"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@include file="/helper/Header.jsp"%>

<%
    List<User> docList = DoctorHelper.getAllDoctors();

    String docListContent;


    docListContent = "<select name=\"doclist\">";
    for (int i = 0; i < docList.size(); i++) {
        docListContent = docListContent
                + String.format("<option value=\"%d\">%s</option>",
                docList.get(i).getId(), docList.get(i).getUsername());
    }
    docListContent = docListContent + "</select>";

%>

<form action="newAppointment.jsp">
    
    <h3>Select a Doctor</h3>
    
    <%=docListContent%>
    
    <input type="submit" value="Next" />
    
</form>
            




<%@include file="/helper/Footer.jsp" %>