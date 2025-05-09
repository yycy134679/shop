package com.yang.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/infoCenter")
public class InfoCenterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 检查用户是否已登录
        if (req.getSession().getAttribute("customer") == null) {
            // 未登录，重定向到登录页面
            req.getRequestDispatcher("/login").forward(req, resp);
        } else {
            // 已登录，转发到个人中心页面
            req.getRequestDispatcher("infoCenter.jsp").forward(req, resp);
        }
    }
}
