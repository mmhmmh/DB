<%-- 
    Document   : addUserRequest
    Created on : Mar 30, 2012, 12:40:43 AM
    Author     : Administrator
--%>
<%@page import="user.UserManager"%>
<%

    String fName = request.getParameter("fname");
    String lName = request.getParameter("lname");
    int role = Integer.parseInt( request.getParameter("role"));
    String email = request.getParameter("username");
    String password = request.getParameter("password");
    String rpassword = request.getParameter("rpassword");




    if (fName == "" || lName == "" || role == "" || email == "" || password == "" || rpassword == "") {
        //invalid input
        response.sendRedirect("addUser.jsp");
        return;
    }


    if (!password.equals(rpassword)) {
        //password mismatch
    } else {
        //success
        UserManager.addUser(fName, lName, role, email, password);
    }


%>