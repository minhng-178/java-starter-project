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
public class CartDTO {

    private int uid;
    private String p_name;
    private String p_image;
    private String p_price;
    private String s_name;
    private int quantity;
    private String pid;
    private String sid;

    public CartDTO() {
    }

    public CartDTO(String pid, String sid, int uid, int quantity) {
        this.pid = pid;
        this.sid = sid;
        this.uid = uid;
        this.quantity = quantity;
    }

    public CartDTO(int uid, String p_name, String p_image, String p_price, String s_name, int quantity, String pid, String sid) {
        this.uid = uid;
        this.p_name = p_name;
        this.p_image = p_image;
        this.p_price = p_price;
        this.s_name = s_name;
        this.quantity = quantity;
        this.pid = pid;
        this.sid = sid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_image() {
        return p_image;
    }

    public void setP_image(String p_image) {
        this.p_image = p_image;
    }

    public String getP_price() {
        return p_price;
    }

    public void setP_price(String p_price) {
        this.p_price = p_price;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    
    @Override
    public String toString() {
        return "CartDTO{" + "uid=" + uid + ", p_name=" + p_name + ", p_image=" + p_image + ", p_price=" + p_price + ", s_name=" + s_name + ", quantity=" + quantity + '}';
    }

}
