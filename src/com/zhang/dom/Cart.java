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

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
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

    public int getAphone() {
        return aphone;
    }

    public void setAphone(int aphone) {
        this.aphone = aphone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", uid=" + uid +
                ", cid=" + cid +
                ", oid='" + oid + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", addTime=" + addTime +
                ", aphone=" + aphone +
                ", address='" + address + '\'' +
                ", receiver='" + receiver + '\'' +
                ", status=" + status +
                '}';
    }

    private int id;
    private int uid;
    private int cid;
    private String oid;
    private int quantity;
    private double price;
    private Date addTime;
    private int aphone ;
    private String address;
    private String receiver;
    private int status;


}
