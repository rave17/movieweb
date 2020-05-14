/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.movieweb.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rober
 */
public class ConnectionManager {
    public Connection getConnection(){
        String user = "root";
        String password = "root";
        String db = "moviewebdatabase";
        String host = "localhost";
        String port = "3306";
        String timeZone = "UTC";
        
        String url;
        
        url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?user=" + user + "&password=" + password + "&serverTimezone=" + timeZone;
        
        Connection con = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver loaded");
            con = DriverManager.getConnection( url );
            
            System.out.println("Connection successfull");
            
        } catch (ClassNotFoundException ex) {
            System.out.println("Can not get connection");
            
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
}
