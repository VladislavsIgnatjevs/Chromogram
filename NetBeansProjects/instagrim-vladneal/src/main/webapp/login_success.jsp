<%-- 
    Document   : login_success
    Created on : Sep 29, 2014, 9:16:48 AM
    Author     : Administrator
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged in successfully</title>
    </head>
    <body>
        <h1>Logged in.</h1> 
        <script>alert("Logged in successfully! Welcome ")</script>

            
            
        
        
        <h2>Click <a href="/Instagrim/index.jsp">here</a> to return to main page</h2>
        
        
        <%
            Pic ps = new Pic();
            
            LoggedIn lg = new LoggedIn();
           
            %>
    </body>
</html>
