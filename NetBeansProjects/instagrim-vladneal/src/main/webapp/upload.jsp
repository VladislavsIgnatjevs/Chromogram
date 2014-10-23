<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chromogram</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
            <h1>Chromogram</h1>
            <h2>Explore the world of apochromatic effects</h2>
        <nav>
            <ul>
                    <%
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li class="nav"><a href="/Instagrim/Images/majed">Sample Images</a></li>
                
                <li><% out.println("You are logged in as " + lg.getUsername());%></li>
                <li><a href="/Instagrim/Logout">Logout</a></li>
                    <%}
                    } else {
                    %>
                    <%}%>

            </ul>
        </nav>

        <article>

            <!-- Added accept="image/*" to filter image types automatically in the browser-->
            <h3>File Upload</h3>
            <form method="POST" enctype="multipart/form-data" action="Image">
                <br>File to upload: <input type="file" accept="image/*" name="upfile"><br/>
                <br> Privacy: <select id="privacy" name="isprivate">
                         <option value="public">Public</option>
                         <option value="private">Private</option>
                </select> 
                <br><br>About the picture: <input type="text" name="info">
                <br><br/>
                <input type="submit" value="Press"> to upload the file!
            </form>

        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
