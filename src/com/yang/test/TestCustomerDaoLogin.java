package com.yang.test;

import com.yang.dao.impl.CustomerDaoImpl;
import com.yang.entity.Customer;

public class TestCustomerDaoLogin {
    public static void main(String[] args) {
        // 创建CustomerDaoImpl实例
        CustomerDaoImpl customerDao = new CustomerDaoImpl();

        // 测试登录功能 - 正确的用户名和密码
        String username = "admin";
        String password = "admin";
        Customer customer = customerDao.login(username, password);

        if (customer != null) {
            System.out.println("登录成功！用户信息：" + customer);
        } else {
            System.out.println("登录失败：用户名或密码错误！");
        }

        // 测试登录功能 - 错误的密码
        String wrongPassword = "wrongpassword";
        Customer customerWithWrongPass = customerDao.login(username, wrongPassword);

        if (customerWithWrongPass != null) {
            System.out.println("登录成功！用户信息：" + customerWithWrongPass);
        } else {
            System.out.println("登录失败：用户名或密码错误！");
        }

        // 测试登录功能 - 不存在的用户名
        String nonExistUsername = "nonexistuser";
        Customer nonExistCustomer = customerDao.login(nonExistUsername, password);

        if (nonExistCustomer != null) {
            System.out.println("登录成功！用户信息：" + nonExistCustomer);
        } else {
            System.out.println("登录失败：用户名或密码错误！");
        }
    }
}