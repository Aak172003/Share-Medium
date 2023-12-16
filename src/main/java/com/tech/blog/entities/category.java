/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author Aakash Prajapati
 */
public class category {

    private int cid;
    private String name;
    private String description;

    // defualt Constructor 
    public category() {
    }

    // Parameterised Constructor 
    public category(int cid, String name, String description) {
        this.cid = cid;
        this.name = name;
        this.description = description;
    }

    // Parameterised Constructor except cid
    public category(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
