package com.ttre16.jordan.logic;

public class Product {
    private int id;
    private String name;
    private String description;
    private int price;
    private String url;


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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", url='" + url + '\'' +
                '}';
    }

    public String getProductSection(){
        return this.id > 3 && this.id < 10 ? "sneakers":
                this.id >= 10 && this.id < 16 ? "clothes" : "other";
    }
}