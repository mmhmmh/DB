<HTML>
    <HEAD>
        <TITLE>Login using jsp</TITLE>
    </HEAD>

    <BODY>
        <H1>LOGIN FORM</H1>
        <%
        String myname =  (String)session.getAttribute("username");
       
        if(myname!=null)
            {
             out.println("Welcome  "+myname+"  , <a href=\"logout.jsp\" >Logout</a>");
            }
        else 
            {
            %>
            <form action="checkLogin.jsp">
                <table>
                    <tr>
                        <td> Username  : </td><td> <input name="username" size=15 type="text" /> </td> 
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
        
    </BODY>
</HTML> 