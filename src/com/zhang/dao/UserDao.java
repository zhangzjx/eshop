package com.zhang.dao;

import com.zhang.dom.Cart;
import com.zhang.dom.User;
import com.zhang.utils.JdbcUtils;

import java.util.List;
import java.util.Map;

import static com.zhang.servlet.UserServlet.*;

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
    /******所有商品******/
    public List<Map<String, Object>> allGoods(String action) {
        StringBuilder sql=new StringBuilder("select * from goods");
        if(ALL_GOODS.equals(action)){
            sql.append("");
            System.out.println("allGoods执行"+action);
        }else if(DESC.equals(action)){
            sql.append(" order by price desc");
            System.out.println("DESC降序执行"+action);
        }else if(ASC.equals(action)){
            sql.append(" order by price asc");
            System.out.println("ASC升序执行"+action);
        }
        return JdbcUtils.find(sql.toString());
    }

    public List<Map<String, Object>> ascGoods() {
        String sql = "select * from goods order by price asc";
        System.out.println("ASC执行");
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
            sql.append(" where status=1 and uid="+uid);
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
            sql.append(" and uid=? and status=1 limit ?,?");
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

    /*****添加地址******/
    public void addAddress(User m) {
        String sql = "insert into address values(null,?,?,?)";
        Object[] params ={
                m.getUid(),
                m.getAddress(),
                m.getStatus(),
        };
        JdbcUtils.insert(sql, params);
    }

    /*****查看所有地址内容******/
    public List<Map<String, Object>> allAddress(String uid) {
        String sql = "select a.name,a.phone,b.* from user a,address b where a.uid=b.uid and a.uid=?";
        return JdbcUtils.find(sql,uid);
    }
    /*****修改地址内容******/
    public void updateAddress(User m) {
        String sql="update address set address=? where aid=? and uid=?";
        Object []params={
                m.getAddress(),
                m.getAid(),
                m.getUid(),
        };
        JdbcUtils.update(sql, params);
    }
    /*****修改默认地址******/
    public void updateDefault(User m) {
        String sql="update address set status=1 where uid=?";
        Object []params={
                m.getUid(),
        };
        JdbcUtils.update(sql, params);
    }
    public void updateDefaultTwo(User m) {
        String sql="update address set status=? where aid=? and uid=?";
        Object []params={
                m.getStatus(),
                m.getAid(),
                m.getUid(),
        };
        JdbcUtils.update(sql, params);
    }

    /*****删除地址******/
    public void delAddress(int aid) {
        String sql = "delete from goods where aid=?";
        JdbcUtils.update(sql,aid);
    }

    public int findCountAll(String skey, String svalue) {
        StringBuilder sql=new StringBuilder("select count(*) from goods");
        if(skey!=null&&skey.length()>0&&svalue!=null&&svalue.length()>0){
            //'%123%'
            sql.append(" where "+skey+" like \"%"+svalue+"%\" ");
        }
        return ((Number) JdbcUtils.selectScalar(sql.toString(), (Object[]) null)).intValue();
    }

    public static List<Map<String, Object>> findAllGoods(String sort,String sortKey, int startIndex, int pageSize, String skey, String svalue) {

        StringBuilder sql=new StringBuilder("select * from goods");
        if(skey!=null&&skey.length()>0&&svalue!=null&&svalue.length()>0) {
            sql.append(" and a." + skey + " like \"%" + svalue + "%\" ");
        }else if(sort!=null&&sort.length()>0&&sortKey!=null&&sortKey.length()>0){
                sql.append(" order by "+sortKey+" "+sort+" ");
        }
        return JdbcUtils.find(sql.toString()+"limit ?,?", startIndex, pageSize);
    }


}
