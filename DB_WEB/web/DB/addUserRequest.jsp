<%-- 
    Document   : addUserRequest
    Created on : Mar 30, 2012, 12:40:43 AM
    Author     : Administrator
--%>
<%@page import="user.UserManager"%>
<%

    String fName = request.getParameter("fname");
    String lName = request.getParameter("lname");
    String role = request.getParameter("role");
    String email = request.getParameter("username");
    String password = request.getParameter("password");
    String rPassword = request.getParameter("rpassword");

    
    UserManager.addUser(fName,lName,role,email,password,rPassword);
    
    
%>