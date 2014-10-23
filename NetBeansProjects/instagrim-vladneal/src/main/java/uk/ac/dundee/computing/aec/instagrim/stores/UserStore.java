/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.stores;

/**
 * Store created to hold user details for viewing on account page
 *
 * @author Vladislavs Ignatjevs
 */
public class UserStore {

    private String username = null;
    private String email = null;
    private String fullname = null;
    private String location = null;

    public UserStore() {
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getFullname() {
        return fullname;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLocation() {
        return location;
    }

    public void setUser(String username, String email, String fullname, String location) {
        this.username = username;
        this.email = email;
        this.fullname = fullname;
        this.location = location;
    }
    
}
