<%@page import="helpers.DoctorHelper"%>
<%@page import="model.UserWithInfo"%>
<%@page import="java.util.List"%>
<%@page import="helpers.AppointmentHelper"%>
<%@page import="helpers.UserHelper"%>
<%@page import="java.util.Date"%>
<%@page import="model.Appointment"%>
<%
    if (request.getParameter("sch").equals("Search")){
        String input = request.getParameter("keyword").trim();
        if (input == null || input == "") {
            session.setAttribute("Error", "Please provide a keyword");
            response.sendRedirect("index.jsp");
        }
        int doctorId = ((Integer) session.getAttribute("userid")).intValue();
        List<UserWithInfo> patients = DoctorHelper.findAllPatientsByDoctorAndSearch(doctorId, input);
        System.out.printf("query"+input+" done");
        session.setAttribute ("filteredPatients", patients);
        response.sendRedirect("index.jsp");
               
    }else if(request.getParameter("sch").equals("Show All")){
        session.removeAttribute("filteredPatients");
        response.sendRedirect("index.jsp");
    }


    
%>