package com.zhang.dao;

import com.zhang.dom.Cart;
import com.zhang.dom.Photo;
import com.zhang.dom.Product;
import com.zhang.utils.JdbcUtils;

import java.util.List;
import java.util.Map;

import static com.zhang.servlet.ProductServlet.*;

/**
 * @author prayers
 * @date 2019/11/4 8:54
 */
public class ProductDao {
    public static void addGoods(Product goods) {
        String sql = "insert into goods values(null,?,?,?,?,?,?,?,?,null,null,?,?)";
        Object[] params ={
                goods.getGid(),
                goods.getGoodsName(),
                goods.getCategories(),
                goods.getCategoriesTwo(),
                goods.getPrice(),
                goods.getSkey(),
                goods.getSku(),
                goods.getContent(),
                goods.getPublishedDate(),
                goods.getBid()
        };
        JdbcUtils.insert(sql, params);
    }
    /**添加品牌信息*/
    public static void addBrand(Photo photo) {
        String sql = "insert into goods_brand values(null,?,?,?,?,?,null)";
        Object[] params ={
                photo.getBrandName(),
                photo.getBrandFirst(),
                photo.getPhotoName(),
                photo.getFilePath(),
                photo.getFileTime(),
        };
        JdbcUtils.insert(sql, params);
    }
    /**查找品牌信息*/
    public static List<Map<String, Object>> findBrand() {
        String sql = "select * from goods_brand";
        return JdbcUtils.find(sql);
    }

    /**查找所有记录
     public static List<Map<String, Object>> findAllGoods() {
     String sql = "select * from goods";
     return JdbcUtils.find(sql);
     }
     */
    /**查找一条数据*/
    public static Map<String, Object> findOne(int id) {
        String sql = "select * from goods where id=?";
        List<Map<String, Object>> list=JdbcUtils.find(sql, id);
        return list.get(0);
    }
    /**根据角色查找一条数据*/
    public static Map<String, Object> findOneUp(int id,Object action) {
        String sql = "";
        if (UPDATE_BEFORE_GO.equals(action)) {
            sql = "select a.*,b.name,b.first from goods a,goods_brand b where a.bid=b.id and a.id=?";
            List<Map<String, Object>> list = JdbcUtils.find(sql, id);
            return list.get(0);
        } else if (UPDATE_BEFORE_BR.equals(action)) {
            sql = "select * from goods_brand where id=?";
            List<Map<String, Object>> list = JdbcUtils.find(sql, id);
            return list.get(0);
        }
        return null;
    }


    /**根据传递的Notice对象更新一条数据*/
    public void update(Product goods, Object action) {
        String sql="";
        if(UPDATE_GO.equals(action)){
            sql="update goods set price=?,skey=?,sku=?,time=? where id=?";
            Object []params={
                    goods.getPrice(),
                    goods.getSkey(),
                    goods.getSku(),
                    goods.getPublishedDate(),
                    goods.getId(),
            };
            JdbcUtils.update(sql, params);
        }else if(UPDATE_BR.equals(action)){
            sql="update goods set price=?,key=?,sku=?,content=?,time=? where id=?";
            Object []params={
                    goods.getPrice(),
                    goods.getSkey(),
                    goods.getSku(),
                    goods.getContent(),
                    goods.getPublishedDate(),
            };
            JdbcUtils.update(sql, params);
        }
    }


    /**商品总记录数*/
    /**搜索结果总记录数*/
    public int findCountGoods(String skey,String svalue) {
        StringBuilder sql=new StringBuilder("select count(*) from goods");
        if(skey!=null&&skey.length()>0&&svalue!=null&&svalue.length()>0){
            //'%123%'
            sql.append(" where "+skey+" like \"%"+svalue+"%\" ");
        }
        return ((Number) JdbcUtils.selectScalar(sql.toString(), (Object[]) null)).intValue();
    }
    /**开始记录的索引*/
    /**开始记录的索引（搜索结果）skey代表哪一列，svalue是具体的值
     /**select a.*,b.brand_name from goods a,goods_brand b where a.bid=b.id
     * and a.gid like 100000001 limit 0,3 条件是a.bid=b。id和当a.gid=100000001时
     * */
    public static List<Map<String, Object>> findAllGoods(int startIndex, int pageSize,
                                                         String skey,String svalue) {
        StringBuilder sql=new StringBuilder("select a.*,b.name,b.first from" +
                " goods a,goods_brand b where a.bid=b.id");
        if(skey!=null&&skey.length()>0&&svalue!=null&&svalue.length()>0){
            sql.append(" and a."+skey+" like \"%"+svalue+"%\" limit ?,?");
        }else{
            sql.append(" limit ?,?");
        }
        return JdbcUtils.find(sql.toString(), startIndex, pageSize);
    }
    /** 品牌总记录数-*/
    public int findCountBrand() {
        String sql = "select count(*) from goods_brand";
        return ((Number) JdbcUtils.selectScalar(sql)).intValue();
    }
    /**开始记录的索引（品牌）*/
    public static List<Map<String, Object>> findAllBrand(int startIndex, int pageSize) {
        String sql = "select * from  goods_brand limit ?,?";
        return JdbcUtils.find(sql, startIndex, pageSize);
    }

    /**删除*/
    public static void delete(int id){
        String sql = "delete from goods where id=?";
        JdbcUtils.update(sql,id);
    }
    /**删除多条数据*/
    public static void delMore(String[] ids,Object action) {
        String sql="";
        if(DEL_GO_MOR.equals(action)){
            sql = "delete from goods where id=?";
            for (int i = 0; i < ids.length; i++) {
                System.out.println("删除数据的id为" + ids[i]);
                JdbcUtils.update(sql, ids[i]);
            }
        }else if(DEL_BR_MOR.equals(action)){
            sql = "delete from goods_brand where id=?";
            for (int i = 0; i < ids.length; i++) {
                System.out.println("删除数据的id为"+ids[i]);
                JdbcUtils.update(sql, ids[i]);
            }
        }
    }
}
