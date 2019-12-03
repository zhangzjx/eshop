package com.zhang.servlet;

import com.zhang.dom.Cart;
import com.zhang.dom.User;
import com.zhang.exception.UserException;
import com.zhang.service.UserService;
import com.zhang.utils.DateUtils;
import com.zhang.utils.MD5;
import com.zhang.utils.Page;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author prayers
 * @date 2019/11/11 16:01
 */
public class UserServlet extends HttpServlet {
    public static final String REGIST = "regist";
    public static final String VALIDATE_NAME = "validateName";
    public static final String LOGIN = "login";
    public static final String MY_CART = "myCart";
    public static final String ADD_CART = "addCart";
    public static final String INDEX_GOODS = "indexGoods";
    public static final String FIND_ONE = "findOne";
    public static final String NULL = "null";
    public static final String ALL_GOODS = "allGoods";
    public static final String DESC = "desc";
    public static final String ASC = "asc";
    public static final String CHANGE_ADDRESS = "changeAddress";
    public static final String CHANGE_DEFAULT = "changeDefault";
    public static final String DEL_ADDRESS = "delAddress";
    public static final String ADD_ADDRESS = "addAddress";
    public static final String FIND_ADDRESS = "findAddress";
    public static final String ORDER_PAY = "orderPay";
    public static final String ZERO = "0";
    public static final String ONE = "1";
    public static final String TWO = "2";
    public static final String THREE = "3";
    public static final String FOUR = "4";
    public static final String ADD_ORDER = "addOrder";
    public static final String SUB_ORDER = "subOrder";
    public static final String PAY_ORDER = "payOrder";


