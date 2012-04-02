<%@page import="helpers.AppointmentHelper"%>
<%@page import="helpers.RecordHelper"%>
<%@page import="java.util.Date"%>
<%@page import="model.Record"%>
<%@page import="model.Appointment"%>
<%
    Appointment a = (Appointment) session.getAttribute("appointment");
    Date visitStart = (Date) session.getAttribute("visitstart");
    Date visitEnd = new Date();


    String diagnosis = request.getParameter("diagnosis");
    String prescriptions = request.getParameter("prescriptions");
    String treatment = request.getParameter("treatment");
    String comment = request.getParameter("comment");

    Record record = new Record();
    record.setCreatedBy(a.getDoctorId());
    record.setAppointmentId(a.getAppointmentId());
    record.setDiagnosis(diagnosis);
    record.setPrescriptions(prescriptions);
    record.setSchedulingOfTreatment(treatment);
    record.setVisitStart(visitStart.getTime());
    record.setVisitEnd(visitEnd.getTime());
    record.setComment(comment);




    //session.setAttribute ("record", record);

    try {
        RecordHelper.saveRecord(record);

        session.setAttribute("Success","Record Created Successfully");
        response.sendRedirect("index.jsp");
        
        //update appointment info
        a.setAppiontmentStatus("finished");
        AppointmentHelper.updateAppointment(a);

        return;
    } catch (Exception e) {
        //error
        session.setAttribute("Error", "Record Creationg Failed");
        response.sendRedirect("index.jsp");
        return;
    }
%>