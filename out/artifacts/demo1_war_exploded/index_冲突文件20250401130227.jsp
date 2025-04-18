<%-- Created by IntelliJ IDEA. User: admin Date: 2025/2/27 Time: 16:33 To change this template use File | Settings |
    File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html lang="zh-CN">

        <head>
            <title>鲜花商店</title>
            <link rel="stylesheet" href="css/bootstrap.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <style>
                body {
                    background-color: #f8f9fa;
                }

                /* 导航栏样式 */
                .navbar {
                    background-color: white;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                    padding: 1rem 0;
                }

                .navbar-brand {
                    color: #3498db !important;
                    font-weight: bold;
                    font-size: 1.5rem;
                }

                .nav-link {
                    color: #2c3e50 !important;
                    font-weight: 500;
                    margin: 0 10px;
                }

                .nav-link:hover {
                    color: #3498db !important;
                }

                .form-inline .form-control {
                    border-radius: 20px;
                    padding: 0.5rem 1rem;
                    border: 1px solid #ddd;
                }

                .btn-outline-success {
                    border-radius: 20px;
                    padding: 0.5rem 1.5rem;
                    border-color: #3498db;
                    color: #3498db;
                }

                .btn-outline-success:hover {
                    background-color: #3498db;
                    color: white;
                }

                .badge {
                    background-color: #e74c3c;
                    border-radius: 50%;
                    padding: 0.3rem 0.6rem;
                }

                /* 产品卡片样式 */
                .product-card {
                    background: white;
                    border-radius: 10px;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                    margin-bottom: 30px;
                    transition: transform 0.3s ease;
                    overflow: hidden;
                }

                .product-card:hover {
                    transform: translateY(-5px);
                }

                .product-card img {
                    width: 100%;
                    height: 300px;
                    object-fit: cover;
                    transition: transform 0.3s ease;
                    overflow: hidden;
                }

                .product-card:hover img {
                    transform: scale(1.05);
                }

                .product-info {
                    padding: 20px;
                }

                .product-info h5 {
                    color: #2c3e50;
                    font-size: 1.1rem;
                    margin-bottom: 10px;
                    height: 2.4em;
                    overflow: hidden;
                }

                .price {
                    color: #e74c3c;
                    font-size: 1.2rem;
                    font-weight: bold;
                    margin: 10px 0;
                }

                .btn-danger {
                    background-color: #e74c3c;
                    border: none;
                    border-radius: 20px;
                    padding: 8px 20px;
                    transition: background-color 0.3s ease;
                }

                .btn-danger:hover {
                    background-color: #c0392b;
                }

                /* 页脚样式 */
                .footer {
                    background-color: #2c3e50;
                    color: white;
                    padding: 50px 0;
                    margin-top: 50px;
                }

                .footer h5 {
                    color: #3498db;
                    margin-bottom: 20px;
                    font-weight: bold;
                }

                .footer ul {
                    list-style: none;
                    padding: 0;
                }

                .footer ul li {
                    margin-bottom: 10px;
                }

                .footer ul li a {
                    color: #ecf0f1;
                    text-decoration: none;
                    transition: color 0.3s ease;
                }

                .footer ul li a:hover {
                    color: #3498db;
                }

                .qrcode img {
                    border-radius: 10px;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
                }
            </style>
        </head>

        <body>

            <!-- 导航栏 -->
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                    <a class="navbar-brand" href="">Brand</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">功能1 <span class="sr-only">(current)</span></a>
                            </li>
                            <!-- 可以添加更多导航链接 -->
                        </ul>
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="查询" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">查询</button>
                        </form>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="http://localhost:8080/login">登录</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="http://localhost:8080/reg">注册</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">我的购物车 <i class="fas fa-shopping-cart"></i><span
                                        class="badge badge-pill badge-success">4</span></a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#">个人中心</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- 主要内容 -->
            <div class="container">
                <div class="row">
                    <!-- 产品 1 -->
                    <div class="col-md-4">
                        <div class="product-card">
                            <img src="图库/鲜花1.png" width="300" height="300" alt="一束鲜花高清图片下载_红动网" class=" nofocus"
                                tabindex="0" aria-label="一束鲜花高清图片下载_红动网" role="button">
                            <div class="product-info">
                                <h5>百花齐放多种组合自由搭配好看各种主题 可定制</h5>
                                <p class="price">¥ 12.22</p>
                                <p>库存: 27件</p>
                                <button class="btn btn-danger">加入购物车</button>
                            </div>
                        </div>
                    </div>

                    <!-- 产品 2 -->
                    <div class="col-md-4">
                        <div class="product-card">
                            <img class="mimg" style="color: rgb(59, 96, 20);" height="300" width="300" src="图库/鲜花2.png"
                                alt="鲜花图片 的图像结果" data-thhnrepbd="1" data-bm="28">
                            <div class="product-info">
                                <h5>百花齐放多种组合自由搭配好看各种主题 可定制</h5>
                                <p class="price">¥ 12.22</p>
                                <p>库存: 27件</p>
                                <button class="btn btn-danger">加入购物车</button>
                            </div>
                        </div>
                    </div>

                    <!-- 产品 3 -->
                    <div class="col-md-4">
                        <div class="product-card">
                            <img src="https://pic.nximg.cn/file/20221216/33102792_122033355109_2.jpg" height="300"
                                width="300" alt="粉色紫色玫瑰鲜花花束摄影图__其他_自然景观_摄影图库_昵图网" class=" nofocus" tabindex="0"
                                aria-label="粉色紫色玫瑰鲜花花束摄影图__其他_自然景观_摄影图库_昵图网" role="button" data-bm="5">
                            <div class="product-info">
                                <h5>百花齐放多种组合自由搭配好看各种主题 可定制</h5>
                                <p class="price">¥ 12.22</p>
                                <p>库存: 27件</p>
                                <button class="btn btn-danger">加入购物车</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 页脚 -->
            <footer class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <h5>关于公司</h5>
                            <ul>
                                <li><a href="#">公司简介</a></li>
                                <li><a href="#">可持续发展</a></li>
                                <li><a href="#">信任中心</a></li>
                                <li><a href="#">管理层信息</a></li>
                                <li><a href="#">招贤纳士</a></li>
                                <li><a href="#">供应商</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h5>技术支持</h5>
                            <ul>
                                <li><a href="#">消费者技术支持</a></li>
                                <li><a href="#">商城云技术支持</a></li>
                                <li><a href="#">产品安全通告</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4 text-center qrcode">
                            <img src="https://pic.616pic.com/ys_bnew_img/00/06/01/tF1bPTYkBn.jpg" height="200"
                                width="200" alt="二维码图片免费下载_PNG素材_编号192i5p2gv_图精灵" class=" nofocus" tabindex="0"
                                aria-label="二维码图片免费下载_PNG素材_编号192i5p2gv_图精灵" role="button">
                        </div>
                    </div>
                </div>
            </footer>

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        </body>

        </html>

        </html>

        </html>