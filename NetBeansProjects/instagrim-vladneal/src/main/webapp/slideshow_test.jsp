<%-- 
    Document   : slideshow_test
    Created on : Oct 24, 2014, 12:20:50 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import= "uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@ page import = "uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts" %>
<%@ page import = "com.datastax.driver.core.Cluster" %>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
  
    <title></title>
      
    <!-- bjqs.css contains the *essential* css needed for the slider to work -->
    <link rel="stylesheet" href="/Instagrim/bjqs.css">

    <!-- some pretty fonts for this demo page - not required for the slider -->
    <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Open+Sans:300' rel='stylesheet' type='text/css'> 

    <!-- demo.css contains additional styles used to set up this demo page - not required for the slider --> 
    <link rel="stylesheet" href="/Instagrim/demo.css">

    <!-- load jQuery and the plugin -->
    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script src="js/bjqs-1.3.min.js"></script>
      
  </head>
  
  <body>
      
      <%
                        PicModel pm = new PicModel();
                        Cluster cluster;
                        cluster = CassandraHosts.getCluster();
                        pm.setCluster(cluster);
          %>
  
    <div id="container">
  
      
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

  </body>
</html>
