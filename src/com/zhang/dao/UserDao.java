package com.zhang.dao;

import com.zhang.dom.Cart;
import com.zhang.dom.User;
import com.zhang.utils.JdbcUtils;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * @author prayers
 * @date 2019/11/11 16:50
 */
public class UserDao {

    /**首页显示的商品*/
    public List<Map<String,Object>> findAll() {
        String sql = "select * from goods limit 0,5";
        return JdbcUtils.find(sql);
    }
    /**查找一条数据*/
    public Map<String, Object> findOne(int id) {
        String sql = "select * from goods where id=?";
        List<Map<String, Object>> list=JdbcUtils.find(sql, id);
        return list.get(0);
    }
    /**通过用户名在数据库中查找User对象*/
    public User validateByName(String name){
        /*
         * 1.通过用户名查找用户是否存在
         * 2.存在的话，给user对象赋值
         * 3.不存在，user=null
         */
        User user = null;
        String sql ="select * from user where name=?";
        List<Map<String,Object>> list = JdbcUtils.find(sql,name);
        if(list.size()>0){
            user = new User();
            Map<String,Object> record = list.get(0);
            user.setName((String)record.get("name"));
        }
        return user;
    }

    /**通过用户名在数据库中查找User对象*/
    public User findByName(String name){
        /*
         * 1.通过用户名查找用户是否存在
         * 2.存在的话，给user对象赋值
         * 3.不存在，user=null
         */
        User user = null;
        String sql ="select * from user where name=?";
        List<Map<String,Object>> list = JdbcUtils.find(sql,name);
        if(list.size()>0){
            user = new User();
            Map<String,Object> record = list.get(0);
            user.setUid((Integer)record.get("uid"));
            user.setName((String)record.get("name"));
            user.setPassword((String)record.get("password"));

        }
        return user;
    }
    /**增加一个新用户*/
    public static void regist(User user){
        String sql = "insert into user values(null,?,?,?,?,null)";
        Object []params={
                user.getName(),
                user.getPassword(),
                user.getEmail(),
                user.getPhone()
        };
        JdbcUtils.update(sql,params);
    }


    public void updateLastLoginTime(User user) {
        String sql = "update user set lasttime=? where name=?";
        Object []params={
                new java.sql.Date(user.getLasttime().getTime()),
                user.getName()
        };

        JdbcUtils.update(sql,params);
    }

    /**购物车总记录数*/
    /**搜索结果总记录数*/
    public int findCountCart(int uid,String skey,String svalue) {
        StringBuilder sql=new StringBuilder("select count(*) from cart");
        if(skey!=null&&skey.length()>0&&svalue!=null&&svalue.length()>0){
            //'%123%'
            sql.append(" where "+skey+" like \"%"+svalue+"%\" ");
        }else {
            sql.append(" where uid="+uid);
        }
        return ((Number) JdbcUtils.selectScalar(sql.toString(), (Object[]) null)).intValue();
    }
    /**开始记录的索引*/
    /**开始记录的索引（搜索结果）skey代表哪一列，svalue是具体的值
     /**select a.*,b.brand_name from goods a,goods_brand b where a.bid=b.id
     * and a.gid like 100000001 limit 0,3 条件是a.bid=b。id和当a.gid=100000001时
     * */
    public static List<Map<String, Object>> findAllCart(int uid, int startIndex, int pageSize,
                                                         String skey,String svalue) {
        StringBuilder sql=new StringBuilder("select a.*,b.quantity,b.price from" +
                " goods a,cart b where a.id=b.id");
        if(skey!=null&&skey.length()>0&&svalue!=null&&svalue.length()>0){
            sql.append(" and a."+skey+" like \"%"+svalue+"%\" limit ?,?");
        }else{
            sql.append(" and uid=? limit ?,?");
        }
        return JdbcUtils.find(sql.toString(),uid, startIndex, pageSize);
    }

    /**加购**/
    public void addGoods(Cart goods) {
        String sql = "insert into cart values(null,?,?,?,?,?)";
        Object[] params ={
                goods.getUid(),
                goods.getId(),
                goods.getQuantity(),
                goods.getPrice(),
                new java.sql.Date(goods.getAddTime().getTime()),
        };
        JdbcUtils.insert(sql, params);
    }
}
