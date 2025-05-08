package com.yang.service;

import com.yang.entity.Customer;

/**
 * 客户服务接口
 */
public interface ICustomerService {
    /**
     * 注册新客户
     * 
     * @param customer 客户信息
     * @return 是否注册成功
     */
    boolean register(Customer customer);

    /**
     * 检查用户名是否已存在
     * 
     * @param username 用户名
     * @return 是否存在
     */
    boolean isUsernameExist(String username);

    /**
     * 根据用户名查找客户
     * 
     * @param username 用户名
     * @return 客户信息
     */
    Customer findByUsername(String username);
}