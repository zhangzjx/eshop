package com.zhang.service;

import com.zhang.dao.AdminDao;
import com.zhang.dom.Admin;

import java.util.List;
import java.util.Map;

/**
 * @author prayers
 * @date 2019/10/31 10:39
 */
public class AdminService {
    private static AdminDao adminDao = new AdminDao();
    public static boolean validate(String username, String password, String role) {
        /* 1.调用Dao层中的findByUsername方法
         *   返回一个User对象
         * 2. User对象为空，用户名不存在，返回false
         * 3. User对象不为空，判断密码是否正确
         *   3.1 比较密码是否正确，正确，返回true
         *   3.2 密码不正确，返回false
         */
        //1.调用Dao层中的findByUsername方法
        Admin user = adminDao.findByusername(role,username);
        boolean flag = false;
        if(user!=null && password.equals(user.getPassword()) && role.equals(user.getRole())){
            flag = true;
        }
        return flag;
    }

}
