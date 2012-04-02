<%@page import="helpers.RecordHelper"%>
<%@page import="model.UserWithInfo"%>
<%@page import="model.Record"%>
<%@page import="java.util.HashMap"%>
<%@page import="helpers.AppointmentHelper"%>
<%@page import="helpers.UserHelper"%>
<%@page import="java.util.Date"%>
<%@page import="model.Appointment"%>
<%
    if (request.getParameter("sch").equals("Search")){
        String input = request.getParameter("keyword").trim();
        if (input == null || input == "") {
            session.setAttribute("Error", "Please provide a keyword");
            response.sendRedirect("records.jsp");
        }else{
            int doctorId = ((Integer) session.getAttribute("userid")).intValue();
            HashMap<Record,UserWithInfo> records = RecordHelper.searchRecordsForDoctor(doctorId, input);

            session.setAttribute ("filteredRecords", records);
            response.sendRedirect("records.jsp");
        } 
    }else if(request.getParameter("sch").equals("Show All")){
        session.removeAttribute("filteredPatients");
        response.sendRedirect("records.jsp");
    }


    
%>