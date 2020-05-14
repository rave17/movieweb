/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.movieweb.entities;

/**
 *
 * @author rober
 */
public class Movies {
    private int idMovie;
    private int idComment;

    public Movies(int idMovie, int idComment){
        this.idMovie = idMovie;
        this.idComment = idComment;
    }
    

    public int getIdMovie() {
        return idMovie;
    }

    public void setIdMovie(int idMovie) {
        this.idMovie = idMovie;
    }

    public int getIdComment() {
        return idComment;
    }

    public void setIdComment(int idComment) {
        this.idComment = idComment;
    }
    
}
