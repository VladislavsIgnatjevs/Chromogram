<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Vladislavs Ignatjevs
--%>


<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import= "uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@ page import = "uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts" %>
<%@ page import = "com.datastax.driver.core.Cluster" %>
<!DOCTYPE html>
<html>
    
    <head>
        <title>Chromogram</title>
        
        <!-- reference: demo.css, bjqs.css bjqs-1.3.js are downloaded from http://www.basic-slider.com-->
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- bjqs.css contains the *essential* css needed for the slider to work -->
        <link rel="stylesheet" href="/Instagrim/bjqs.css">   
        
         <!-- pretty font -->
         <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Open+Sans:300' rel='stylesheet' type='text/css'> 

         <!-- demo.css contains additional styles used to set up this demo page - not required for the slider --> 
         <link rel="stylesheet" href="/Instagrim/demo.css">   
    <!-- load jQuery and the plugin -->
    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script src="/Instagrim/js/bjqs-1.3.min.js"></script>   
    

    
    
    </head>
    <body>
        <header>
            <img src="/Instagrim/img/chromologofin.jpg">
            <h3>explore the world of apochromatic effects</h3>
        </header>
        <nav>
        
    <div id="cssmenu">        
            <ul>
                        
               

                    <%
                                                                      
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        PicModel pm = new PicModel();
                        Cluster cluster;
                        cluster = CassandraHosts.getCluster();
                        pm.setCluster(cluster);
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                    
                                
                                <li class='active'><a  href="/Instagrim/">Home</a></li>
                                <li><a href="upload.jsp">Upload Pictures</a></li>
                                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                                <li><a href="/Instagrim/update_profile.jsp">Update Profile</a></li>
                                <li><a href="/Instagrim/Profile/<%=lg.getUsername()%>">Show Profile</a></li>
                                <li><a href="/Instagrim/Logout">Logout</a></li>
                                <li><a href="/Instagrim/delete_account.jsp">Delete Account</a></li>
                                
                                
                                


                    <%}
                            
                            }else{
                                %>
                 <li><a href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                <%
                                        
                            
                    }%>
                
                       
                    </ul> 

    </div>     
        </nav>   
            <div id="container">
  
                <br>
                
                
                <br/>
      <h2>Our random 10 public shared images</h2>

      <!--  Outer wrapper for presentation only, this can be anything you like -->
      <div id="banner-slide">

        <!-- start Basic Jquery Slider -->
        <ul class="bjqs">
          <li><a href=""><img src="/Instagrim/Image/<%=pm.getRandom()%>" title="10 random pictures"></a></li>
          <li><img src="/Instagrim/Image/<%=pm.getRandom()%>" title="10 random public shared pictures"></li>
          <li><img src="/Instagrim/Image/<%=pm.getRandom()%>" title="10 random public shared pictures"></li>
          <li><img src="/Instagrim/Image/<%=pm.getRandom()%>" title="10 random public shared pictures"></li>
          <li><img src="/Instagrim/Image/<%=pm.getRandom()%>" title="10 random public shared pictures"></li>
          <li><img src="/Instagrim/Image/<%=pm.getRandom()%>" title="10 random public shared pictures"></li>
          <li><img src="/Instagrim/Image/<%=pm.getRandom()%>" title="10 random public shared pictures"></li>
          <li><img src="/Instagrim/Image/<%=pm.getRandom()%>" title="10 random public shared pictures"></li>
          <li><img src="/Instagrim/Image/<%=pm.getRandom()%>" title="10 random public shared pictures"></li>
          <li><img src="/Instagrim/Image/<%=pm.getRandom()%>" title="10 random public shared pictures"></li>
        </ul>
        <!-- end Basic jQuery Slider -->

      </div>
      <!-- End outer wrapper -->
      
      <!-- attach the plug-in to the slider parent element and adjust the settings as required -->
      <script class="secret-source">
        jQuery(document).ready(function($) {
          
          $('#banner-slide').bjqs({
            animtype      : 'slide',
            height        : 400,
            width         : 594,
            responsive    : true,
            randomstart   : true
          });
          
        });
      </script>

    </div>

    <!-- 
      The following script is not related to basic jQuery Slider 
      It's used to create the code snippets in the demo.
      https://github.com/maelstrom/SecretSource
    -->
   

    <script>
    jQuery(function($) {

        $('.secret-source').secretSource({
            includeTag: false
        });

    });
    </script>            
           
       
        <footer>
            <ul>
                <li>&COPY; Vladislavs Ignatjevs</li>
            </ul>
        </footer>
    </body>
</html>
