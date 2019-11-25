package com.zhang.servlet;

import com.zhang.dom.Admin;
import com.zhang.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author prayers
 * @date 2019/10/31 10:36
 */
public class AdminServlet extends javax.servlet.http.HttpServlet {
    public static final String LOGIN = "login";
    public static final String ADDGOODS = "addGoods";
    public static final String FIND_ALL = "findAllGoods";
    public static final String UPDATE_BEFORE_GO = "updateBeforeGo";


    private static final ServletRequest SESSION = null;
    private AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws IOException, ServletException {
        /**
         * 1.处理中文乱码问题
         * 2.根据不同的action进行处理不同的请求
         */
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //获取action的值
        String action = request.getParameter("action");

        if(LOGIN.equals(action)){
            login(request,response);
        } else if(UPDATE_BEFORE_GO.equals(action)) {
            updateBeforeGo(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /**
         * 1.获取表单数据
         * 2.验证表单数据的合法性
         * 3.调用Service层来验证登录是否成功
         * 4.成功，保存登录信息，跳转到index.jsp
         * 5.失败，跳转到msg.jsp
         */
        //1.获取表单数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role= request.getParameter("role");

        System.out.println(username+password+role);
        Map<String,String> error = new HashMap<String,String>(16);
        //2.验证表单数据的合法性
        //验证用户名是否为空
        if(username == null || username.trim().isEmpty()){
            error.put("uererror","用户名不能为空！");
        }
        //验证密码是否为空
        if(password == null || password.trim().isEmpty()){
            error.put("pwerror","密码不能为空！");
        }
        //说明有表单内容为空
        if(error.size()>0){
            request.setAttribute("error", error);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        //3.调用Service层来验证登录是否成功
        boolean flag = AdminService.validate(username, password,role);
        //4.成功，保存登录信息，跳转到index.jsp
        if(flag){
            //登录成功
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);
            System.out.println("登陆成功");
            response.sendRedirect(request.getContextPath()+"/Admin/manageIndex.jsp");
        }
        else{
            //5.失败，跳转到msg.jsp
            request.setAttribute("msg", "用户名或密码错误！");
            request.getRequestDispatcher("/msg.jsp").forward(request, response);
        }
    }

    private void updateBeforeGo(HttpServletRequest request, HttpServletResponse response)
             {
    }


}


