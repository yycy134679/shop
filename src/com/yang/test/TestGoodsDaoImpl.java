package com.yang.test;

import com.yang.dao.impl.GoodsDaoImpl;
import com.yang.entity.Goods;

import java.sql.SQLException;

public class TestGoodsDaoImpl {
    public static void main(String[] args) {
//        System.out.println(new GoodsDaoImpl().findByProp(null).size());
        for (Goods g : new GoodsDaoImpl().findByProp(null)){
            System.out.println(g);
        }
    }
}