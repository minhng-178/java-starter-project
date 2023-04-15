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
public class ProductsDTO {
    private int id;
    private String name;
    private String title;
    private String description;
    private String image;
    private double price;
    private String size;
    private int quantity;

    public ProductsDTO(int id, String name, String title, String description, double price, String image, int quantity) {
        this.id = id;
        this.name = name;
        this.title = title;
        this.description = description;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
    }
    

    public ProductsDTO(int id, String name, String title, String description, double price, String image) {
        this.id = id;
        this.name = name;
        this.title = title;
        this.description = description;
        this.price = price;
        this.image = image;
    }

    public ProductsDTO(int id, String name, String image, double price, String size) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.size = size;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ProductsDTO{" + "id=" + id + ", name=" + name + ", title=" + title + ", image=" + image + ", price=" + price + ", size=" + size + '}';
    }

    
    
}
