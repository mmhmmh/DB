<%-- 
    Document   : changePasswordRequest
    Created on : Mar 30, 2012, 6:02:11 PM
    Author     : Administrator
--%>

<%@page import="helpers.LoginHelper"%>
<%
    String username = (String)session.getAttribute("username");
    String oldpassword = request.getParameter("oldpassword");
    String newpassword = request.getParameter("newpassword");
    String repassword = request.getParameter("repassword");
    
    
    if (newpassword != repassword)
    {
        //error password mismatch 
        response.sendRedirect("changePassword.jsp");
    }
    
    if(LoginHelper.updatePassword(username, oldpassword, newpassword)){
        //success
        response.sendRedirect("changePassword.jsp");
        
    }else{
        //failed
        response.sendRedirect("changePassword.jsp");
    }
    
%>
