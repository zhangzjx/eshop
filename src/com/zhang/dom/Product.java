package com.zhang.dom;

import java.util.Date;

/**
 * @author prayers
 * @date 2019/11/4 8:55
 */
public class Product {
    private int id;
    private int bid;
    private String gid;
    private String brandName;
    private String brandFirst;
    private String goodsName;
    private String Categories;
    private String CategoriesTwo;
    private String price;

    public String getSkey() {
        return skey;
    }

    public void setSkey(String skey) {
        this.skey = skey;
    }

    private String skey;
    private String sku;
    private int sales;
    private Date publishedDate;
    private String content;
    private Date time;

    public int getId() { return id; }

    public void setId(int id) {
        this.id = id;
    }
    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) { this.gid = gid;    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getBrandFirst() {
        return brandFirst;
    }

    public void setBrandFirst(String brandFirst) {
        this.brandFirst = brandFirst;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getCategories() {
        return Categories;
    }

    public void setCategories(String categories) {
        Categories = categories;
    }

    public String getCategoriesTwo() {
        return CategoriesTwo;
    }

    public void setCategoriesTwo(String categoriesTwo) {
        CategoriesTwo = categoriesTwo;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }


    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public Date getPublishedDate() {
        return publishedDate;
    }

    public void setPublishedDate(Date publishedDate) {
        this.publishedDate = publishedDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }


}
