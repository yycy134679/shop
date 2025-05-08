package com.yang.dao;

import com.yang.entity.Customer;

/**
 * 客户数据访问接口
 */
public interface ICustomerDao extends IBaseDao<Customer> {
    // 根据用户名查找客户
    Customer findByUsername(String username);
}