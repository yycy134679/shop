package com.yang.controller;

import com.yang.service.ICustomerService;
import com.yang.service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/checkUsername")
public class CheckUsernameServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求和响应的字符编码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/plain;charset=UTF-8");

        // 获取要检查的用户名
        String username = req.getParameter("username");

        if (username != null && !username.trim().isEmpty()) {
            // 检查用户名是否已存在
            boolean exists = customerService.isUsernameExist(username);

            // 返回检查结果
            if (exists) {
                resp.getWriter().write("unavailable");
            } else {
                resp.getWriter().write("available");
            }
        } else {
            resp.getWriter().write("invalid");
        }
    }
}