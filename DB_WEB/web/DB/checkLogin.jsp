

<%@page import="helpers.RoleHelper"%>
<%@page import="helpers.RoleHelper.*"%>
<%@page import="helpers.LoginHelper"%>
<%

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    int userid = LoginHelper.getUserId(username);
    
    
    if (username == null || password == null) {
        response.sendRedirect("login.jsp");
    }

    // Here you put the check on the username and password
    if (LoginHelper.validPassword(username, password)) {
        Role role = RoleHelper.getUserRole(username);
        if (role == Role.Doctor) {
            response.sendRedirect("../doctor/index.jsp");
        } else if (role == Role.Patient) {
            response.sendRedirect("../patient/index.jsp");
        } else if (role == Role.Staff) {
            response.sendRedirect("../staff/index.jsp");
        } else if (role == Role.Finance) {
            response.sendRedirect("../finance/index.jsp");
        }
        session.setAttribute("username", username);
        session.setAttribute("userid", new Integer(userid));
    } else {
        session.setAttribute("error", "Invalid password and/or username");
        response.sendRedirect("login.jsp");
    }

%> 