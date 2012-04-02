<%@page import="helpers.UserHelper"%>
<%@page import="model.UserWithInfo"%>
<%

    UserWithInfo p = (UserWithInfo)session.getAttribute("patientEdit");
    
    String password = request.getParameter("password");
    String fName = request.getParameter("firstname");
    String lName = request.getParameter("lastname");
    
    if (password != null && !password.equals("")) {
        p.setPassword(password);
    }
    
    if (fName != null && !fName.equals("")) {
        p.setfName(fName);
    }
    
    if (lName != null && !lName.equals("")) {
        p.setlName(lName);
    }
    
  
    UserHelper.addUser(p);
    
    session.removeAttribute("patientEdit");
    session.setAttribute("Success", "Successfully updated info");
    response.sendRedirect("editAccount.jsp");
%>