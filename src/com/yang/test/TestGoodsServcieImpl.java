package com.yang.test;

import com.yang.dao.impl.GoodsServiceImpl;
import com.yang.entity.Goods;

public class TestGoodsServcieImpl {
    public static void main(String[] args) {
        // System.out.println(new GoodsDaoImpl().findByProp(null).size());
        for (Goods g : new GoodsServiceImpl().findAll(null)) {
            System.out.println(g);
        }
    }
} 