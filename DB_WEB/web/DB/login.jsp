<%@include file="/helper/Header.jsp"%>
<%@page import="helpers.RoleHelper"%>
<%@page import="helpers.RoleHelper.Role"%>
<h1>LOGIN FORM</h1>
<%
String myname =  (String)session.getAttribute("username");

if(myname!=null && !myname.equals(""))
    {
        RoleHelper.Role role = RoleHelper.getUserRole(myname);

        if (role == Role.Doctor) {
            response.sendRedirect("../doctor/index.jsp");
        } else if (role == Role.Patient) {
            response.sendRedirect("../patient/index.jsp");
        } else if (role == Role.Staff) {
            response.sendRedirect("../staff/index.jsp");
        } else if (role == Role.Finance) {
            response.sendRedirect("../finance/index.jsp");
        } else {
            session.setAttribute("username", "");
            response.sendRedirect("login.jsp");
        }
    }
else 
    {
    %>

    <%@include file="/helper/ResultDisplay.jsp" %>

    <form action="checkLogin.jsp">
        <table>
            <tr>
                <td> Email  : </td><td> <input name="username" size=15 type="text" /> </td> 
            </tr>
            <tr>
                <td> Password  : </td><td> <input name="password" size=15 type="password" /> </td> 
            </tr>
        </table>
        <input type="submit" value="login" />
    </form>
    <% 
    }


    %>
        
<%@include file="/helper/Footer.jsp" %>
