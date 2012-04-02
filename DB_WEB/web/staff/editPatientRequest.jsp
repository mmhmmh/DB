

<%@page import="sun.print.PSPrinterJob"%>
<%@page import="helpers.PatientHelper"%>
<%@page import="model.Patient"%>
<%

    Patient p = (Patient)session.getAttribute("patientEdit");
    
    
    
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String fName = request.getParameter("firstname");
    String lName = request.getParameter("lastname");
    String sin = request.getParameter("sin");
    String address1 = request.getParameter("address1");    
    String address2 = request.getParameter("address2");
    String city = request.getParameter("city");
    String postcode = request.getParameter("postcode");
    String province = request.getParameter("province");
    String healthcard = request.getParameter("healthcard");
    String phone = request.getParameter("phone");
    String doctor = request.getParameter("doctor");
    
    String currentHealth = request.getParameter("currenthealth");
    
    if (p.getId() == 0) {
        if (email == null || password == null || email.equals("") || password.equals("")) {
            session.setAttribute("Error", "Invalid email or password");
            response.sendRedirect("editPatient.jsp");
            return;
        }
        p.setUsername(email);
    }
    
    
    
    if (password != null && !password.equals("")) {
        p.setPassword(password);
    }
    
    if (fName != null && !fName.equals("")) {
        p.setfName(fName);
    }
    
    if (lName != null && !lName.equals("")) {
        p.setlName(lName);
    }
    
    p.setRole(1);
    
    if (sin != null && !sin.equals("")) {
        try {
            p.getSi().setSin(Integer.parseInt(sin));
        } catch (Exception e) {
            
        }
    }
    
    if (address1 != null && !address1.equals("")) {
        p.getSi().setAddress1(address1);
    }
    
    if (address2 != null && !address2.equals("")) {
        p.getSi().setAddress2(address2);
    }
    
    if (city != null && !city.equals("")) {
        p.getSi().setCity(city);
    }
    
    if (postcode != null && !postcode.equals("")) {
        p.getSi().setPostCode(postcode);
    }  
    if (province != null && !province.equals("")) {
        p.getSi().setProvince(province);
    }

    if (doctor != null && !doctor.equals("")) {
        p.getPi().setDefaultDoctor(Integer.parseInt(doctor));
    }
    if (healthcard != null && !healthcard.equals("")) {
        p.getPi().setHealthCard(Integer.parseInt(healthcard));
    }
    
    if (healthcard != null && !healthcard.equals("")) {
        p.setHealthCard(Integer.parseInt(healthcard));
        p.getPi().setHealthCard(Integer.parseInt(healthcard));
    }
    
    p.getPi().setIsActive(1);
    
    if (phone != null && !phone.equals("")) {
        p.getPi().setPhone(phone);
    }
    if (sin != null && !sin.equals("")) {
        p.getPi().setSocialInsurance(Integer.parseInt(sin));
    }
    
    if (currentHealth != null && !currentHealth.equals("")) {
        p.setCurrentHealth(currentHealth);
    }
    
    PatientHelper.addAndUpdatePatient(p);
    
    session.setAttribute("patientEdit", null);
    if (p.getId() == 0) {
        session.setAttribute("Success", "Successfully added patient");
        response.sendRedirect("newAppointment.jsp");
    } else {
        session.setAttribute("Success", "Successfully updated patient");
        response.sendRedirect("editPatient.jsp?patient_id="+p.getId());
    }
    
%>