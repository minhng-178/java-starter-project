/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import dao.*;

/**
 *
 * @author ACER
 */
public class CategoryDTO {
    private int id;
    private String cname;

    public CategoryDTO(int id, String cname) {
        this.id = id;
        this.cname = cname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return cname;
    }

    public void setName(String name) {
        this.cname = cname;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "id=" + id + ", name=" + cname + '}';
    }
}
