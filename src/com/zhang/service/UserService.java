package com.zhang.service;

import com.zhang.dao.ProductDao;
import com.zhang.dao.UserDao;
import com.zhang.dom.Cart;
import com.zhang.dom.User;
import com.zhang.exception.UserException;
import com.zhang.utils.Page;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author prayers
 * @date 2019/11/11 16:47
 */
public class UserService {
    UserDao userDao = new UserDao();
    public boolean validateName(String name) {
        User user = userDao.validateByName(name);
        if(user!=null){
            return false;
        }else{
            return true;
        }
    }
    /**注册账号*/
    public void regist(User user) {
        UserDao.regist(user);
    }
    /**登录账号*/
    public User login(int uid,String name,String password) throws UserException {
        User user = userDao.findByName(name);
        if(user==null){
            throw new UserException("该用户不存在");
        }
        if(!password.equals(user.getPassword())){
            throw new UserException("密码不正确");
        }
        return user;
    }
    /**更新登陆时间*/
    public void updateLastLoginTime(User user) {
        user.setLasttime(new Date());
        userDao.updateLastLoginTime(user);
    }

    public Page findAllCart(int uid,int currentPage,String skey,String svalue) {
        //根据用户id查询购物车商品数量及购物车搜索功能
        int totalSize = userDao.findCountCart(uid,skey,svalue);
        Page page = new Page(currentPage,totalSize);
        List<Map<String,Object>> list = UserDao.findAllCart(uid,page.getStartIndex(),page.getPageSize(),skey,svalue);
        page.setList(list);
        System.out.println("页码"+page.getCurrentPage());
        return page;
    }

    public List<Map<String,Object>> findAll(){
        return userDao.findAll();
    }

    public Map<String, Object> findSingle(int id) {
        return null;
    }

    public Map<String, Object> findOne(int id) {
        return userDao.findOne(id);
    }

    /**加购*/
    public void addCart(Cart goods) {
        //直接调用Dao来添加商品
        userDao.addGoods(goods);
    }

    public List<Map<String,Object>> allGoods(String action) {
        return userDao.allGoods(action);
    }

    public List<Map<String,Object>> ascGoods() {
        return userDao.ascGoods();
    }

    /******收货地址操作******/
    public void addAddress(User m) {
        userDao.addAddress(m);
    }
    /****查看所有地址****/
    public List<Map<String,Object>> allAddress(String uid) {
        return userDao.allAddress(uid);
    }
    public void updateAddress(User m) {
        userDao.updateAddress(m);
    }
    public void updateDefault(User m) {
        userDao.updateDefault(m);
        userDao.updateDefaultTwo(m);

    }
    public void delAddress(int aid) {
        userDao.delAddress(aid);
    }

}
