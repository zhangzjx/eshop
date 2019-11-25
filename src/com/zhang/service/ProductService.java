package com.zhang.service;

import com.zhang.dao.ProductDao;
import com.zhang.dom.Photo;
import com.zhang.dom.Product;
import com.zhang.utils.Page;

import java.util.List;
import java.util.Map;

/**
 * @author prayers
 * @date 2019/11/4 9:04
 */
public class ProductService {
    ProductDao productDao = new ProductDao();

    /**添加商品
     * @param goods*/
    public void addGoods(Product goods){
        //直接调用Dao来添加商品
        ProductDao.addGoods(goods);
    }
    /**添加品牌信息*/
    public void addBrand(Photo photo) {
        ProductDao.addBrand(photo);
    }
    public static List<Map<String,Object>> findBrand() {
        return ProductDao.findBrand();
    }
    /**
    public static List<Map<String,Object>> findAllGoods() {
        return ProductDao.findAllGoods();
    }
     */

    /**查询数据并分页*/
    /**查询商品数目及分页，查询搜索结果数目及分页（搜索功能）*/
    public Page findAll(int currentPage,String skey,String svalue) {
        int totalSize = productDao.findCountGoods(skey,svalue);
        Page page = new Page(currentPage,totalSize);
        List<Map<String,Object>> list = ProductDao.findAllGoods(page.getStartIndex(),page.getPageSize(),skey,svalue);
        page.setList(list);
        System.out.println("页码"+page.getCurrentPage());
        return page;
    }
    /**查询品牌数目及分页*/
    public Page findAllBrand(int currentPage) {
        int totalSize = productDao.findCountBrand();
        Page page = new Page(currentPage,totalSize);
        List<Map<String,Object>> list = ProductDao.findAllBrand(page.getStartIndex(),page.getPageSize());
        page.setList(list);
        System.out.println("页码"+page.getCurrentPage());
        return page;
    }

    /**删除一条数据*/
    public  void delete(int id){
        ProductDao.delete(id);
    }
    /**删除多条数据*/
    public void delMore(String[] ids,Object action){
        ProductDao.delMore(ids,action);
    }
    /**查找一条数据*/
    public Map<String, Object> findOne(int id) {
        return ProductDao.findOne(id);
    }
    /**查找一条数据*/
    public Map<String, Object> findOneUp(int id,Object action) {
        return ProductDao.findOneUp(id, action);
    }
    /**根据new对象更新数据*/
    public void update(Product goods, Object action) {
       productDao.update(goods, action);
    }

}
