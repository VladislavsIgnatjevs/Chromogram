<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
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
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chromogram</title>
        <link rel="stylesheet" type="text/css" href="demo.css" />

    </head>
    <body>
        <header>
            <img src="/Instagrim/img/chromologofin.jpg">
            <h3>explore the world of apochromatic effects</h3>
        </header>
        <nav>
        </nav>

        <article>
            <h3>Login</h3>
            <form method="POST"  action="Login">
                <ul>
                    <li>User Name <input type="text" name="username"></li>
                    <li>Password <input type="password" name="password"></li>
                </ul>
                <br/>
                <input type="submit" value="Login"> 
            </form>

        </article>
        <footer>
            <ul>
                <li>&COPY; Vladislavs Ignatjevs</li>
            </ul>
        </footer>
    </body>
</html>
