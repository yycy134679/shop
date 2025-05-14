package com.yang.service.impl;

import com.yang.service.IGoodsService;
import com.yang.entity.Goods;
import com.yang.dao.impl.GoodsDaoImpl;

import java.util.HashMap;
import java.util.List;

public class GoodsServiceImpl implements IGoodsService {
    // 引入持久层对象
    GoodsDaoImpl dai = new GoodsDaoImpl();

    @Override
    public List<Goods> findAll(HashMap<String, Object> prop) {
        return dai.findByProp(null); // GoodsDaoImpl 的 findByProp 需要调整以适应新DB
    }

    @Override
    public Goods findById(int id) {
        HashMap<String, Object> newProp = new HashMap<>();
        newProp.put("id", id); // 注意：GoodsDaoImpl.findByProp 也需要适配 goods_id
        List<Goods> result = dai.findByProp(newProp);
        if (result != null && !result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }
}