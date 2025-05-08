package com.yang.controller;

import com.yang.entity.Customer;
import com.yang.service.ICustomerService;
import com.yang.service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/doLogin")
public class DoLoginServlet extends HttpServlet {
    // 引入服务层对象
    private ICustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取请求参数
        String username = req.getParameter("username");
        String password = req.getParameter("pass");

        // 调用服务层方法进行登录验证
        Customer customer = customerService.login(username, password);

        // 判断登录是否成功
        if (customer != null) {
            // 登录成功，将用户信息存入session
            HttpSession session = req.getSession();
            session.setAttribute("customer", customer);

            // 重定向到首页
            resp.sendRedirect("/index");
        } else {
            // 登录失败，将错误信息存入request
            req.setAttribute("loginError", "用户名或密码错误，请重新输入");

            // 转发回登录页面
            req.getRequestDispatcher("/login").forward(req, resp);
        }
    }
}