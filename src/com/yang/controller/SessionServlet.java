package com.yang.controller;

import com.yang.dao.impl.GoodsServiceImpl;
import com.yang.entity.Goods;
import com.yang.entity.GoodsItem;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 继承HttpServlet
 * 控制层
 *
 * @WebServlet 一是在容器注册，二是产生该servlet对象（ new）
 * urlPatterns:客户（请求）的网址，请求时会进行地址拼接   http://localhost:8080/login
 */
@WebServlet(urlPatterns = "/session")
public class SessionServlet extends HttpServlet {
//    调用服务层
 GoodsServiceImpl gsi=  new GoodsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//      购物项
        GoodsItem goodsItem = null;
//        商品
        Goods goods = null;
//        获取session对象
        HttpSession session = req.getSession();
//        生成购物项列表
        List<GoodsItem> goodsItemList = new ArrayList<>();
//        生成购物项数据并添加进列表
        for (int i = 90005; i <= 90009; i++) {
            goodsItem = new GoodsItem();
            goodsItem.setNum(i%1000+3);
//      关键
            goods=gsi.findById(i);
//
            goodsItem.setGoods(goods);
            goodsItem.setGoodsId(goods.getId());
            goodsItem.setGoods(goods);
            goodsItemList.add(goodsItem);
        }

//      将购物项列表数据写入session（此对象可以跨域保存数据）
        session.setAttribute("goodsList", goodsItemList);
//        转至购物车页
        req.getRequestDispatcher("shoppingCart.jsp").forward(req, resp);
    }
}
