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
    /*********************添加*********************************/
    /**添加商品信息*/
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

    /*********************查找*********************************/

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
    /**查找一条商品数据*/
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

    /**搜索结果总记录数*/
    public int findCountOrder(String skey,String svalue,int status) {
        StringBuilder sql=new StringBuilder("select count(*) from orderinf a,orderitem b " +
                "where a.oid=b.oid");
        if(skey!=null&&skey.length()>0&&svalue!=null&&svalue.length()>0){
            //'%123%'
            if (skey.equals("id")){
                sql.append(" and b."+skey+" like \"%"+svalue+"%\" ");
            }else {
                sql.append(" and a."+skey+" like \"%"+svalue+"%\" ");
            }
        }
        return ((Number) JdbcUtils.selectScalar(sql.toString(), (Object[]) null)).intValue();
    }
    /**开始记录的索引*/
    /**开始记录的索引（搜索结果）skey代表哪一列，svalue是具体的值
     /**select a.*,b.brand_name from goods a,goods_brand b where a.bid=b.id
     * and a.gid like 100000001 limit 0,3 条件是a.bid=b。id和当a.gid=100000001时
     * */
    public static List<Map<String, Object>> findAllOrder(int startIndex, int pageSize,
                                                         String skey,String svalue,int status) {
        StringBuilder sql=new StringBuilder("select a.*,b.* from" +
                " orderinf a,orderitem b where a.oid=b.oid");
        if(skey!=null&&skey.length()>0&&svalue!=null&&svalue.length()>0){
            //sql.append(" and (a.oid="+svalue+" or b.id="+svalue+") limit ?,?");
            if ("id".equals(skey)){
                sql.append(" and b."+skey+" like \"%"+svalue+"%\" limit ?,?");
                //sql.append(" and (a.receiver=\"%"+svalue+"%\" or a.aphone=\"%"+svalue+"%\") limit ?,?");
            }else {
                sql.append(" and a."+skey+" like \"%"+svalue+"%\" limit ?,?");
            }
        }else {
            sql.append(" limit ?,?");
        }

        return JdbcUtils.find(sql.toString(), startIndex, pageSize);
    }

    /*****订单状态*****/
    public int CountStatus(int status) {
        StringBuilder sql=new StringBuilder("select count(*) from orderinf a,orderitem b " +
                " where a.oid=b.oid and a.status="+status );
        return ((Number) JdbcUtils.selectScalar(sql.toString(),(Object[]) null)).intValue();
    }

    public static List<Map<String, Object>> allOrderStatus(int startIndex, int pageSize,
                                                           int status) {
        System.out.println("到层"+status);
        StringBuilder sql=new StringBuilder("select a.*,b.* from" +
                " orderinf a,orderitem b where a.oid=b.oid and a.status="+status+" limit ?,?");
        return JdbcUtils.find(sql.toString(), startIndex, pageSize);
    }
    /********查看一条订单*********/
    public static Map<String, Object> findOneOrder(String oid) {
        String sql = "select a.goods_name,a.img,b.*, c.id,c.price,c.buycount,c.total,d.phone,d.lasttime " +
                "from goods a,orderinf b,orderitem c,user d " +
                "where a.id=c.id and b.oid=c.oid and b.uid=d.uid and b.oid=? ";
        List<Map<String, Object>> list=JdbcUtils.find(sql, oid);
        return list.get(0);
    }

    /*********************更新记录*********************************/

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

    /**删除一个商品*/
    public static void delete(int id){
        String sql = "delete from goods where id=?";
        JdbcUtils.update(sql,id);
    }
    /**删除多个商品*/
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
