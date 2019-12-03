package com.zhang.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author prayers
 * @date 2019/12/2 18:58
 */
public class DateUtils {
    /**
     * 获取系统时间
     **/
    public static Date nowTime() throws ParseException {
        //获得系统时间.
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
        String nowTime = sdf.format(date);
        Date time = sdf.parse(nowTime);
        return time;
    }

    public static String nowTimeName() throws ParseException {
        //获得系统时间.
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat( " yyyyMMddHHmmss " );
        String nowTime = sdf.format(date);
        return nowTime;
    }


}
