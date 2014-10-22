<%-- 
    Document   : update_profile.jsp
    Created on : Tue 21 Oct, 2014, 6:29:51 PM
    Author     : Vladislavs Ignatjevs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chromogram</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <header>
        <h1>Chromogram</h1>
        <h2>Explore the world of apochromatic effects</h2>
        </header>
        <nav>
        </nav>
       
        <article>
            <h3>Delete account</h3>
            <form method="POST"  action="Delete_account">
                <ul>
                    <li>Enter your user name <input type="text" name="username"></li>
                    
                   
                    
                  
                </ul>
                <br/>
                <input type="submit" value="Delete account"> 
                
                <a href="/Instagrim">Cancel</a>
            </form>


        </article>
        <footer>
        </footer>
    </body>
</html>
