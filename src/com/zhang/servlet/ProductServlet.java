package com.zhang.servlet;

import com.zhang.dom.Product;
import com.zhang.service.ProductService;
import com.zhang.utils.DateUtils;
import com.zhang.utils.Lsh;
import com.zhang.utils.Page;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;

/**
 * @author prayers
 * @date 2019/11/4 9:08
 */

public class ProductServlet extends HttpServlet {
    public static final String ADDGOODS = "addGoods";
    public static final String FIND_ALL = "findAllGoods";
    public static final String FIND_ALL_BRAND = "findAllBrand";
    public static final String ADD_BRAND = "addBrand";
    public static final String FIND_ONE = "findOne";
    public static final String SEARCH_GO = "searchGo";
    public static final String DELETE_GO = "deleteGo";
    public static final String FIND_BRAND = "findBrand";
    public static final String DEL_GO_MOR = "delGoMor";
    public static final String DEL_BR_MOR = "delBrMor";
    public static final String UPDATE_BEFORE_GO = "updateBeforeGo";
    public static final String UPDATE_BEFORE_BR = "updateBeforeBr";
    public static final String UPDATE_GO = "updateGo";
    public static final String UPDATE_BR = "updateBr";
    public static final String FIND_ALL_ORDER = "findAllOrder";
    public static final String SEARCH_ORDER= "searchOrder";
    public static final String ORDER_STATUS = "orderStatus";
    public static final String ONE = "1";
    public static final String TWO = "2";
    public static final String THREE = "3";
    public static final String FOUR = "4";
    public static final String FIND_ONE_ORDER = "findOneOrder";
    public static final String FIND_ALL_SORT = "findAllSort";
    public static final String FIND_SORT = "findSort";


    private static final ServletRequest SESSION = null;
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        /**
         * 1.处理中文乱码问题
         * 2.根据不同的action进行处理不同的请求
         */
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //获取action的值
        String action = request.getParameter("action");

