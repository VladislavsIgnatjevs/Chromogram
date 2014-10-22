<%-- 
    Document   : register_success
    Created on : Sep 29, 2014, 9:16:48 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration was successful</title>
    </head>
    <body>
        <h1>Registration was successful.</h1> 
        <h2>Click "Back" to return to main page and login</h2>
        
        <a href="/Instagrim">Back</a>
        <%
            Pic ps = new Pic();
            LoggedIn lg = new LoggedIn();
           
            %>
    </body>
</html>
