-- ================================================================================================
-- 1. 用户表 (customer)
--    用途: 存储注册用户的基本信息。
-- ================================================================================================

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` VARCHAR(50) NOT NULL COMMENT '用户ID（用于登录/注册，唯一）',
  `nickname` VARCHAR(50) DEFAULT NULL COMMENT '用户昵称',
  `password` VARCHAR(255) NOT NULL COMMENT '密码',
  `tel` VARCHAR(20) DEFAULT NULL COMMENT '电话号码',
  `gender` ENUM('男', '女') DEFAULT NULL COMMENT '性别',
  `img_url` VARCHAR(255) DEFAULT NULL COMMENT '头像图片路径',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';


-- ================================================================================================
-- 2. 商品表 (goods)
--    用途: 存储可销售的商品信息
-- ================================================================================================

CREATE TABLE IF NOT EXISTS `goods` (
  `goods_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goods_name` VARCHAR(100) NOT NULL COMMENT '商品名称',
  `detail` TEXT NOT NULL COMMENT '商品详细描述',
  `language_offlowers` VARCHAR(100) COMMENT '花语',
  `price` DECIMAL(10,2) NOT NULL COMMENT '商品价格',
  `main_img_url` VARCHAR(1000) NOT NULL COMMENT '商品主图片URL',
  `gallery_img_url` VARCHAR(1000) DEFAULT NULL COMMENT '商品展示图片URL，可存储多个URL，以逗号分隔',
  `sales_volume` INT UNSIGNED DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';


-- ================================================================================================
-- 3. 收货地址表 (address)
--    用途: 存储用户的收货地址。根据功能架构书，当前设计为每个用户仅一个地址。
-- ================================================================================================

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `customer_id` VARCHAR(50) NOT NULL UNIQUE COMMENT '用户ID',
  `recipient_name` VARCHAR(50) NOT NULL COMMENT '收件人姓名',
  `recipient_tel` VARCHAR(20) NOT NULL COMMENT '收件人联系电话',
  `province` VARCHAR(50) NOT NULL COMMENT '省份',
  `city` VARCHAR(50) NOT NULL COMMENT '城市',
  `district` VARCHAR(50) NOT NULL COMMENT '区/县',
  `detailed_address` VARCHAR(255) NOT NULL COMMENT '详细街道地址',
  PRIMARY KEY (`address_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收货地址表';
  
-- 插入用户表数据
INSERT INTO `customer` (`customer_id`, `nickname`, `password`, `tel`, `gender`, `img_url`)
VALUES
('yycy134679', '云烟成雨', '040925', '15916060451', '男','https://bed.djxs.xyz/file/BQACAgUAAyEGAASVl6k_AANjaCOBjpeF0Tv-38nVjC113eRlyEEAAjccAAJXAxhV3ezN3nBwyyo2BA.jpg')


-- 插入收货地址数据
INSERT INTO `address` (`customer_id`, `recipient_name`, `recipient_tel`, `province`, `city`, `district`, `detailed_address`)


-- 插入商品数据
-- 以下是12组鲜花商品数据，每组数据都包含必要的字段和有效的图片URL

