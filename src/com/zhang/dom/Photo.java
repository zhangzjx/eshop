package com.zhang.dom;

import java.sql.Time;
import java.util.Date;

/**
 * @author Administrator
 */
public class Photo {

    private String photoName;
    private String filePath;

    private Date fileTime;


    public Time getcTime() {
        return cTime;
    }

    public void setcTime(Time cTime) {
        this.cTime = cTime;
    }

    @Override
    public String toString() {
        return "Photo{" +
                "photoName='" + photoName + '\'' +
                ", filePath='" + filePath + '\'' +
                ", fileTime=" + fileTime +
                ", cTime=" + cTime +
                ", brandName='" + brandName + '\'' +
                ", brandFirst='" + brandFirst + '\'' +
                '}';
    }

    private Time cTime;

    private String brandName;
    private String brandFirst;

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Date getFileTime() {
        return fileTime;
    }

    public void setFileTime(Date fileTime) {
        this.fileTime = fileTime;
    }

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

}
