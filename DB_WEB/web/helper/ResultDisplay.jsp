<%

String error;
String success;

try {
    success = (String)session.getAttribute("Success");
    session.setAttribute("Success", "");
    if (success == null) {
        success = "";
    }
} catch (Exception e) {
    success = "";
}

try {
    error = (String)session.getAttribute("Error");
    session.setAttribute("Error", "");
    if (error == null) {
        error = "";
    }
} catch (Exception e) {
    error = "";
}

if (!error.equals("")) {
    %>
    <div class="errormessage" style="color: red;"><%=error%></div>
    <%
}

if (!success.equals("")) {
    %>
    <div class="successmessage" style="color: green;"><%=success%></div>
    <%
}

%>