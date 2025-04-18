package com.yang.dao.impl;

import com.yang.dao.Db;
import com.yang.dao.IBaseDao;
import com.yang.entity.Goods;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 接口的实现
 */
public class GoodsDaoImpl extends Db implements IBaseDao<Goods> {
    private Connection conn = getConn();
    private Statement stmt = null;
    private ResultSet rs = null;

    @Override
    public List<Goods> findByProp(HashMap<String, Object> prop) {
        Goods goods = null;
        List<Goods> goodsList = new ArrayList<>();
        String sql;
        try {
            stmt = conn.createStatement();
            if(prop == null) {
                sql = "SELECT * FROM goods";
            } else if(prop.containsKey("id")) {
                sql = "SELECT * FROM goods WHERE id=" + prop.get("id");
            } else {
                sql = "SELECT * FROM goods";
            }
            rs = stmt.executeQuery(sql);
            
            // 打印列名
            System.out.println("数据库表的列名：");
            for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                System.out.println(rs.getMetaData().getColumnName(i));
            }
            
            // 展开结果集数据库
            while (rs.next()) {
                goods = new Goods();
                // 通过字段检索并设置属性
                goods.setId(rs.getInt("id"));
                goods.setStock(rs.getInt("stock"));
                goods.setKeywords(rs.getString("keywords"));
                goods.setCode(rs.getString("code"));
                goods.setSpec(rs.getString("spec"));
                goods.setCh_spec(rs.getString("ch_spec"));
                goods.setIn_price(rs.getDouble("in_price"));
                goods.setOut_price(rs.getDouble("out_price"));
                goods.setImgUrl(rs.getString("imgUrl"));
                goods.setProduct_id(rs.getInt("product_id"));
                
                goodsList.add(goods);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return goodsList;
    }

    @Override
    public int insert(Goods goods) {
        return 0;
    }

    @Override
    public int update(Goods goods) {
        return 0;
    }

    @Override
    public int delete(int id) {
        return 0;
    }
}