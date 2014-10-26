<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.User" %>
<!DOCTYPE html>
<html>
    <head>
         <!-- pretty font -->
         <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Open+Sans:300' rel='stylesheet' type='text/css'> 
        
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chromogram</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/demo.css" />
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
                                <li><a href="upload.jsp">Upload Pictures</a></li>
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
            <h1>Your pictures</h1>
            <%
                java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                if (lsPics == null) {
            %>
            <p>No Pictures found</p>
            <%
            } else {
                Iterator<Pic> iterator;
                iterator = lsPics.iterator();
                while (iterator.hasNext()) {
                    Pic p = (Pic) iterator.next();
                    %>
                    
            <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br/>
            <a>Privacy: <% out.println(p.getPrivacy());%></a></br>
            <a>About the picture: <% out.println(p.getInfo());%></a></br>
            <a href="/Instagrim/Delete/<%=p.getSUUID()%>" > Delete picture </a><br><br/>
            <%}}%>
            
            
        </article>
        <footer>
            <ul>
                <li>&COPY; Vladislavs Ignatjevs</li>
            </ul>
        </footer>
    </body>
</html>
