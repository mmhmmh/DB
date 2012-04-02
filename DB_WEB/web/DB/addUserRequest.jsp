<%-- 
    Document   : addUserRequest
    Created on : Mar 30, 2012, 12:40:43 AM
    Author     : Administrator
--%>
<%@page import="helpers.UserHelper"%>
<%@page import="model.UserWithInfo"%>
<%

    String fName = request.getParameter("fname");
    String lName = request.getParameter("lname");
    int role = Integer.parseInt( request.getParameter("role"));
    String email = request.getParameter("username");
    String password = request.getParameter("password");
    String rpassword = request.getParameter("rpassword");




    if (fName == "" || lName == ""  || email == "" || password == "" || rpassword == "") {
        //invalid input
        response.sendRedirect("addUser.jsp");
        return;
    }


    if (!password.equals(rpassword)) {
        //password mismatch
    } else {
        UserWithInfo newUser = new UserWithInfo();
        newUser.setPassword(password);
        newUser.setUsername(email);
        newUser.setfName(fName);
        newUser.setlName(lName);
        newUser.setRole(role);
        //success
        UserHelper.addUser(newUser);
    }

    response.sendRedirect("addUser.jsp");
    return;
%>