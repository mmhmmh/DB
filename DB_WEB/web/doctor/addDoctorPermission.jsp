<%@page import="helpers.DoctorPatientHelper"%>
<%
int patientId = 0;
int doctorId = 0;
try {
    patientId = Integer.parseInt(request.getParameter("patient_id"));
    doctorId = Integer.parseInt(request.getParameter("doctor_id"));
} catch (Exception e) {
    
}
DoctorPatientHelper.grantPermission(doctorId, patientId);
response.sendRedirect("enableDoctorPermission.jsp?patient_id=" + patientId);
return;
%>