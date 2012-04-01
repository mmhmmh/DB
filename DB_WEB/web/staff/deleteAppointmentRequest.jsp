<%@page import="model.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="helpers.AppointmentHelper"%>
<%
int appointmentid = Integer.parseInt(request.getParameter("appointmentid"));

List<Appointment> al = AppointmentHelper.getAllFutureAppointments();

for (int i=0;i<al.size();i++){
    Appointment a = al.get(i);
    
    if (a.getAppointmentId()==appointmentid){
        
        a.setAppiontmentStatus("discarded");
        
        AppointmentHelper.updateAppointment(a);
        
        session.setAttribute("Success", "Appontment Deleted Successfully");
        response.sendRedirect("/staff/index.jsp");
        return;
        
    }
    
}

session.setAttribute("Error", "Appontment Not Found");
response.sendRedirect("/staff/index.jsp");
        return;       
        %>