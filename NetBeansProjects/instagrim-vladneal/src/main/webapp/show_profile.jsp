<%-- 
    Document   : show_profile
    Created on : 13-Oct-2014, 16:52:24
    Author     : Vladislavs Ignatjevs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.UserStore" %>
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
        <h2>Your Information</h2>
            <%
                UserStore userStore = (UserStore) request.getAttribute("store");
                String login = userStore.getUsername();
                String email = userStore.getEmail();
                String fullname = userStore.getFullname();
                String location = userStore.getLocation();
            %>
        <ul>    
            <li>Username: <%=login%></li>
            <li>Email address: <%=email%></li>
            <li>Full name is: <%=fullname%></li>
            <li>Location: <%=location%></li>       
        </ul>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
                <li><a href="/Instagrim/Logout">Logout</a></li>
                <li>&COPY; Vladislavs Ignatjevs</li>
            </ul>
        </footer>
    </body>
</html>