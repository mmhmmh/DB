<%@page import="helpers.PatientHelper"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@include file="/helper/Header.jsp"%>


<%
    List<User> patList = PatientHelper.getAllPatients();

    String patListContent = "";

    patListContent = "<select name=\"patient_id\">";
    for (int i = 0; i < patList.size(); i++) {
        patListContent = patListContent
                + String.format("<option value=\"%d\">%s</option>",
                patList.get(i).getId(), patList.get(i).getUsername());
    }
    patListContent = patListContent + "</select>";
%>

<div><h2>Select a Patient</h2></div>
<div>
    <form action="records.jsp" method="GET">
        Select:&nbsp;<%=patListContent%> <input type="submit" value="Go">
    </form>
</div>
<%@include file="/helper/Footer.jsp"%>
