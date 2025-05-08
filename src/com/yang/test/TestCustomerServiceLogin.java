package com.yang.test;

import com.yang.entity.Customer;
import com.yang.service.ICustomerService;
import com.yang.service.impl.CustomerServiceImpl;

public class TestCustomerServiceLogin {
    public static void main(String[] args) {
        // 创建服务实例
        ICustomerService customerService = new CustomerServiceImpl();

        // 测试登录功能 - 正确的用户名和密码
        String username = "admin";
        String password = "admin";
        Customer customer = customerService.login(username, password);

        if (customer != null) {
            System.out.println("登录成功！用户信息：" + customer);
        } else {
            System.out.println("登录失败：用户名或密码错误！");
        }

        // 测试登录功能 - 错误的密码
        String wrongPassword = "wrongpassword";
        Customer customerWithWrongPass = customerService.login(username, wrongPassword);

        if (customerWithWrongPass != null) {
            System.out.println("登录成功！用户信息：" + customerWithWrongPass);
        } else {
            System.out.println("登录失败：用户名或密码错误！");
        }

        // 测试登录功能 - 不存在的用户名
        String nonExistUsername = "nonexistuser";
        Customer nonExistCustomer = customerService.login(nonExistUsername, password);

        if (nonExistCustomer != null) {
            System.out.println("登录成功！用户信息：" + nonExistCustomer);
        } else {
            System.out.println("登录失败：用户名或密码错误！");
        }
    }
}