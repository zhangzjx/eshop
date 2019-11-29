package com.zhang.dom;


import java.util.Date;

/**
 * @author prayers
 * @date 2019/11/11 16:50
 */
public class User {
    @Override
    public String toString() {
        return "User{" +
                "aid=" + aid +
                ", address='" + address + '\'' +
                ", status=" + status +
                ", uid=" + uid +
                ", phone=" + phone +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", lasttime=" + lasttime +
                ", sessionIdString='" + sessionIdString + '\'' +
                ", ipString='" + ipString + '\'' +
                ", firsttTimeString='" + firsttTimeString + '\'' +
                '}';
    }
    //收货地址id
    private int aid;
    private int uid;
    //收货地址
    private String address;
    //状态码
    private int status;
    private int phone;
    private String name;
    private String password;
    private String email;
    private Date lasttime;

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getLasttime() {
        return lasttime;
    }

    public void setLasttime(Date lasttime) {
        this.lasttime = lasttime;
    }


    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }


    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

/**统计在线人数*/
    private String sessionIdString;
    private String ipString;
    private String firsttTimeString;

    public String getSessionIdString() {
        return sessionIdString;
    }

    public void setSessionIdString(String sessionIdString) {
        this.sessionIdString = sessionIdString;
    }

    public String getIpString() {
        return ipString;
    }

    public void setIpString(String ipString) {
        this.ipString = ipString;
    }

    public String getFirsttTimeString() {
        return firsttTimeString;
    }

    public void setFirsttTimeString(String firsttTimeString) {
        this.firsttTimeString = firsttTimeString;
    }


}
