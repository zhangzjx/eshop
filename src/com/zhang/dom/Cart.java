package com.zhang.dom;

import java.util.Date;

/**
 * @author prayers
 * @date 2019/11/25 21:32
 */
public class Cart {
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", uid=" + uid +
                ", quantity=" + quantity +
                ", price=" + price +
                ", addTime=" + addTime +
                '}';
    }

    private int id;
    private int uid;
    private int quantity;
    private double price;
    private Date addTime;
}
