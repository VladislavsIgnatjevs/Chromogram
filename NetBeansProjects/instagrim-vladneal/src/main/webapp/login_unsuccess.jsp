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
        <title>Not logged in</title>
    </head>
    <body>
        <h1>Not logged in. Please check username/password.</h1> 
        

            
            
        
        
        <h2>Click <a href="/Instagrim/login.jsp">here</a> to try again</h2>
        
        
        <%
            Pic ps = new Pic();
            LoggedIn lg = new LoggedIn();
           
            %>
    </body>
</html>
