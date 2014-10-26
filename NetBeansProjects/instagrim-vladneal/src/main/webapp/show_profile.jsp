<%-- 
    Document   : show_profile
    Created on : 13-Oct-2014, 16:52:24
    Author     : Vladislavs Ignatjevs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@ page import = "uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts" %>
<%@ page import = "com.datastax.driver.core.Cluster" %>
<!DOCTYPE html>
<html>
    <head>
         <!-- pretty font -->
         <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Open+Sans:300' rel='stylesheet' type='text/css'> 
                
        <title>Chromogram</title>
        <link rel="stylesheet" type="text/css" href="demo.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
   
    <body>
        <header>
            <img src="/Instagrim/img/chromologofin.jpg">
            <h3>explore the world of apochromatic effects</h3>
        </header>
        <nav><ul><li><a href="/Instagrim/">Home</a></li></ul></nav>
        
        
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
                <li>&COPY; Vladislavs Ignatjevs</li>
            </ul>
        </footer>
    </body>
</html>