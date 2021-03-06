/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {
    Cluster cluster=null;
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }




    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        String fullname=request.getParameter("fullname");
        String location=request.getParameter("location");
        
        User us=new User();
        us.setCluster(cluster);
        if(""!=username){
            if (us.userExists(username)){
                error("user "+username+" exists", response);
            }
        }
        if (""!=username && ""!=password && ""!=email && ""!=fullname && ""!=location && !us.userExists(username)){
        us.RegisterUser(username, password, email, fullname, location);
        
	response.sendRedirect("register_success.jsp");
            }else{
            error("All fields are required for the registration", response);
         }
        
    }
    
         private void error(String error, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = null;
         out = new PrintWriter(response.getOutputStream());
         out.println(error);
         out.println("Press the 'back' button to go back to register page");
 
         out.close();
         return;
     } 

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}