INSERT INTO `goods` (`goods_name`, `detail`, `language_offlowers`, `price`, `main_img_url`, `gallery_img_url`, `sales_volume`)
VALUES
-- 以下是您已有的4组数据
('520情人节红玫瑰花', '琐拉520情人节鲜花速递玫瑰花束求婚生日礼物送女友全国同城花店配送 52朵红玫瑰花束—吾爱','热恋、热情、热爱着你', 520.00, 
'https://img13.360buyimg.com/n1/s800x800_jfs/t1/301320/3/2000/245385/68218fa9Fe96fcb0e/45981f91d544dd76.jpg', 
'https://img13.360buyimg.com/n5/s720x720_jfs/t1/281101/19/15813/246942/67f469edFac771795/c4c2f83cd478219d.jpg,
https://img13.360buyimg.com/n5/s720x720_jfs/t1/278067/35/17352/236160/67f469f7F733f4e56/c769e852becffbb0.jpg,
https://img13.360buyimg.com/n5/s720x720_jfs/t1/275316/5/16740/244428/67f46a09F530ce07d/6d89784ec8e8f128.jpg', 5000),

('33朵红玫瑰', '{品种:组合,主题:浪漫人生}', '热恋、热情、热爱着你', 128.00, 
'https://gw.alicdn.com/bao/uploaded/i2/3110375665/O1CN01I6b71o1ricZnyKNA0_!!3110375665.jpg', 
'https://p3-flow-imagex-sign.byteimg.com/ocean-cloud-tos/image_skill/052bbbc4-e059-4743-80b7-d6bbe6bffad1_1747154825377306308_origin~tplv-a9rns2rl98-image-dark-watermark.png?rk3s=b14c611d&x-expires=1778690825&x-signature=7YV40kDO%2FVCiz4xfmp%2BBDl%2BAP3Y%3D,
https://p3-flow-imagex-sign.byteimg.com/ocean-cloud-tos/image_skill/052bbbc4-e059-4743-80b7-d6bbe6bffad1_1747154825377306308_origin~tplv-a9rns2rl98-image-dark-watermark.png?rk3s=b14c611d&x-expires=1778690825&x-signature=7YV40kDO%2FVCiz4xfmp%2BBDl%2BAP3Y%3D,
https://bed.djxs.xyz/file/BQACAgUAAyEGAASVl6k_AANhaCN50VSqs9uY2sXklUV-nGYhaZ8AAiwcAAJXAxhVcYarND7BffA2BA.png,
https://bed.djxs.xyz/file/BQACAgUAAyEGAASVl6k_AANiaCN6IBbmx90te77yR7xT7SA-Dt8AAi0cAAJXAxhVHCRs3a9Gozo2BA.png', 3000),

('粉玫瑰11朵', '初朵11朵玫瑰香皂永生花生日礼物女同城配送老婆妈妈母亲节520非鲜花','初恋、温柔与甜美、感恩、特别的关怀、纯真与浪漫、爱的宣言、灿烂的微笑', 38.00, 
'https://img10.360buyimg.com/n5/s720x720_jfs/t1/186361/23/19974/326587/61273cc9E0927f5bd/71344f127aa45140.jpg',
'https://img10.360buyimg.com/n5/s720x720_jfs/t21607/197/1675349154/218252/b0c3da80/5b31fa3bN6be2f831.jpg,
https://img10.360buyimg.com/n5/s720x720_jfs/t21679/295/2224016535/344027/b355b7b1/5b4d51a1N2222745a.jpg,
https://img10.360buyimg.com/n5/s720x720_jfs/t1/113231/38/42198/76312/653a2fddF280d5974/95c52e8b059a4d73.jpg,
https://img10.360buyimg.com/n5/s720x720_jfs/t23683/289/490069942/257573/6660aabd/5b31fa3cN094793da.jpg', 10000),

('康奶昔一束', '初朵3朵玫瑰康乃馨香皂永生花束母亲节生日礼物女同城配送妈妈非鲜花', '母爱与感恩、永恒的爱、美丽与年轻、热爱与感动、永久的记忆', 18.80, 
'https://img12.360buyimg.com/n5/s720x720_jfs/t1/142074/11/33683/151612/63e05f6fF0d1b8734/d20486034214788c.jpg',
'https://img12.360buyimg.com/n5/s720x720_jfs/t1/223999/7/16757/211877/63e05f6fFc823def8/c3d99891ada47560.jpg,
https://img12.360buyimg.com/n5/s720x720_jfs/t1/182459/26/32552/169589/63e05f6fF2a2aa352/3895c304ef45fb97.jpg,
https://img12.360buyimg.com/n5/s720x720_jfs/t1/90692/27/32792/134877/63e05f6fFf2c28849/41c515e2c4b5e062.jpg,
https://img12.360buyimg.com/n5/s720x720_jfs/t1/156088/32/34524/166528/63e05f6fF16007e87/1c7662085220221a.jpg', 50000),

-- 以下是新增的8组数据
('母亲节康乃馨花束', '精选高品质康乃馨，19朵粉色康乃馨搭配白色满天星，精美包装，传达对母亲深深的爱与感激之情，是母亲节、生日、纪念日的完美礼物。', '感恩、温馨、母爱、祝福、敬意、长寿', 159.00, 
'https://image-cdn-flare.qdm.cloud/q560bc4237d995/image/data/2025/04/01/01aa72496263709bc0b7932c2e1b2bd2.JPG', 
'https://web.hocom.tw/Uploads/Product/341060_0p5hxew2.jpg,
https://www.doing-housework.com/store_image/etherealflower/E1711616021636.jpg,
https://web.hocom.tw/Uploads/Product/378914_cdb7qmkj.jpg,
https://web.hocom.tw/Uploads/Product/31368_405576_jweabgbx.jpg', 2389),

('纯白百合花束', '优雅纯洁的白色百合花束，5朵精选东方百合，搭配适量绿叶点缀，简约大方，清新淡雅，适合送恋人、朋友或家人，表达美好祝愿。', '纯洁、高贵、祝福、美好的祝愿、庄重、神圣、思念', 199.00, 
'https://static.iyp.tw/33109/products/photooriginal-2470105-bWgH9.jpg', 
'https://iconflorist.com/wp-content/uploads/2023/09/%E7%99%BE%E5%90%88%E8%8A%B1%EF%BC%8C%E7%99%BE%E5%90%88%E8%8A%B1%E6%9D%9F%EF%BC%8C%E7%99%BE%E5%90%88%E8%8A%B1%E8%8A%B1%E6%9D%9F202309271.webp,
https://moon-florist.com/wp-content/uploads/2023/06/2-7.jpg,
https://www.flowerdj.com/x/images/product/AF/AF093_x.webp', 1856),

('向日葵阳光花束', '精选7朵向日葵，搭配黄色雏菊和绿叶，明亮阳光的色彩，带来积极乐观的正能量，完美礼物送朋友、同事或家人，温暖人心。', '忠诚、爱慕、光明、积极向上、勇敢、乐观、活力', 168.00, 
'https://m.hualangman.com/images/products/2513_0.jpg', 
'https://gw.alicdn.com/imgextra/i2/1906089461/O1CN01VRfalO2JlCDx9dU60_!!1906089461.jpg_Q75.jpg_.webp,
https://img01.hua.com/uploadpic/images/by_2023120618170256.jpg,
https://y.zdmimg.com/202310/19/6530d0b10a91c9803.jpg_d480.jpg,
https://gw.alicdn.com/imgextra/i3/2215876187724/O1CN01jtzKeV26ve5DqcDwP_!!2215876187724.jpg_Q75.jpg_.webp', 3267),

('粉色郁金香花束', '荷兰进口18朵粉色郁金香，搭配白色满天星和绿叶，清新淡雅的气质，代表着美好的祝福和浪漫的心意，适合生日、纪念日或节日送礼。', '美好的祝福、优雅的爱、永恒的爱情、纯洁的爱、祝福、富贵与名声', 188.00, 
'https://static.wixstatic.com/media/475e38_e237c90ce6214d878e38b80b09f38609~mv2.jpg/v1/fill/w_560,h_582,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/475e38_e237c90ce6214d878e38b80b09f38609~mv2.jpg', 
'https://moon-florist.com/wp-content/uploads/2023/06/2-16.jpg,
https://gw.alicdn.com/imgextra/i4/2207946057887/O1CN01cT8KIW288Ib3EtAWP_!!2207946057887.jpg_Q75.jpg_.webp,
https://haloflowers.com.hk/wp-content/uploads/2022/07/HALO-Flowers_LEXA-Tulip-Bouquet_HLB004_occasions_white_orange_%E9%AC%B1%E9%87%91%E9%A6%99%E8%8A%B1%E6%9D%9F-768x768.jpg,
https://img01.hua.com/uploadpic/images/by_20240311171025512.jpg', 1432),

('梦幻满天星花束', '精选高品质多色混搭满天星，蓝色、粉色和白色满天星组合成梦幻色彩，轻盈飘逸、浪漫唯美，是表达思念和爱意的完美礼物。', '纯洁的心灵、思念、清纯、浪漫、梦幻、美好', 158.00, 
'https://someflower.com.hk/wp-content/uploads/2022/09/BB001-250-e1693464369158.jpeg', 
'https://moon-florist.com/wp-content/uploads/2023/05/%E6%BB%BF%E5%A4%A9%E6%98%9F-%E2%80%94-%E6%B7%B7%E8%89%B2%E6%90%AD%E9%85%8D%E6%BB%BF%E5%A4%A9%E6%98%9F%E8%8A%B1%E6%9D%9F.jpg,
https://cdn02.pinkoi.com/wp-content/uploads/sites/6/2021/09/29100331/Screenshot-2021-09-29-at-10.02.41-AM-1024x1021.webp,
https://blueforestflora.com/product_images/h/884/0622_7__10465_zoom.jpg,
https://iconflorist.com/wp-content/uploads/2023/09/%E6%BB%BF%E5%A4%A9%E6%98%9F%EF%BC%8C%E6%BB%BF%E5%A4%A9%E6%98%9F%E8%8A%B1%E6%9D%9F%EF%BC%8C%E6%BB%BF%E5%A4%A9%E6%98%9F%E8%8A%B19.webp', 4567),

('混合鲜花豪华花束', '精选多种鲜花混合搭配，包含玫瑰、百合、康乃馨、向日葵等，色彩鲜艳丰富，花材丰满，高档礼盒包装，适合重要场合和特殊节日赠送。', '美好祝愿、热烈祝福、丰盛、喜庆、吉祥如意', 299.00, 
'https://www.999florist.com/668-home_default/99%E6%94%AF%E6%B7%B7%E5%90%88%E7%8E%AB%E7%91%B0%E8%8A%B1%E6%9D%9Fa208.webp', 
'https://thumbs.dreamstime.com/b/%E4%B8%8D%E5%90%8C%E9%B2%9C%E8%8A%B1%E8%8A%B1%E6%9D%9F%E7%9A%84%E6%B7%B7%E5%90%88%E8%8A%B1-%E7%B2%89%E7%BA%A2%E8%89%B2%E8%8A%B1%E5%BA%97-%E6%9F%94%E5%92%8C%E7%9A%84-%E5%A4%A7%E8%80%8C%E7%BE%8E%E4%B8%BD%E7%9A%84%E7%B2%89%E8%89%B2%E5%92%8C%E7%99%BD%E8%89%B2%E6%B7%B7%E5%90%88%E8%8A%B1%E6%9D%9F-%E8%8A%B1%E5%BA%97%E8%8A%B1%E5%8C%A0%E7%9A%84%E4%BD%9C%E5%93%81-243552815.jpg,
https://thumbs.dreamstime.com/b/%E7%BA%A2%E8%89%B2%E6%B7%B7%E5%90%88%E8%8A%B1%E6%9D%9F-%E5%A5%B3%E4%BA%BA%E6%89%8B%E4%B8%AD%E4%B8%80%E6%9D%9F%E7%BE%8E%E4%B8%BD%E7%9A%84%E9%B2%9C%E8%8A%B1-%E8%8A%B1%E5%BA%97%E9%87%8C%E8%8A%B1%E5%8C%A0%E7%9A%84%E4%BD%9C%E5%93%81-%E9%B2%9C%E5%88%87%E8%8A%B1-164024428.jpg,
https://www.999florist.com/424-large_default/%E7%B2%89%E7%8E%AB%E7%91%B0%E7%99%BE%E5%90%88%E6%B7%B7%E5%90%88%E8%8A%B1%E6%9D%9F-a148.webp', 2789),

('红玫瑰花束', 'GlobalRose 100支红玫瑰花束，精选优质厄瓜多尔长茎玫瑰，枝长50cm，色泽饱满，4捆包装每捆25支，专业保鲜处理，送女友、求婚、周年纪念的完美选择。', '热恋、爱情、热情、真爱、贞节、美丽、勇敢', 359.00, 
'https://bed.djxs.xyz/file/BQACAgUAAyEGAASVl6k_AAOAaCSGaGOWUwW18JIYZJXWh2n_s-YAAiskAAJXAyBVvuCabrNO2fs2BA.png', 
'https://m.media-amazon.com/images/I/61NbKDmvHTL._AC_UL320_.jpg,
https://m.media-amazon.com/images/I/61uLX-Xoo+L._AC_UL320_.jpg,
https://m.media-amazon.com/images/I/81H+5EeTkpL._AC_UL320_.jpg', 1289),

('高端白色马蹄莲花束', 'KaBloom精选20朵泰国进口白色马蹄莲花束，附赠高档透明花瓶，简约现代风格，清新淡雅，代表纯洁与永恒爱意，适合结婚、周年纪念等重要场合。', '纯洁的爱、吉祥如意、忠贞不渝、永恒的爱、高雅、清新', 269.00, 
'https://m.media-amazon.com/images/I/81EA+Uoz4zL._AC_UL320_.jpg', 
'https://m.media-amazon.com/images/I/71zaoLLWjEL._AC_UL320_.jpg,
https://m.media-amazon.com/images/I/513SeoA595L._AC_UL320_.jpg,
https://m.media-amazon.com/images/I/614BG1snN3L._AC_UL320_.jpg', 986);
