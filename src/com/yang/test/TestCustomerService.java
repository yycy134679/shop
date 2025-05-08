package com.yang.test;

import com.yang.entity.Customer;
import com.yang.service.ICustomerService;
import com.yang.service.impl.CustomerServiceImpl;

public class TestCustomerService {
    public static void main(String[] args) {
        // 创建服务实例
        ICustomerService customerService = new CustomerServiceImpl();

        // 测试用户名是否存在
        String username = "testuser";
        boolean isExist = customerService.isUsernameExist(username);
        System.out.println("用户名 " + username + " 是否存在: " + isExist);

        // 如果用户不存在，则进行注册测试
        if (!isExist) {
            // 测试注册功能
            Customer customer = new Customer(username, "password123", "13800138001");
            boolean result = customerService.register(customer);

            if (result) {
                System.out.println("注册成功！");

                // 验证注册结果
                Customer foundCustomer = customerService.findByUsername(username);
                if (foundCustomer != null) {
                    System.out.println("查询到注册的用户：" + foundCustomer);
                } else {
                    System.out.println("未找到注册的用户！");
                }
            } else {
                System.out.println("注册失败！");
            }
        } else {
            System.out.println("用户名已存在，请尝试其他用户名进行测试！");

            // 尝试使用一个不存在且符合长度限制的用户名
            // 使用时间戳最后4位作为后缀，避免超出长度限制
            String timestamp = String.valueOf(System.currentTimeMillis());
            String shortSuffix = timestamp.substring(timestamp.length() - 4);
            String newUsername = "newuser_" + shortSuffix;
            System.out.println("尝试使用新用户名: " + newUsername);

            Customer customer = new Customer(newUsername, "password123", "13800138002");
            boolean result = customerService.register(customer);

            if (result) {
                System.out.println("注册成功！");

                // 验证注册结果
                Customer foundCustomer = customerService.findByUsername(newUsername);
                if (foundCustomer != null) {
                    System.out.println("查询到注册的用户：" + foundCustomer);
                } else {
                    System.out.println("未找到注册的用户！");
                }
            } else {
                System.out.println("注册失败！");
            }
        }
    }
}