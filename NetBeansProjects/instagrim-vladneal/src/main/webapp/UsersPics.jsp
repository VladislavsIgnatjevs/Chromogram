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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chromogram</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body>
        <header>

            <h1>Chromogram</h1>
            <h2>Explore the world of apochromatic effects</h2>
        </header>

        <nav>
            <ul>
                <li class="nav"><a href="/Instagrim/upload.jsp">Upload</a></li>
                <li class="nav"><a href="/Instagrim/Images/majed">Shared Images</a></li>
                    <%
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
               
                <li><% out.println("You are logged in as " + lg.getUsername());%></li>
                <li><a href="/Instagrim/Logout">Logout</a></li>
                    <%}
                    } else {
                    %>
                    <%}%>
            </ul>
        </nav>

        <article>
            <h1>Your Pics</h1>
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
            <a href="/Instagrim/Images/<%=p.getUser()%>" > <% out.println(p.getUser());%> </a>
            <a>Privacy: <% out.println(p.getPrivacy());%></a></br>
            <a>About the picture: <% out.println(p.getInfo());%></a></br>
            <a href="/Instagrim/Delete/<%=p.getSUUID()%>" > Delete picture </a><br><br/>
            <%}}%>
            
            
        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
