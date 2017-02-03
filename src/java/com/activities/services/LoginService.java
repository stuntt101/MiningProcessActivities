/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.activities.services;

import com.activities.entities.User;

/**
 *
 * @author ERavhengani
 */
public class LoginService {

    UserService service;
    
    public LoginService() {
        
        service=  new UserService();
    }

/**
     *
     * @param username
     * @param password
     * @return
     */
    public boolean authenticateUser(String username, String password) {
        User user = service.getUserByUsername(username);
     
        
        if(user!=null && user.getUsername().equals(username) && user.getPassword().equals(password)){
            return true;
        }else{ 
            return false;
        }
    }
    /**
     *
     * @param username
     * @param password
     * @return
     */
    public boolean authenticateNormalUser(String username, String password , int role) {
        User normal_user = service.getUserByUsername(username);
        if(normal_user!=null && normal_user.getUsername().equals(username) && normal_user.getPassword().equals(password)&&normal_user.getRole()==role){
            return true;
        }else{ 
            return false;
        }
    }
    
}
