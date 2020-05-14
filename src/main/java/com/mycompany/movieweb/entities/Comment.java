/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.movieweb.entities;

import java.util.Date;

/**
 *
 * @author rober
 */
public class Comment {
    private int idComment;
    private String contentComment;
    private Date dateComment;

    public Comment(int idComment, String contentComment, Date dateComment) {
        this.idComment = idComment;
        this.contentComment = contentComment;
        this.dateComment = dateComment;
    }
    
    public Comment() {
        System.out.println("Create comment");
    }

    public int getIdComment() {
        return idComment;
    }

    public void setIdComment(int idComment) {
        this.idComment = idComment;
    }

    public String getContentComment() {
        return contentComment;
    }

    public void setContentComment(String contentComment) {
        this.contentComment = contentComment;
    }

    public Date getDateComment() {
        return new Date(dateComment.getTime());
    }

    public void setDateComment(Date dateComment) {
        this.dateComment = new Date(this.dateComment.getTime());
    }
        
}
