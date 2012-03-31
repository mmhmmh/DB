

<%@page import="helpers.RoleHelper"%>
<%@page import="helpers.RoleHelper.*"%>
<%@page import="helpers.LoginHelper"%>
<%

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    String loginUsername = (String)request.getAttribute("username");

    int userid = LoginHelper.getUserId(username);
    
    if (loginUsername != null && !loginUsername.equals("")) {
        Role role = RoleHelper.getUserRole(username);
        if (role == Role.Doctor) {
            response.sendRedirect("../doctor/index.jsp");
            return;
        } else if (role == Role.Patient) {
            response.sendRedirect("../patient/index.jsp");
            return;
        } else if (role == Role.Staff) {
            response.sendRedirect("../staff/index.jsp");
            return;
        } else if (role == Role.Finance) {
            response.sendRedirect("../finance/index.jsp");
            return;
        }
    }
    
    if (username == null || password == null) {
        session.setAttribute("Error", "Invalid password and/or username");
        response.sendRedirect("login.jsp");
    }

    // Here you put the check on the username and password
    if (LoginHelper.validPassword(username, password)) {
        Role role = RoleHelper.getUserRole(username);
        
        session.setAttribute("username", username);
        session.setAttribute("userid", new Integer(userid));
        
        if (role == Role.Doctor) {
            response.sendRedirect("../doctor/index.jsp");
        } else if (role == Role.Patient) {
            response.sendRedirect("../patient/index.jsp");
        } else if (role == Role.Staff) {
            response.sendRedirect("../staff/index.jsp");
        } else if (role == Role.Finance) {
            response.sendRedirect("../finance/index.jsp");
        } else {
            session.setAttribute("Error", "Unknown user");
            response.sendRedirect("login.jsp");
        }
        return;
    } else {
        session.setAttribute("Error", "Invalid password and/or username");
        response.sendRedirect("login.jsp");
        return;
    }%>