<%-- Created by IntelliJ IDEA. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="zh-CN">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>花语芬芳 - 精选鲜花商店</title>
                <link rel="stylesheet" href="css/bootstrap.min.css">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

                <!-- CSS -->
                <style>
                    :root {
                        --primary-color: #ff6b6b;
                        --secondary-color: #4ecdc4;
                        --dark-color: #2d3436;
                        --light-color: #f9f9f9;
                        --accent-color: #ffd166;
                    }

                    body {
                        font-family: 'Segoe UI', 'Microsoft YaHei', sans-serif;
                        background-color: #fafafa;
                        color: #333;
                        line-height: 1.6;
                    }

                    /* 导航栏样式 */
                    .navbar {
                        background-color: white;
                        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
                        padding: 0.8rem 0;
                        position: sticky;
                        top: 0;
                        z-index: 1000;
                    }

                    .navbar-brand {
                        color: var(--primary-color) !important;
                        font-weight: 700;
                        font-size: 1.8rem;
                        letter-spacing: 0.5px;
                    }

                    .nav-link {
                        color: var(--dark-color) !important;
                        font-weight: 500;
                        margin: 0 10px;
                        position: relative;
                        transition: all 0.3s;
                    }

                    .nav-link::after {
                        content: '';
                        position: absolute;
                        bottom: 0;
                        left: 0;
                        width: 0;
                        height: 2px;
                        background-color: var(--primary-color);
                        transition: width 0.3s;
                    }

                    .nav-link:hover::after {
                        width: 100%;
                    }

                    .nav-link:hover {
                        color: var(--primary-color) !important;
                    }

                    .navbar .search-form {
                        position: relative;
                    }

                    .search-form .form-control {
                        border-radius: 50px;
                        padding: 0.6rem 1.2rem;
                        padding-right: 40px;
                        border: 1px solid #eee;
                        background-color: #f8f9fa;
                        transition: all 0.3s;
                    }

                    .search-form .form-control:focus {
                        box-shadow: none;
                        border-color: var(--primary-color);
                        background-color: white;
                    }

                    .search-form .search-btn {
                        position: absolute;
                        right: 10px;
                        top: 50%;
                        transform: translateY(-50%);
                        background: none;
                        border: none;
                        color: #777;
                    }

                    .search-form .search-btn:hover {
                        color: var(--primary-color);
                    }

                    .navbar .action-icons .nav-link {
                        font-size: 1.2rem;
                        padding: 0.4rem 0.8rem;
                        margin: 0 5px;
                    }

                    .cart-icon {
                        position: relative;
                    }

                    .cart-badge {
                        position: absolute;
                        top: -8px;
                        right: -8px;
                        background-color: var(--primary-color);
                        color: white;
                        border-radius: 50%;
                        font-size: 0.7rem;
                        width: 18px;
                        height: 18px;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                    }

                    /* 轮播图样式 */
                    .hero-slider {
                        margin-bottom: 3rem;
                    }

                    .hero-slider .carousel-inner {
                        border-radius: 10px;
                        overflow: hidden;
                        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
                    }

                    .hero-slider .carousel-item {
                        height: 400px;
                    }

                    .hero-slider .carousel-item img {
                        object-fit: cover;
                        height: 100%;
                        width: 100%;
                    }

                    .hero-slider .carousel-caption {
                        background: rgba(0, 0, 0, 0.3);
                        border-radius: 10px;
                        padding: 20px;
                        max-width: 500px;
                        margin: 0 auto;
                    }

                    /* 分类标签 */
                    .category-tabs {
                        margin-bottom: 2rem;
                    }

                    .category-tabs .nav-link {
                        border-radius: 30px;
                        padding: 0.6rem 1.5rem;
                        margin: 0 10px 10px 0;
                        background-color: white;
                        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
                        color: var(--dark-color);
                        font-weight: 500;
                        border: none;
                    }

                    .category-tabs .nav-link.active,
                    .category-tabs .nav-link:hover {
                        background-color: var(--primary-color);
                        color: white !important;
                    }

                    /* 产品卡片样式 */
                    .section-title {
                        position: relative;
                        margin-bottom: 2rem;
                        padding-bottom: 1rem;
                        font-weight: 600;
                        color: var(--dark-color);
                    }

                    .section-title::after {
                        content: '';
                        position: absolute;
                        bottom: 0;
                        left: 0;
                        width: 60px;
                        height: 3px;
                        background-color: var(--primary-color);
                    }

                    .product-card {
                        background: white;
                        border-radius: 10px;
                        box-shadow: 0 3px 15px rgba(0, 0, 0, 0.07);
                        margin-bottom: 30px;
                        transition: all 0.3s ease;
                        overflow: hidden;
                        position: relative;
                        height: 100%;
                        display: flex;
                        flex-direction: column;
                    }

                    .product-card:hover {
                        transform: translateY(-10px);
                        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
                    }

                    .product-img-container {
                        height: 280px;
                        overflow: hidden;
                        position: relative;
                    }

                    .product-card img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        transition: transform 0.5s ease;
                    }

                    .product-card:hover img {
                        transform: scale(1.1);
                    }

                    .product-tag {
                        position: absolute;
                        top: 15px;
                        left: 15px;
                        background: var(--accent-color);
                        color: var(--dark-color);
                        padding: 5px 10px;
                        border-radius: 5px;
                        font-size: 0.75rem;
                        font-weight: 600;
                    }

                    .product-info {
                        padding: 20px;
                        flex-grow: 1;
                        display: flex;
                        flex-direction: column;
                    }

                    .product-name {
                        color: var(--dark-color);
                        font-size: 1.1rem;
                        font-weight: 600;
                        margin-bottom: 10px;
                        height: 2.4em;
                        overflow: hidden;
                        display: -webkit-box;
                        -webkit-line-clamp: 2;
                        -webkit-box-orient: vertical;
                    }

                    .product-price {
                        color: var(--primary-color);
                        font-size: 1.3rem;
                        font-weight: 700;
                        margin: 8px 0;
                    }

                    .product-meta {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 15px;
                        color: #777;
                        font-size: 0.85rem;
                    }

                    .product-rating i {
                        color: var(--accent-color);
                    }

                    .product-stock {
                        display: flex;
                        align-items: center;
                    }

                    .stock-indicator {
                        width: 8px;
                        height: 8px;
                        border-radius: 50%;
                        margin-right: 5px;
                    }

                    .in-stock {
                        background-color: #26de81;
                    }

                    .low-stock {
                        background-color: #f7b731;
                    }

                    .add-to-cart {
                        margin-top: auto;
                        background-color: var(--primary-color);
                        border: none;
                        border-radius: 8px;
                        padding: 10px 15px;
                        color: white;
                        font-weight: 500;
                        transition: all 0.3s;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                    }

                    .add-to-cart:hover {
                        background-color: var(--dark-color);
                        transform: translateY(-3px);
                    }

                    .add-to-cart i {
                        margin-right: 8px;
                    }

                    /* 特色区域 */
                    .features-section {
                        background-color: white;
                        padding: 3rem 0;
                        margin: 3rem 0;
                        box-shadow: 0 0 20px rgba(0, 0, 0, 0.03);
                    }

                    .feature-box {
                        text-align: center;
                        padding: 1.5rem;
                    }

                    .feature-icon {
                        width: 70px;
                        height: 70px;
                        background-color: var(--light-color);
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto 1.5rem auto;
                        color: var(--primary-color);
                        font-size: 1.8rem;
                        transition: all 0.3s;
                    }

                    .feature-box:hover .feature-icon {
                        background-color: var(--primary-color);
                        color: white;
                        transform: rotateY(180deg);
                    }

                    .feature-title {
                        font-weight: 600;
                        margin-bottom: 1rem;
                        color: var(--dark-color);
                    }

                    /* 推荐区域 */
                    .recommended-section {
                        margin: 3rem 0;
                    }

                    /* 页脚样式 */
                    .footer {
                        background-color: var(--dark-color);
                        color: #e0e0e0;
                        padding: 4rem 0 2rem;
                        margin-top: 3rem;
                    }

                    .footer-logo {
                        color: white;
                        font-size: 2rem;
                        font-weight: 700;
                        margin-bottom: 1.5rem;
                        display: block;
                    }

                    .footer-about {
                        margin-bottom: 2rem;
                        line-height: 1.8;
                    }

                    .footer h5 {
                        color: white;
                        font-weight: 600;
                        margin-bottom: 1.5rem;
                        position: relative;
                        padding-bottom: 10px;
                    }

                    .footer h5::after {
                        content: '';
                        position: absolute;
                        bottom: 0;
                        left: 0;
                        width: 40px;
                        height: 2px;
                        background-color: var(--primary-color);
                    }

                    .footer-links {
                        list-style: none;
                        padding: 0;
                    }

                    .footer-links li {
                        margin-bottom: 15px;
                    }

                    .footer-links a {
                        color: #e0e0e0;
                        text-decoration: none;
                        transition: all 0.3s;
                        display: flex;
                        align-items: center;
                    }

                    .footer-links a i {
                        margin-right: 10px;
                        color: var(--primary-color);
                    }

                    .footer-links a:hover {
                        color: var(--primary-color);
                        padding-left: 5px;
                    }

                    .footer-bottom {
                        padding-top: 2rem;
                        margin-top: 2rem;
                        border-top: 1px solid rgba(255, 255, 255, 0.1);
                        text-align: center;
                    }

                    .social-links {
                        margin-bottom: 1rem;
                    }

                    .social-links a {
                        color: #e0e0e0;
                        background-color: rgba(255, 255, 255, 0.1);
                        border-radius: 50%;
                        width: 40px;
                        height: 40px;
                        display: inline-flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 5px;
                        transition: all 0.3s;
                    }

                    .social-links a:hover {
                        background-color: var(--primary-color);
                        color: white;
                        transform: translateY(-3px);
                    }

                    /* 响应式调整 */
                    @media (max-width: 992px) {
                        .hero-slider .carousel-item {
                            height: 300px;
                        }
                    }

                    @media (max-width: 768px) {
                        .hero-slider .carousel-item {
                            height: 250px;
                        }

                        .hero-slider .carousel-caption {
                            padding: 10px;
                        }

                        .footer {
                            text-align: center;
                        }

                        .footer h5::after {
                            left: 50%;
                            transform: translateX(-50%);
                        }

                        .footer-links a {
                            justify-content: center;
                        }
                    }
                </style>

            </head>

            <body>
                <!-- 导航栏 -->
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container">
                        <a class="navbar-brand" href="#"><i class="fas fa-flower-daffodil"></i> 花语芬芳</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">首页 <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">鲜花分类</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">花束定制</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">节日专区</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">花艺学院</a>
                                </li>
                            </ul>
                            <form class="search-form mr-3">
                                <div class="input-group">
                                    <input class="form-control" type="search" placeholder="搜索鲜花..." aria-label="Search">
                                    <button class="search-btn" type="submit">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </form>
                            <ul class="navbar-nav action-icons">
                                <li class="nav-item">
                                    <a class="nav-link" href="http://localhost:8080/login">
                                        <i class="fas fa-user"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link cart-icon" href="<c:url value="shoppingCart.jsp" />">
                                    <i class="fas fa-shopping-cart"></i>
                                    <span class="cart-badge">
                                        <c:choose>
                                            <c:when test="${sessionScope.cart==null}">
                                                0
                                            </c:when>
                                            <c:otherwise>
                                                ${sessionScope.cart.size()}
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <!-- 主要内容 -->
                <div class="container">
                    <!-- 轮播图 -->
                    <div class="hero-slider mt-4">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="https://images.unsplash.com/photo-1519378058457-4c29a0a2efac?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
                                        class="d-block w-100" alt="鲜花展示">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h2>春季花卉特惠</h2>
                                        <p>精选春季花卉，为您带来自然的芳香</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="./图库/轮播1.png" class="d-block w-100" alt="鲜花展示">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h2>爱的表达</h2>
                                        <p>用最美的鲜花表达最真挚的感情</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="https://images.unsplash.com/photo-1591886960571-74d43a9d4166?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
                                        class="d-block w-100" alt="鲜花展示">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h2>定制礼盒</h2>
                                        <p>专属定制，为特别的日子增添惊喜</p>
                                    </div>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">上一个</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">下一个</span>
                            </a>
                        </div>
                    </div>

                    <!-- 分类标签 -->
                    <div class="category-tabs">
                        <ul class="nav nav-pills">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">全部鲜花</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">玫瑰</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">百合</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">康乃馨</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">向日葵</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">郁金香</a>
                            </li>
                        </ul>
                    </div>

                    <!-- 精选商品 -->
                    <div class="product-section">
                        <h2 class="section-title">精选鲜花</h2>
                        <div class="row">
                            <c:forEach items="${data}" var="goods">
                                <div class="col-md-4 col-lg-3">
                                    <div class="product-card">
                                        <div class="product-img-container">
                                            <img src="images/${goods.imgUrl}" alt="${goods.keywords}">
                                            <div class="product-tag">热销</div>
                                        </div>
                                        <div class="product-info">
                                            <h5 class="product-name">${goods.keywords}</h5>
                                            <div class="product-meta">
                                                <div class="product-rating">
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star"></i>
                                                    <i class="fas fa-star-half-alt"></i>
                                                </div>
                                                <div class="product-stock">
                                                    <span
                                                        class="stock-indicator ${goods.stock > 10 ? 'in-stock' : 'low-stock'}"></span>
                                                    库存: ${goods.stock}件
                                                </div>
                                            </div>
                                            <p class="product-price">¥${goods.out_price}</p>
                                            <a href="/session?id=${goods.id}" class="btn add-to-cart">
                                                <i class="fas fa-cart-plus"></i> 加入购物车
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- 服务特色区域 -->
                <section class="features-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="feature-box">
                                    <div class="feature-icon">
                                        <i class="fas fa-truck"></i>
                                    </div>
                                    <h4 class="feature-title">全国配送</h4>
                                    <p>专业配送团队，确保鲜花安全送达</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="feature-box">
                                    <div class="feature-icon">
                                        <i class="fas fa-seedling"></i>
                                    </div>
                                    <h4 class="feature-title">新鲜保证</h4>
                                    <p>当日采摘，保证鲜花的新鲜度</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="feature-box">
                                    <div class="feature-icon">
                                        <i class="fas fa-gift"></i>
                                    </div>
                                    <h4 class="feature-title">精美包装</h4>
                                    <p>独特设计，为您的礼物增添惊喜</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="feature-box">
                                    <div class="feature-icon">
                                        <i class="fas fa-headset"></i>
                                    </div>
                                    <h4 class="feature-title">贴心服务</h4>
                                    <p>专业花艺师为您提供个性化服务</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- 页脚 -->
                <footer class="footer">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-6">
                                <a href="#" class="footer-logo">花语芬芳</a>
                                <p class="footer-about">
                                    花语芬芳致力于为您提供最优质的鲜花和植物，以及专业的花艺设计服务。我们的使命是用自然的美丽点缀您的生活，传递您的情感。
                                </p>
                            </div>
                            <div class="col-lg-2 col-md-6">
                                <h5>关于我们</h5>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fas fa-angle-right"></i> 公司简介</a></li>
                                    <li><a href="#"><i class="fas fa-angle-right"></i> 品牌故事</a></li>
                                    <li><a href="#"><i class="fas fa-angle-right"></i> 花艺师团队</a></li>
                                    <li><a href="#"><i class="fas fa-angle-right"></i> 企业责任</a></li>
                                    <li><a href="#"><i class="fas fa-angle-right"></i> 加入我们</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-2 col-md-6">
                                <h5>客户服务</h5>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fas fa-angle-right"></i> 配送政策</a></li>
                                    <li><a href="#"><i class="fas fa-angle-right"></i> 退款条款</a></li>
                                    <li><a href="#"><i class="fas fa-angle-right"></i> 隐私政策</a></li>
                                    <li><a href="#"><i class="fas fa-angle-right"></i> 常见问题</a></li>
                                    <li><a href="#"><i class="fas fa-angle-right"></i> 联系我们</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <h5>联系方式</h5>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fas fa-map-marker-alt"></i> 北京市朝阳区花语大厦12层</a></li>
                                    <li><a href="#"><i class="fas fa-phone"></i> 400-123-4567</a></li>
                                    <li><a href="#"><i class="fas fa-envelope"></i> service@huayu.com</a></li>
                                    <li><a href="#"><i class="fas fa-clock"></i> 周一至周日 9:00-21:00</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="footer-bottom">
                            <div class="social-links">
                                <a href="#"><i class="fab fa-weixin"></i></a>
                                <a href="#"><i class="fab fa-weibo"></i></a>
                                <a href="#"><i class="fab fa-qq"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                            <p>© 2024 花语芬芳 版权所有 | 苏ICP备12345678号</p>
                        </div>
                    </div>
                </footer>

                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            </body>

            </html>