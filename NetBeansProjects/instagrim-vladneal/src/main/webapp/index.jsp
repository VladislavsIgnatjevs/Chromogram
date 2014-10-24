<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Vladislavs Ignatjevs
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Chromogram</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header>
            <h1>Chromogram</h1>
            <h2>Explore the world of apochromatic effects</h2>
        </header>
        <nav>
            <ul>

               

                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                                <li><% out.println("Welcome back, " + lg.getUsername());%></li>
                                <li><a href="upload.jsp">Upload Pictures</a></li>
                                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                                <li><a href="/Instagrim/update_profile.jsp">Update Profile</a></li>
                                <li><a href="/Instagrim/Profile/<%=lg.getUsername()%>">Show Profile</a></li>
                                <li><a href="/Instagrim/Logout">Logout</a></li>
                                <li><a href="/Instagrim/delete_account.jsp">Delete Account</a></li>



                    <%}
                            }else{
                                %>
                 <li><a href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                <%
                                        
                            
                    }%>
            </ul>
        </nav>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
                <li>&COPY; Vladislavs Ignatjevs</li>
            </ul>
        </footer>
    </body>
</html>
