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
import java.net.URLEncoder;

@WebServlet(urlPatterns = "/doReg")
public class DoRegServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求和响应的字符编码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        // 获取表单参数
        String username = req.getParameter("username");
        String pass = req.getParameter("pass");
        String tel = req.getParameter("tel");
        String code = req.getParameter("code");

        // 表单验证
        if (username == null || username.trim().isEmpty() ||
                pass == null || pass.trim().isEmpty() ||
                tel == null || tel.trim().isEmpty()) {
            // 如果必填字段为空，则返回注册页面并显示错误信息
            req.setAttribute("error", "用户名、密码和手机号不能为空！");
            req.getRequestDispatcher("/reg").forward(req, resp);
            return;
        }

        // 验证验证码（这里应该添加真实的验证码验证逻辑）
        if (code == null || code.trim().isEmpty()) {
            req.setAttribute("error", "验证码不能为空！");
            req.getRequestDispatcher("/reg").forward(req, resp);
            return;
        }

        // 目前简单验证，实际项目中应比对真实验证码
        // 此处模拟验证码为"1234"
        /*
         * if (!code.equals("1234")) {
         * req.setAttribute("error", "验证码错误！");
         * req.getRequestDispatcher("/reg").forward(req, resp);
         * return;
         * }
         */

        // 创建Customer对象
        Customer customer = new Customer();
        customer.setUsername(username);
        customer.setPass(pass);
        customer.setTel(tel);

        // 注册用户
        boolean registerSuccess = customerService.register(customer);

        // 处理注册结果
        if (registerSuccess) {
            // 注册成功，将用户信息存入会话
            HttpSession session = req.getSession();
            // 查询完整的用户信息（包含id）
            Customer registeredCustomer = customerService.findByUsername(username);
            session.setAttribute("customer", registeredCustomer);

            // 添加成功消息
            // 对中文消息进行URL编码，防止乱码
            String successMsg = URLEncoder.encode("注册成功！欢迎加入我们！", "UTF-8");

            // 重定向到首页，并带上成功消息参数
            resp.sendRedirect(req.getContextPath() + "/index?message=" + successMsg + "&msgType=success");
        } else {
            // 注册失败，返回注册页面并显示错误信息
            req.setAttribute("error", "注册失败，用户名可能已存在！");
            req.getRequestDispatcher("/reg").forward(req, resp);
        }
    }
}