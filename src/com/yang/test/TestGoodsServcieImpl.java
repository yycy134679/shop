package com.yang.test;

import com.yang.service.impl.GoodsServiceImpl;
import com.yang.service.IGoodsService;
import com.yang.entity.Goods;

import java.util.List;

public class TestGoodsServcieImpl {
    public static void main(String[] args) {
        // System.out.println(new GoodsDaoImpl().findByProp(null).size());
        IGoodsService goodsServcie = new GoodsServiceImpl();
        List<Goods> list = goodsServcie.findAll(null);
        for (Goods goods : list) {
            System.out.println(goods);
        }
    }
}