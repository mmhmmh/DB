<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="helpers.DoctorHelper"%>
<%@include file="/helper/Header.jsp"%>

<div><h2>Doctor List</h2></div>


<%
List<User> doctorList = DoctorHelper.getAllDoctors();
%>

<div> 
    <table>
        <thead>
            <tr>
                <th>Doctor Name</th>
                <th>Doctor ID</th>
                <th>&nbsp;</th>
            </tr>
        </thead>
        
        <tbody>
            <% 
            for(User u : doctorList) { 
            %>
            <tr>
                <td><%=u.getUsername()%></td>
                <td><%=u.getId()%></td>
                <td><a href="searchDoctorDetail.jsp?doctor_id=<%=u.getId()%>">search</a></td>
            </tr>
            <% } %>
        </tbody>
            
    </table>
</div>

<%@include file="/helper/Footer.jsp" %>