        if(ADDGOODS.equals(action)){
            addGoods(request,response);
        } else if(ADD_BRAND.equals(action)){
            addBrand(request, response);
        }else if(FIND_ALL.equals(action)||SEARCH_GO.equals(action)){
            findAllGoods(request, response);
        } else if(FIND_ALL_BRAND.equals(action)) {
            findAllBrand(request, response);
        } else if(FIND_BRAND.equals(action)) {
            findBrand(request, response);
        } else if(FIND_ONE.equals(action)) {
            findOne(request, response);
        } else if(DELETE_GO.equals(action)) {
            deleteGo(request, response);
        } else if(DEL_GO_MOR.equals(action)||DEL_BR_MOR.equals(action)) {
            delMore(request, response);
        } else if(UPDATE_BEFORE_GO.equals(action)||UPDATE_BEFORE_BR.equals(action)) {
            updateBefore(request, response);
        }else if(UPDATE_GO.equals(action)||UPDATE_BR.equals(action)) {
            update(request, response);
        }else if(FIND_ALL_ORDER.equals(action)||SEARCH_ORDER.equals(action)){
            findAllOrder(request, response);
        } else if(ORDER_STATUS.equals(action)){
            orderStatus(request, response);
        }else if(FIND_ONE_ORDER.equals(action)){
            findOneOrder(request, response);
        } else if(FIND_ALL_SORT.equals(action)){
            findAllSort(request, response);
        } else if(FIND_SORT.equals(action)){
            findSort(request, response);
        }

    }
    /********查看分类*********/
    private void findSort(HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        request.getSession().setAttribute("sort", productService.findSort());
        response.sendRedirect(request.getContextPath() + "/Admin/addSort.jsp");
    }
    /********查看商品分类*********/

    private void findAllSort(HttpServletRequest request,
                             HttpServletResponse response) throws ServletException, IOException {
        String sort_level = request.getParameter("sort_level");
        String id = request.getParameter("id");
        String current = request.getParameter("currentPage");
        System.out.println("级别为"+sort_level);
        System.out.println("页码为"+current);
        System.out.println("id为"+id);
        int currentPage = 1;
        try{
            currentPage = Integer.parseInt(current);
        }catch(Exception e){
            currentPage = 1;
        }
        //1.获取商品列表，调用Service的findAll方法,2.将获取的商品列表保存到request中
        Page page = productService.sort(currentPage,sort_level,id);
        request.getSession().setAttribute("sort", page);
        if(ONE.equals(sort_level)) {
            response.sendRedirect(request.getContextPath() + "/Admin/goodsSort.jsp");
        }else if(TWO.equals(sort_level)) {
            response.sendRedirect(request.getContextPath() + "/Admin/goodsSortSecond.jsp");
        }else if(THREE.equals(sort_level)) {
            response.sendRedirect(request.getContextPath() + "/Admin/goodsSortThird.jsp");
        }
    }
    /********查看订单状态*********/
    private void orderStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = request.getParameter("status");
        String current = request.getParameter("currentPage");
        System.out.println(s);
        int status = 0;
        int currentPage = 1;
        try{
            status = Integer.parseInt(s);
            currentPage = Integer.parseInt(current);
        }catch(Exception e){
            currentPage = 1;
        }
        //1.获取商品列表，调用Service的findAll方法,2.将获取的商品列表保存到request中
        /**Page page = productService.findAll(currentPage);*/
        Page page = productService.orderStatus(currentPage,status);
        System.out.println("servlet执行");
        request.setAttribute("myOrder",page);
        /**request.setAttribute("myList", ProductService.findAllGoods());*/
        //3.将请求转发到news_list.jsp页面
        request.getRequestDispatcher("/Admin/orderList.jsp").forward(request, response);
    }

    /**查询数据并分页,查找订单
     * 根据关键词查找数据并传递到另一个页面(搜索功能)
     */
    private void findAllOrder(HttpServletRequest request,
                              HttpServletResponse response) throws ServletException, IOException {
        /**1.获取当前页码，如无当前页码默认为1
         * 2.获取商品列表，调用Service的findAll方法
         *   2.1调用Service层根据页码来获取Page对象
         * 3.将获取的商品列表保存到request中
         *   3.1将Page对象保存到request中
         * 4.将请求转发到goods_list.jsp页面
         */
        String s = request.getParameter("status");
        String skey = request.getParameter("sKey");
        String svalue = request.getParameter("sValue");
        String current = request.getParameter("currentPage");
        System.out.println(s);
        int status = 0;
        int currentPage = 1;
        try{
            status = Integer.parseInt(s);
            currentPage = Integer.parseInt(current);
        }catch(Exception e){
            status = 0;
            currentPage = 1;
        }
        //1.获取商品列表，调用Service的findAll方法,2.将获取的商品列表保存到request中
        /**Page page = productService.findAll(currentPage);*/
        Page page = productService.findAllOrder(currentPage,skey,svalue,status);
        request.setAttribute("myOrder",page);
        /**request.setAttribute("myList", ProductService.findAllGoods());*/
        //3.将请求转发到news_list.jsp页面
        request.getRequestDispatcher("/Admin/orderList.jsp").forward(request, response);
    }
    /********查看一条订单*********/
    private void findOneOrder(HttpServletRequest request,
                              HttpServletResponse response) throws ServletException, IOException {
        String oid = request.getParameter("oid");
        String status = request.getParameter("status");
        System.out.println("订单id"+oid+"订单状态"+status);
        Map<String, Object> map = productService.findOneOrder(oid);
        request.getSession().setAttribute("map",map);
        //1.获取商品列表，调用Service的findAll方法,
        //2.将获取的商品列表保存到request中
        //3.将请求转发到news_list.jsp页面
        if(ONE.equals(status)) {
            response.sendRedirect(request.getContextPath() + "/Admin/orderDetails.jsp");
            //request.getRequestDispatcher("/Admin/orderDetails.jsp").forward(request, response);
        } else if(TWO.equals(status)) {
            response.sendRedirect(request.getContextPath() + "/Admin/orderDetailsOne.jsp");
        } else if(THREE.equals(status)) {
            response.sendRedirect(request.getContextPath() + "/Admin/orderDetailsTwo.jsp");
        } else if(FOUR.equals(status)) {
            response.sendRedirect(request.getContextPath() + "/Admin/orderDetailsThree.jsp");
        } else if("66".equals(status)) {
            response.sendRedirect(request.getContextPath() + "/Admin/orderDetailsClose.jsp");
        }
    }

    private void addGoods(javax.servlet.http.HttpServletRequest request,
                          javax.servlet.http.HttpServletResponse response) throws ServletException, IOException {

        String num = String.valueOf(00012);
        String gid = Lsh.getNewEquipmentNo("1000", num);
        String goodsName = request.getParameter("goods_name");
        String categories = request.getParameter("categories");
        String categoriesTwo = request.getParameter("categories_two");
        String price = request.getParameter("price");
        String skey = request.getParameter("skey");
        String sku = request.getParameter("sku");
        String content = request.getParameter("content");
        String bid = request.getParameter("bid");

        System.out.println(gid+goodsName+categories+price+categoriesTwo+content);
        //3.封装到goods对象中
        Product goods = new Product();
        goods.setGid(gid);
        goods.setGoodsName(goodsName);
        goods.setCategories(categories);
        goods.setCategoriesTwo(categoriesTwo);
        goods.setPrice(price);
        goods.setSkey(skey);
        goods.setSku(sku);
        goods.setContent(content);
        goods.setBid(Integer.parseInt(bid));
        try {
            goods.setPublishedDate(DateUtils.nowTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //4.调用Service中add方法添加一条新闻
        productService.addGoods(goods);
        //返回添加成功的信息
        request.setAttribute("msg","添加成功");
        findAllGoods(request,response);
    }
    /**添加品牌*/
    private void addBrand(javax.servlet.http.HttpServletRequest request,
                          javax.servlet.http.HttpServletResponse response)
            throws ServletException, IOException {

        String brandName = request.getParameter("brand_name");
        String brandFirst = request.getParameter("brand_first");

        System.out.println(brandName+brandFirst);
        //3.封装到goods对象中
        Product goods = new Product();

        goods.setBrandName(brandName);
        goods.setBrandFirst(brandFirst);
        try {
            goods.setPublishedDate(DateUtils.nowTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //4.调用Service中add方法添加一条新闻
        productService.addGoods(goods);
        //返回添加成功的信息
        request.setAttribute("msg","添加成功");
        findAllBrand(request,response);
    }

    /**查询数据并分页
     * 根据关键词查找数据并传递到另一个页面(搜索功能)
     */
    public void findAllGoods(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /**1.获取当前页码，如无当前页码默认为1
         * 2.获取商品列表，调用Service的findAll方法
         *   2.1调用Service层根据页码来获取Page对象
         * 3.将获取的商品列表保存到request中
         *   3.1将Page对象保存到request中
         * 4.将请求转发到goods_list.jsp页面
         */
        String skey = request.getParameter("sKey");
        String svalue=request.getParameter("sValue");
        String current = request.getParameter("currentPage");
        int currentPage = 1;
        try{
            currentPage = Integer.parseInt(current);
        }catch(Exception e){
            currentPage = 1;
        }
        //1.获取商品列表，调用Service的findAll方法,2.将获取的商品列表保存到request中
        /**Page page = productService.findAll(currentPage);*/
        Page page = productService.findAll(currentPage,skey,svalue);
        request.setAttribute("myList",page);
        /**request.setAttribute("myList", ProductService.findAllGoods());*/
        //3.将请求转发到news_list.jsp页面
        request.getRequestDispatcher("/Admin/goodsList.jsp").forward(request, response);
    }
    /**查看所有的品牌*/
    public void findAllBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String current = request.getParameter("currentPage");
        int currentPage = 1;
        try{
            currentPage = Integer.parseInt(current);
        }catch(Exception e){
            currentPage = 1;
        }
        //1.获取商品列表，调用Service的findAll方法,2.将获取的商品列表保存到request中
        Page page = productService.findAllBrand(currentPage);
        request.setAttribute("myBrand",page);
        //3.将请求转发到news_list.jsp页面
        request.getRequestDispatcher("/Admin/brandList.jsp").forward(request, response);
    }

    /**查找品牌把数据返回添加商品页面（无效）*/
    private void findBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //1.获取商品列表，调用Service的findAll方法,2.将获取的商品列表保存到request中
        request.setAttribute("myBrand", ProductService.findBrand());
        //3.将请求转发到news_list.jsp页面
        request.getRequestDispatcher("/Admin/addGoodsLink.jsp").forward(request, response);
    }


    /**根据id查看一条数据并传递到另一个页面**/
    private void findOne(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        //1.获取商品列表，调用Service的findAll方法,2.将获取的商品列表保存到request中
        Map<String, Object> map = productService.findOne(Integer.parseInt(id));
        request.setAttribute("map",map);
        //3.将请求转发到news_list.jsp页面
        request.getRequestDispatcher("/Admin/goodsDes.jsp").forward(request, response);
    }
    /**获取更新之前的数据返回修改界面*/
    private void updateBefore(HttpServletRequest request,
                              HttpServletResponse response) throws ServletException, IOException {

        String id=request.getParameter("id");
        String action = request.getParameter("action");
        if(UPDATE_BEFORE_GO.equals(action)){
            Map<String, Object> before = productService.findOneUp(Integer.parseInt(id),action);
            request.setAttribute("before", before);
            request.getRequestDispatcher("/Admin/updateGoods.jsp").forward(request,response);
        }else if(UPDATE_BEFORE_BR.equals(action)){
            Map<String, Object> map = productService.findOneUp(Integer.parseInt(id),action);
            request.setAttribute("map", map);
            request.getRequestDispatcher("/Admin/updateGoods.jsp").forward(request,response);

        }
    }
    /**更新数据返回修改界面*/
    private void update(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException {

        String id=request.getParameter("id");
        String price = request.getParameter("price");
        String skey = request.getParameter("skey");
        String sku = request.getParameter("sku");
        String content = request.getParameter("content");
        String action = request.getParameter("action");
        System.out.println(id+" "+price+" "+skey+" "+sku+content);

        Product goods = new Product();
        if(UPDATE_GO.equals(action)){
            goods.setId(Integer.parseInt(id));
            goods.setPrice(price);
            goods.setSkey(skey);
            goods.setSku(sku);
            try {
                goods.setPublishedDate(DateUtils.nowTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            productService.update(goods,action);
            findAllGoods(request,response);
        }else if(UPDATE_BR.equals(action)){
            productService.findOneUp(Integer.parseInt(id),action);
            updateBefore(request,response);

        }
    }

    private void deleteGo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /**1.获取id
         * 2.调用Service进行删除
         * 3.获取商品列表，直接调用findAll方法
         */
        //1.获取id
        String id = request.getParameter("id");
        System.out.println(id);
        //2.调用Service进行删除
        productService.delete(Integer.parseInt(id));
        //3.获取新闻列表，直接调用findAll方法
        findAllGoods(request,response);
    }
    private void delMore(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(DEL_GO_MOR.equals(action)){
            //获取前台的ids
            String[] ids = request.getParameter("ids").split(",");
            productService.delMore(ids, action);
            findAllGoods(request, response);
        }else if(DEL_BR_MOR.equals(action)){
            String[] ids = request.getParameter("ids").split(",");
            productService.delMore(ids, action);
            findAllBrand(request, response);
        }
    }

}