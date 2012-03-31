<html>
<head>
<title>ECE456</title>

<script>

</script>

</head>

<body>

<%
String username = (String)session.getAttribute("username");
if (username != null && !username.equals("")) {
%>
<div style="float:right">
Welcome <%=username%>! <a>Logout</a></div>
<%
}
%>    
<div id="container" style="float:left">
