/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.movieweb.DAO;

import com.mycompany.movieweb.entities.Comment;
import com.mycompany.movieweb.entities.User;
import com.mycompany.movieweb.utils.ConnectionManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author rober
 */
public class UserDAO {
    public ArrayList<User> getUsersList(){ 
           
        ArrayList<User> UsersList = new ArrayList<>();
         
        try{
            ConnectionManager connectionManager = new ConnectionManager();
            
            Connection con = connectionManager.getConnection();
            
            Statement stm;
            ResultSet rs;
            String sql;
            
            sql = "";
            
            stm = con.createStatement();
            rs = stm.executeQuery(sql);
            
            while(rs.next()){
                User user = new User();
                
                user.setUserId(rs.getInt("idUsers"));
                user.setUserName(rs.getString("name_users"));
                user.setUserLastname(rs.getString("lastname_users"));
                user.setUserEmail(rs.getString("email_users"));
                user.setUserNickname(rs.getString("nickname_users"));
                user.setUserPassword(rs.getString("password_users"));
                user.setUserAvatar(rs.getString("avatar_users"));
                user.setUserDescription(rs.getString("description_users"));
                user.setUserCreated(rs.getDate("created_users"));
                
                UsersList.add(user);
                
            }
            
            stm.close();
            rs.close();
            con.close();
        } catch(SQLException ex){
            System.out.println("Creating user");
        }
     return UsersList;
}
} 