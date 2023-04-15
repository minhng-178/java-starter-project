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
public class SizeDTO {

    private int id;
    private int size;
    private String pid;
    private int quantity;

    public SizeDTO() {
    }

    public SizeDTO(int id, int size, String pid) {
        this.id = id;
        this.size = size;
        this.pid = pid;
    }

    public SizeDTO(int id, int size, String pid, int quantity) {
        this.id = id;
        this.size = size;
        this.pid = pid;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "SizeDTO{" + "id=" + id + ", size=" + size + ", pid=" + pid + ", quantity=" + quantity + '}';
    }

    

}
