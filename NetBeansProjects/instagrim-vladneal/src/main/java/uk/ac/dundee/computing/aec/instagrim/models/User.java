/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.UserStore;

/**
 *
 * @author Administrator
 */
public class User {
    Cluster cluster;
    public User(){
        
    }
    
    public boolean RegisterUser(String username, String Password, String email, String fullname, String location){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("insert into userprofiles (login,password,email,fullname,location) Values(?,?,?,?,?)");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username,EncodedPassword,email, fullname, location));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }
    
    public boolean IsValidUser(String username, String Password){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return false;
        } else {
            for (Row row : rs) {
               
                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0)
                    return true;
            }
        }
   
    
    return false;  
    }
       public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }
       
        public boolean userExists(String username){
        
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select fullname from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return false;
        } else {
            for (Row row : rs) {
               
                String StoredPass = row.getString("fullname");
            
                    return true;
            
            }
        return false;
        }
        }
        
       
     public boolean UpdateUser(String location, String fullname, String email, String Password, String username){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("update userprofiles set location=?, fullname=?,email=?,password=? where login=?;");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        location, fullname, email, EncodedPassword, username));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }

     public boolean DeleteUser(String username){

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("delete from userprofiles where login=?");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }  
     
          public boolean DeletePicturesPICS(String username){

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("delete from pics where user=?");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }  
          
              public boolean DeletePicturesPICLIST(String username){

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("delete from userpiclist where user=?");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }        
     
     
     
        public UserStore getUserDetails(String username) {
        /* Method designed to retrieve the user details and place them inside the UserStore. Based upon the IsValidUser method*/
        Session session = cluster.connect("instagrim");
        /* Next statement attempts to retrieve all from userprofiles, not just the "password" field as seen in IsValidUser */
        PreparedStatement ps = session.prepare("select * from userprofiles where login =?");
        /* Main statements to enable the database access are identical to IsValidUser */
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind(username));
        UserStore userStore = new UserStore();
        if (rs.isExhausted()) {
            System.out.println("Cannot find user entry");
            return null;
        } else {
            for (Row row : rs) {
                String login = row.getString("login");
                String email = row.getString("email");
                String fullname = row.getString("fullname");
                String location = row.getString("location");
                userStore.setUser(login, email, fullname, location);
            }
        }
        return userStore;
    }
    
}
