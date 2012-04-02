<%@page import="helpers.DoctorPatientHelper"%>
<%@page import="model.UserWithInfo"%>
<%@page import="helpers.DoctorHelper"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@include file="/helper/Header.jsp"%>

<%
int patientId = 0;
String patientIdString = request.getParameter("patient_id");
try {
    patientId = Integer.parseInt(patientIdString);
} catch (Exception e) {
}

int doctorId = ((Integer)session.getAttribute("userid")).intValue();





if (patientId == 0) {
    
List<UserWithInfo> patList = DoctorHelper.getAllPatientsForDoctor(doctorId);

String patListContent;

patListContent = "<select name=\"patient_id\">";
for (int i = 0; i < patList.size(); i++) {
    patListContent = patListContent
            + String.format("<option value=\"%d\">%s</option>",
            patList.get(i).getId(), patList.get(i).getUsername());
}

patListContent = patListContent + "</select>";

%>
<form method="GET" action="enableDoctorPermission.jsp">
<div>Select a patient: <%=patListContent%> </div>
<input type="submit"  name="submit" value="Select">
</form>
<%} else {
List<User> docListForPatient = DoctorPatientHelper.getAllDoctorsForPatient(patientId);

List<User> docList = DoctorHelper.getAllDoctors();

docList.removeAll(docListForPatient);

String existingDocs = "";
for (User u:docListForPatient) {
    existingDocs += "<div>" + u.getUsername() + "&nbsp;&nbsp;<a href='revokeDoctorPermission?patient_id=" + patientId + "&doctor_id=" + u.getId() + "'>revoke</a></div>";

}
if (existingDocs.equals("")) {
    existingDocs = "<div>None</div>";
}

String docListContent;

docListContent = "<select name=\"doctor_id\">";
for (int i = 0; i < docList.size(); i++) {
    if (docList.get(i).getId() == doctorId) {
        continue;
    }
    docListContent = docListContent
            + String.format("<option value=\"%d\">%s</option>",
            docList.get(i).getId(), docList.get(i).getUsername());
}
docListContent = docListContent + "</select>";

%>

<div>
    <div>Existing Doctor With Permission</div>
    <%=existingDocs%>
</div>
<form method="GET" action="addDoctorPermission.jsp">
    
    <div>
        <div>Grant Doctor With Permission</div>
        <div>Select a doctor <%=docListContent%> </div>
    </div>
    <input type="hidden" name="patient_id" value="<%=patientId%>"/>
    <input type="submit"  name="submit" value="Update">
</form>


<%}%>
<%@include file="/helper/Footer.jsp" %>

