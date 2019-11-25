package com.zhang.servlet;

import com.zhang.dom.User;
import com.zhang.exception.UserException;
import com.zhang.service.UserService;
import com.zhang.utils.BaseCalculate;
import com.zhang.utils.MD5;
import com.zhang.utils.Page;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
        }

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
        int id=Integer.parseInt(request.getParameter("id"));
        int buycount=Integer.parseInt(request.getParameter("buycount"));
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
    }

    /**查询数据并分页
     * 根据关键词查找数据并传递到另一个页面(搜索)
     */
    private void myCart(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
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
        Page page = userService.findAllCart(currentPage,skey,svalue);
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
        System.out.println(name+password);
        password = MD5.md5(password);
        try {
            User user = userService.login(name,password);
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
    
}