    private UserService userService = new UserService();

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
        if(REGIST.equals(action)){
            regist(request,response);
        } else if(VALIDATE_NAME.equals(action)){
            validateName(request, response);
        } else if(LOGIN.equals(action)){
            login(request, response);
        } else if(MY_CART.equals(action)){
            myCart(request, response);
        } else if(ADD_CART.equals(action)){
            addCart(request, response);
        } else if(INDEX_GOODS.equals(action)){
            indexGoods(request, response);
        } else if(FIND_ONE.equals(action)) {
            findOne(request, response);
        } else if(ALL_GOODS.equals(action)||DESC.equals(action)||ASC.equals(action)) {
            allGoods(request, response);
        } else if(ADD_ADDRESS.equals(action)){
            addAddress(request, response);
        } else if(CHANGE_ADDRESS.equals(action)){
            changeAddress(request, response);
        } else if(DEL_ADDRESS.equals(action)){
            delAddress(request, response);
        } else if(CHANGE_DEFAULT.equals(action)){
            changeDefault(request, response);
        } else if(FIND_ADDRESS.equals(action)){
            findAddress(request, response);
        } else if(ORDER_PAY.equals(action)){
            orderStatus(request, response);
        } else if(ADD_ORDER.equals(action)){
            addOrder(request, response);
        } else if(SUB_ORDER.equals(action)){
            subOrder(request, response);
        } else if(PAY_ORDER.equals(action)){
            payOrder(request, response);
        }

    }
    /*****添加订单第一步，获取商品信息及地址信息******/
    private void addOrder(HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        String uid = request.getParameter("uid");
        String[] cids = request.getParameter("ids").split(",");
        String cid = cids[0];
        String price = request.getParameter("price");
        System.out.println("用户id"+uid);
        System.out.println("购物车id为"+cid);
        System.out.println("商品总价"+price);
        HttpSession session = request.getSession();
        session.setAttribute("price", price);

        request.getSession().setAttribute("order", userService.addOrder(uid, cid));
        response.sendRedirect(request.getContextPath() + "/User/order.jsp");
    }
    /*****添加订单第二步，提交商品信息及地址信息，等待付款******/
    private void subOrder(HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));
        int cid = Integer.parseInt(request.getParameter("cid"));
        double totalPrice= Double.parseDouble(request.getParameter("totalPrice"));
        int aphone = Integer.parseInt(request.getParameter("aphone"));
        String address= request.getParameter("address");
        String receiver = request.getParameter("receiver");
        int status = Integer.parseInt(request.getParameter("status"));
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity=Integer.parseInt(request.getParameter("quantity"));
        System.out.println(uid+" "+totalPrice+" "+aphone+" "+address+" "+receiver+" "+status);

        Cart order = new Cart();
        Cart orderItem = new Cart();
        try {
            String oid = DateUtils.nowTimeName();
            order.setOid(oid);
            orderItem.setOid(oid);
            //oid存入session
            HttpSession session = request.getSession();
            session.setAttribute("oid", oid);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        order.setUid(uid);

        order.setPrice(totalPrice);
        order.setAphone(aphone);
        order.setAddress(address);
        order.setReceiver(receiver);
        order.setStatus(status);
        try {
            order.setAddTime(DateUtils.nowTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        orderItem.setId(id);
        orderItem.setQuantity(quantity);
        //4.调用Service中add方法添加一条新闻
        userService.subOrder(order,cid);
        userService.subOrderItem(orderItem);
        //返回添加成功的信息

        request.setAttribute("msg","添加成功");
        response.sendRedirect(request.getContextPath()+"/User/pay.jsp");
    }
    /*****添加订单第三步，付款成功，等待发货******/
    private void payOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String oid = request.getParameter("oid");
        String status = request.getParameter("status");
        System.out.println(oid+status);
        Cart order = new Cart();

        order.setOid(oid);
        order.setStatus(Integer.parseInt(status));

        userService.payOrder(order);
        response.sendRedirect(request.getContextPath()+"/User/centerSettingAddress.jsp");
    }

    /********查看订单状态*********/
    private void orderStatus(HttpServletRequest request,
                             HttpServletResponse response) throws IOException {
        String uid = request.getParameter("uid");
        String status = request.getParameter("status");
        System.out.println(uid+" "+status);
        request.getSession().setAttribute("order", userService.orderStatus(uid, status));
        if(ZERO.equals(status)) {
            response.sendRedirect(request.getContextPath() + "/User/centerOrderPay.jsp");
        } else if(ONE.equals(status)) {
            response.sendRedirect(request.getContextPath() + "/User/centerOrderPay.jsp");
        } else if(TWO.equals(status)) {
            response.sendRedirect(request.getContextPath() + "/User/centerOrderSend.jsp");
        } else if(THREE.equals(status)) {
            response.sendRedirect(request.getContextPath() + "/User/centerOrderReceive.jsp");
        } else if(FOUR.equals(status)) {
            response.sendRedirect(request.getContextPath() + "/User/centerOrderEvaluate.jsp");
        }
    }


    private void allGoods(HttpServletRequest request,
                          HttpServletResponse response) throws IOException {

        String skey = request.getParameter("sKey");
        String svalue=request.getParameter("sValue");
        //sort排序规则-升序还是降序 sortKey根据哪一列排序
        String sort = request.getParameter("sort");
        String sortKey = request.getParameter("sortKey");
        String current = request.getParameter("currentPage");
        System.out.println(sortKey);
        int currentPage = 1;
        try{
            currentPage = Integer.parseInt(current);
        }catch(Exception e){
            currentPage = 1;
        }
        //1.获取购物车内容列表，调用Service的findAll方法,
        // 2.将获取的商品列表保存到request中
        Page page = userService.allGoods(currentPage,skey,svalue,sort,sortKey);
        request.getSession().setAttribute("allGoods",page);
        response.sendRedirect(request.getContextPath()+"/User/allGoods.jsp");
    }


    /**
     * 加入购物车*/
    private void addCart(HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        /*
         * 1.获取前台传入的商品id以及购买的数量，根据id拿到对应的商品信息
         * 2.从session中取出购物车，判断购物车是否存在
         * 3.不存在，则新建一个购物车并把商品加入进去
         * 4.存在的话，再判断该购物车里是否已经有该商品,把购物车和总价存入到session中
         * 5.跳转到cart.jsp页面
         */
        int uid=Integer.parseInt(request.getParameter("uid"));
        int id=Integer.parseInt(request.getParameter("id"));
        int quantity=Integer.parseInt(request.getParameter("quantity"));
        double price= Double.parseDouble(request.getParameter("price"));

        System.out.println(uid+""+id+""+quantity+""+price);

        Cart goods = new Cart();
        goods.setUid(uid);
        goods.setId(id);
        goods.setQuantity(quantity);
        goods.setPrice(price);
        try {
            goods.setAddTime(DateUtils.nowTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //4.调用Service中add方法添加一条新闻
        userService.addCart(goods);
        //返回添加成功的信息
        request.setAttribute("msg","添加成功");
        response.sendRedirect(request.getContextPath()+"/User/index.jsp");
       /**
        Map<String,Object> map = userService.findSingle(id);
        List<Map<String,Object>> cart=null;
        HttpSession session=request.getSession();
        cart=(List<Map<String, Object>>) session.getAttribute("cart");
        float price=Float.parseFloat(map.get("price").toString());
        float totalprice=0;

        if(cart==null){
            cart=new ArrayList<Map<String,Object>>();
            map.put("buycount", buycount);
            map.put("total", BaseCalculate.multiply(buycount, price));
            cart.add(map);
            totalprice=BaseCalculate.multiply(buycount, price);
        }else{
            boolean incart=false;
            for(int i=0;i<cart.size();i++){
                Map<String,Object> item=cart.get(i);
                if(item.get("productid").equals(map.get("productid"))){
                    buycount=buycount+Integer.parseInt(item.get("buycount").toString());
                    item.put("buycount", buycount);
                    item.put("total",BaseCalculate.multiply(buycount, price));
                    incart=true;
                    totalprice= BaseCalculate.add(totalprice,BaseCalculate.multiply(buycount, price));
                }else{
                    totalprice=BaseCalculate.add(totalprice,Float.parseFloat(item.get("total").toString()));
                }
            }
            if(incart==false){
                map.put("buycount", buycount);
                map.put("total",BaseCalculate.multiply(buycount, price));
                cart.add(map);
                totalprice=BaseCalculate.add(totalprice,BaseCalculate.multiply(buycount, price));
            }
        }
        session.setAttribute("cart", cart);
        session.setAttribute("totalprice",totalprice);
        response.sendRedirect(request.getContextPath()+"/cart.jsp");
        */
    }

    /**查询数据并分页
     * 根据关键词查找数据并传递到另一个页面(搜索)
     */
    private void myCart(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));
        String skey = request.getParameter("sKey");
        String svalue=request.getParameter("sValue");
        String current = request.getParameter("currentPage");
        int currentPage = 1;
        try{
            currentPage = Integer.parseInt(current);
        }catch(Exception e){
            currentPage = 1;
        }
        //1.获取购物车内容列表，调用Service的findAll方法,
        // 2.将获取的商品列表保存到request中
        Page page = userService.findAllCart(uid,currentPage,skey,svalue);
        request.getSession().setAttribute("myCart",page);
        //3.将请求转发到news_list.jsp页面
        response.sendRedirect(request.getContextPath()+"/User/cart.jsp");
        //request.getRequestDispatcher("/User/cart.jsp").forward(request, response);
    }

    private void regist(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        /*
         * 1.获取前台用户输入的数据
         * 2.对数据进行验证
         * 3.把数据封装到User中，提交给Service层进行添加
         * 4.提示添加成功，跳转到登录页面（防止重复刷新问题）
         */
        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password1 = request.getParameter("passwordTwo");
        String phone = request.getParameter("phone");
        System.out.println(name+email+password);
        
        if(name==null||name.trim().isEmpty()){
            request.setAttribute("error", "用户名不可为空");
            System.out.println("用户名为空");
            response.sendRedirect(request.getContextPath()+"/User/register.jsp");
            return;
        }else if(!password.equals(password1)){
            request.setAttribute("error", "两次输入密码不一致，请重新输入");
            System.out.println("密码不一致");
            response.sendRedirect(request.getContextPath()+"/User/register.jsp");
            return;
        }
        else if(password==null||password.trim().isEmpty()){
            request.setAttribute("error", "密码不可为空");
            response.sendRedirect(request.getContextPath()+"/User/register.jsp");
            return;
        }
        //验证邮箱的正则表达式
        String regex="^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$";
        Pattern p=Pattern.compile(regex);
        Matcher m=p.matcher(email);
        if(!m.find()){
            request.setAttribute("error", "邮箱格式不正确");
            response.sendRedirect(request.getContextPath()+"/User/register.jsp");
            return;
        }
        password = MD5.md5(password);
        User user=new User();
        user.setName(name);
        user.setPassword(password);
        user.setPhone(Integer.parseInt(phone));
        user.setEmail(email);
        userService.regist(user);
        request.setAttribute("msg","<script>alert('注册成功')</script>");
        response.sendRedirect(request.getContextPath()+"/User/loginUser.html");
    }
    private void login(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        /**
         * 1.获取用户名和密码
         * 2.对数据进行验证（自己课后写）
         * 3.调用Service层进行用户的查找
         * 4.匹配成功则跳转到index.jsp页面
         */
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        int uid = 0;
        System.out.println(name+password);
        password = MD5.md5(password);
        try {
            User user = userService.login(uid,name,password);

            userService.updateLastLoginTime(user);
            //把用户信息保存到session中
            HttpSession session = request.getSession();
            request.getSession().setAttribute("user",user);
            //登录成功调用方法，显示首页商品,将获取的商品列表保存到request中
            //request.getSession().setAttribute("myIndex",userService.findAll());
            session.setAttribute("name", name);
            /**response.sendRedirect重定向，浏览器地址发生变化，另外打开一个页面，网址改变
             * .fpward转发可以带参数,网址不变
             *request.getRequestDispatcher("/User/cart.jsp").forward(request, response);
             **/
            response.sendRedirect(request.getContextPath()+"/User/index.jsp");
        } catch (UserException e) {
            request.setAttribute("error", e.getMessage());
            //两个页面合到一起jsp:.forwrad
            response.sendRedirect(request.getContextPath()+"/User/loginUser.html");
        }
    }
    /**首页商品*/
    private void indexGoods(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().setAttribute("myIndex",userService.findAll());
        response.sendRedirect(request.getContextPath()+"/User/index.jsp");
    }

    private void validateName(HttpServletRequest request,
                              HttpServletResponse response) throws IOException {
        /**
         * 1.从前台获取name
         * 2.调用Service层查找用户
         * 3.获取返回结果，提交给前台
         * */
        String name = request.getParameter("user");
        System.out.println("获得的内容"+name);
        boolean result = userService.validateName(name);
        response.getWriter().print(result);
    }

    /**根据id查看一条数据并传递到另一个页面**/
    private void findOne(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        //1.获取商品列表，调用Service的findAll方法,2.将获取的商品列表保存到request中
        Map<String, Object> map = userService.findOne(Integer.parseInt(id));
        request.getSession().setAttribute("map",map);
        //3.将请求转发到news_list.jsp页面
        response.sendRedirect(request.getContextPath()+"/User/goodsItem.jsp");
        //request.getRequestDispatcher("/User/goodsItem.jsp").forward(request, response);
    }

    private void addAddress(HttpServletRequest request, HttpServletResponse response) {
        String uid = request.getParameter("uid");
        String address = request.getParameter("address");
        String status= request.getParameter("status");

        User m = new User();

        m.setUid(Integer.parseInt(uid));
        m.setAddress(address);
        m.setStatus(Integer.parseInt(status));
        userService.updateAddress(m);
    }

    /******查看所有地址*******/
    private void findAddress(HttpServletRequest request,
                             HttpServletResponse response) throws IOException {
        String uid = request.getParameter("uid");

        request.getSession().setAttribute("allAddress",userService.allAddress(uid));
        response.sendRedirect(request.getContextPath()+"/User/centerSettingAddress.jsp");
    }
    private void delAddress(HttpServletRequest request, HttpServletResponse response) {
        String aid = request.getParameter("aid");
        userService.delAddress(Integer.parseInt(aid));
    }

    private void changeDefault(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String aid = request.getParameter("aid");
        String uid = request.getParameter("uid");
        String status = request.getParameter("status");
        System.out.println(aid+uid+status);
        User m = new User();

        m.setAid(Integer.parseInt(aid));
        m.setUid(Integer.parseInt(uid));
        m.setStatus(Integer.parseInt(status));

        userService.updateDefault(m);
        response.sendRedirect(request.getContextPath()+"/User/centerSettingAddress.jsp");
    }

    private void changeAddress(HttpServletRequest request,
                               HttpServletResponse response) throws IOException {

        String aid = request.getParameter("aid");
        String uid = request.getParameter("uid");
        String address = request.getParameter("address");

        System.out.println(aid+" "+uid+" "+address);
        User m = new User();
        m.setAid(Integer.parseInt(aid));
        m.setUid(Integer.parseInt(uid));
        m.setAddress(address);

        userService.updateAddress(m);
        response.sendRedirect(request.getContextPath()+"/User/centerSettingAddress.jsp");
    }
    
}
