package com.yang.service.impl;

import com.yang.dao.ICustomerDao;
import com.yang.dao.impl.CustomerDaoImpl;
import com.yang.entity.Customer;
import com.yang.service.ICustomerService;

/**
 * 客户服务接口实现类
 */
public class CustomerServiceImpl implements ICustomerService {
    private ICustomerDao customerDao;

    // 用户名最大长度限制（根据数据库字段设置）
    private static final int MAX_USERNAME_LENGTH = 20;

    public CustomerServiceImpl() {
        customerDao = new CustomerDaoImpl();
    }

    @Override
    public boolean register(Customer customer) {
        // 检查用户名是否为空
        if (customer.getUsername() == null || customer.getUsername().trim().isEmpty()) {
            return false;
        }

        // 检查用户名长度
        if (customer.getUsername().length() > MAX_USERNAME_LENGTH) {
            System.out.println("用户名长度超出限制，最大长度为: " + MAX_USERNAME_LENGTH);
            return false;
        }

        // 检查用户名是否已存在
        if (isUsernameExist(customer.getUsername())) {
            return false;
        }

        // 插入新客户
        int result = customerDao.insert(customer);
        return result > 0;
    }

    @Override
    public boolean isUsernameExist(String username) {
        Customer customer = customerDao.findByUsername(username);
        return customer != null;
    }

    @Override
    public Customer findByUsername(String username) {
        return customerDao.findByUsername(username);
    }
}