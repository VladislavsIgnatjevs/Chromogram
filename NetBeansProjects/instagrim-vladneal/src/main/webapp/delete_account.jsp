<%-- 
    Document   : delete_account.jsp
    Created on : Tue 21 Oct, 2014, 6:29:51 PM
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
                    <%
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <div id="cssmenu">        
            <ul>
                              
                                <li class='active'><a  href="/Instagrim/">Home</a></li>
                                <li><a href="/Instagrim/upload.jsp">Upload Pictures</a></li>
                                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                                <li><a href="/Instagrim/update_profile.jsp">Update Profile</a></li>
                                <li><a href="/Instagrim/Profile/<%=lg.getUsername()%>">Show Profile</a></li>
                                <li><a href="/Instagrim/Logout">Logout</a></li>
                                <li><a href="/Instagrim/delete_account.jsp">Delete Account</a></li>
                                
                                              
                    <%}
                    } else {
                    %>
                    <%}%>
            </ul>            
            
            
            
        </nav>
       
        <article>
            <br><br/><br>
            <h3>Delete account</h3>
            <form method="POST"  action="Delete_account">
                <ul>
                    <li>Enter your user name <input type="text" name="username"></li>
                    
                   
                    
                  
                </ul>
                <br/>
                <input type="submit" value="Delete account"> 
                
              
            </form>


        </article>
        <footer>
             <ul>
                <li>&COPY; Vladislavs Ignatjevs</li>
            </ul>           
        </footer>
    </body>
</html>
