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
class Permission {
    private int idPermission;
    private String permissionName;

    public Permission(int idPermission, String permissionName) {
        this.idPermission = idPermission;
        this.permissionName = permissionName;
    }

    public int getIdPermission() {
        return idPermission;
    }

    public void setIdPermission(int idPermission) {
        this.idPermission = idPermission;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }
        
}
