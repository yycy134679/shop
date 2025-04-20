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
        // 获取session对象
        HttpSession session = req.getSession();
        
        // 接收String的ID, 转int
        String idStr = req.getParameter("id");
        
        // 如果有id参数，则添加商品到购物车
        if (idStr != null && !idStr.trim().isEmpty()) {
            int id = Integer.parseInt(idStr);
            
            // 购物项
            GoodsItem goodsItem = null;
            // 商品
            Goods goods = null;
            
            // 从session中拿到购物车数据
            List<GoodsItem> cart = (List<GoodsItem>) session.getAttribute("cart");
            // 若购物车数据为空，则代表第一次购物，生成购物车
            if (cart == null) {
                cart = new ArrayList<>();
            }

            // 定义标志变量，标记商品是否已在购物车中
            boolean flag = false;
            
            // 遍历购物车，看是否有同品，将该商品数量+1
            for (GoodsItem g : cart) {
                if (g.getGoodsId() == id) {
                    // 若有同品，获取该品
                    goodsItem = g;
                    // 修改标志
                    flag = true;//标记已找到相同商品
                }
            }
            
            // 根据标志决定是数量+1，还是新生成购物项，并添加到购物车中
            if (flag) {
                goodsItem.setNum(goodsItem.getNum() + 1);
            } else {
                GoodsItem goodsItem1 = new GoodsItem();
                goodsItem1.setNum(1);
                goodsItem1.setGoods(gsi.findById(id));
                goodsItem1.setGoodsId(id);
                cart.add(goodsItem1);
            }
            
            // 将购物车写入session
            session.setAttribute("cart", cart);
        }

        // 生成购物项列表
        List<GoodsItem> goodsItemList = new ArrayList<>();
        // 生成购物项数据并添加进列表
        for (int i = 90005; i <= 90009; i++) {
            GoodsItem goodsItem = new GoodsItem();
            goodsItem.setNum(i%1000+3);
            // 关键
            Goods goods = gsi.findById(i);
            //
            goodsItem.setGoods(goods);
            goodsItem.setGoodsId(goods.getId());
            goodsItem.setGoods(goods);
            goodsItemList.add(goodsItem);
        }

        // 将购物项列表数据写入session（此对象可以跨域保存数据）
        session.setAttribute("goodsList", goodsItemList);
        // 转至购物车页
        req.getRequestDispatcher("shoppingCart.jsp").forward(req, resp);
    }
}
