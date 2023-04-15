/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author ACER
 */
public class AccountDTO {
    private int id;
    private String user;
    private String pass;
    private int isAvailable;
    private int isSell;
    private int isAdmin;

    public AccountDTO() {
    }
 
    public AccountDTO(int id, String user, String pass, int isAvaiable,int isSell, int isAdmin) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.isAvailable = isAvaiable;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public int getIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(int isAvailable) {
        this.isAvailable = isAvailable;
    }

    @Override
    public String toString() {
        return "AccountDTO{" + "id=" + id + ", user=" + user + ", pass=" + pass + ", isAvailable=" + isAvailable + ", isSell=" + isSell + ", isAdmin=" + isAdmin + '}';
    }

           
}
