<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html lang="zh-CN">

        <head>
            <title>登录</title>
            <link rel="stylesheet" href="css/bootstrap.min.css">
            <style>
                body {
                    background: linear-gradient(120deg, #3498db, #8e44ad);
                    height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0;
                }

                .login-form {
                    background: white;
                    padding: 40px;
                    border-radius: 10px;
                    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                    width: 100%;
                    max-width: 400px;
                }

                .login-form h1 {
                    text-align: center;
                    color: #2c3e50;
                    margin-bottom: 30px;
                    font-size: 28px;
                }

                .form-group {
                    margin-bottom: 20px;
                }

                .form-control {
                    height: 45px;
                    border-radius: 5px;
                    border: 1px solid #ddd;
                    padding: 10px 15px;
                }

                .form-control:focus {
                    border-color: #3498db;
                    box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
                }

                .btn-primary {
                    background: #3498db;
                    border: none;
                    height: 45px;
                    border-radius: 5px;
                    font-size: 16px;
                    font-weight: 500;
                    margin-top: 10px;
                }

                .btn-primary:hover {
                    background: #2980b9;
                }

                p {
                    text-align: center;
                    margin-top: 20px;
                    color: #666;
                }

                a {
                    color: #3498db;
                    text-decoration: none;
                }

                a:hover {
                    color: #2980b9;
                    text-decoration: underline;
                }

                .error-message {
                    color: #e74c3c;
                    text-align: center;
                    margin-top: 15px;
                    font-size: 14px;
                }
            </style>
        </head>

        <body>
            <div class="login-form">
                <h1>系统登录</h1>

                <c:if test="${not empty requestScope.loginError}">
                    <div class="error-message">
                        ${requestScope.loginError}
                    </div>
                </c:if>

                <form class="form-horizontal" role="form" action="doLogin" method="post">
                    <div class="form-group">
                        <input type="text" name="username" class="form-control" id="inputEmail3" placeholder="账号/手机/邮箱"
                            required />
                    </div>
                    <div class="form-group">
                        <input type="password" name="pass" class="form-control" id="inputPassword3" placeholder="请输入密码"
                            required />
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-default btn-block btn-primary">登 录</button>
                    </div>
                    <p>还没有账号<a href="reg">去注册</a> </p>
                </form>
            </div>

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        </body>

        </html>