/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.movieweb.DAO;

import com.mycompany.movieweb.entities.Comment;
import com.mycompany.movieweb.utils.ConnectionManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author rober
 */
public class CommentDAO {
    public ArrayList<Comment> getCommentsList(){
        
        ArrayList<Comment> CommentList = new ArrayList<>();
        
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
                Comment comment = new Comment();

                comment.setContentComment(rs.getString("content_comments"));
                comment.setDateComment(rs.getDate("created_comments"));
                
                CommentList.add(comment);
                
            }
            
            stm.close();
            rs.close();
            con.close();
        } catch(SQLException ex){
            System.out.println("Error getting comments");
        }
        return CommentList;
    }
    
    public Comment getComment(int idComment){
       
     Comment comment = new Comment();
        
         try {
            ConnectionManager connectionManager = new ConnectionManager();
            
            Connection con = connectionManager.getConnection();
                        
            Statement stm;
            ResultSet rs;
            String sql;
            
            sql = "";
            
            stm = con.createStatement();
            
            rs = stm.executeQuery( sql );
            
            rs.next();
                            
            comment.setContentComment( rs.getString("content_comments") );
            comment.setDateComment( rs.getDate("date_comments") );
            
            
            
            stm.close();
            rs.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error al obtener la informacion del comic");
        }
        
        return comment;
    }
}
