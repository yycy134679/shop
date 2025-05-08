package com.yang.dao.impl;

import com.yang.dao.Db;
import com.yang.dao.ICustomerDao;
import com.yang.entity.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 客户数据访问实现类
 */
public class CustomerDaoImpl extends Db implements ICustomerDao {
    private Connection conn = getConn();
    private Statement stmt = null;
    private PreparedStatement prst = null;
    private ResultSet rs = null;

    @Override
    public Customer findByUsername(String username) {
        Customer customer = null;
        String sql = "SELECT * FROM customer WHERE username=?";
        try {
            prst = conn.prepareStatement(sql);
            prst.setString(1, username);
            rs = prst.executeQuery();

            if (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setUsername(rs.getString("username"));
                customer.setPass(rs.getString("pass"));
                customer.setTel(rs.getString("tel"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (prst != null)
                    prst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customer;
    }

    @Override
    public Customer login(String username, String password) {
        String sql = "select * from customer where username=? and pass=?";
        Customer customer = null;
        try {
            prst = conn.prepareStatement(sql);
            prst.setString(1, username);
            prst.setString(2, password);
            rs = prst.executeQuery();
            // 展开结果集数据库
            if (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setUsername(rs.getString("username"));
                customer.setPass(rs.getString("pass"));
                customer.setTel(rs.getString("tel"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (prst != null)
                    prst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customer;
    }

    @Override
    public List<Customer> findByProp(HashMap<String, Object> prop) {
        Customer customer = null;
        List<Customer> customerList = new ArrayList<>();
        String sql;
        try {
            stmt = conn.createStatement();
            if (prop == null) {
                sql = "SELECT * FROM customer";
            } else if (prop.containsKey("id")) {
                sql = "SELECT * FROM customer WHERE id=" + prop.get("id");
            } else {
                sql = "SELECT * FROM customer";
            }
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setUsername(rs.getString("username"));
                customer.setPass(rs.getString("pass"));
                customer.setTel(rs.getString("tel"));

                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customerList;
    }

    @Override
    public int insert(Customer customer) {
        int i = 0;
        String sql = "INSERT INTO customer(username, pass, tel) VALUES(?, ?, ?)";
        try {
            prst = conn.prepareStatement(sql);
            // 表中最小字段（非空）插入
            prst.setString(1, customer.getUsername());
            prst.setString(2, customer.getPass());
            prst.setString(3, customer.getTel());
            i = prst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (prst != null)
                    prst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return i;
    }

    @Override
    public int update(Customer customer) {
        int i = 0;
        String sql = "UPDATE customer SET username=?, pass=?, tel=? WHERE id=?";
        try {
            prst = conn.prepareStatement(sql);
            prst.setString(1, customer.getUsername());
            prst.setString(2, customer.getPass());
            prst.setString(3, customer.getTel());
            prst.setInt(4, customer.getId());
            i = prst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (prst != null)
                    prst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return i;
    }

    @Override
    public int delete(int id) {
        int i = 0;
        String sql = "DELETE FROM customer WHERE id=?";
        try {
            prst = conn.prepareStatement(sql);
            prst.setInt(1, id);
            i = prst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (prst != null)
                    prst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return i;
    }
}