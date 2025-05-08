package com.yang.test;

import com.yang.dao.impl.CustomerDaoImpl;
import com.yang.entity.Customer;

public class TestCustomerDaoImpl {
    public static void main(String[] args) {
        // 创建CustomerDaoImpl实例
        CustomerDaoImpl customerDao = new CustomerDaoImpl();

        // 测试注册功能
        Customer customer = new Customer("testuser", "password123", "13800138000");
        int result = customerDao.insert(customer);

        if (result > 0) {
            System.out.println("注册成功！");

            // 验证注册结果
            Customer foundCustomer = customerDao.findByUsername("testuser");
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