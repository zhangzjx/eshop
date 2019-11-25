package com.zhang.test;

import com.zhang.utils.JdbcUtils;

/**
 * @author prayers
 * @date 2019/10/28 18:52
 */
public class TestJdbc {

    public static void main(String[] args) {
        String sql="update test set name=?,sex=? where id=?";
        Object[] params = {
                "王","男",1
        };
        System.out.println(params[2]);
        JdbcUtils.update(sql, params);
    }
}
