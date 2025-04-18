<%-- Created by IntelliJ IDEA. User: admin Date: 2025/2/27 Time: 16:33 To change this template use File | Settings |
    File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html lang="zh-CN">

        <head>
            <title>注册</title>
            <link rel="stylesheet" href="css/bootstrap.min.css">
            <style>
                body {
                    background: linear-gradient(120deg, #3498db, #8e44ad);
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0;
                    padding: 20px 0;
                }

                .container {
                    background: white;
                    padding: 40px;
                    border-radius: 10px;
                    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                    width: 100%;
                    max-width: 500px;
                }

                h1 {
                    color: #2c3e50;
                    margin-bottom: 30px;
                    font-size: 28px;
                }

                .form-group {
                    margin-bottom: 20px;
                }

                label {
                    color: #2c3e50;
                    font-weight: 500;
                    margin-bottom: 8px;
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

                .input-group-text {
                    border-radius: 0 5px 5px 0;
                    border: 1px solid #ddd;
                }

                .btn-outline-secondary {
                    border-color: #3498db;
                    color: #3498db;
                }

                .btn-outline-secondary:hover {
                    background-color: #3498db;
                    color: white;
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

                .text-success {
                    color: #27ae60 !important;
                }

                .text-danger {
                    color: #e74c3c !important;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h1 class="text-center mt-5">注册页面</h1>

                <form class="mt-4">
                    <div class="form-group">
                        <label for="username">账号*</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="username" placeholder="请输入用户名">
                            <div class="input-group-append" id="username-feedback" style="display: none;">
                                <span class="input-group-text"></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password">密码*</label>
                        <input type="password" class="form-control" id="password" placeholder="请输入密码">
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">确认密码*</label>
                        <input type="password" class="form-control" id="confirmPassword" placeholder="请确认密码">
                    </div>

                    <div class="form-group">
                        <label for="phone">手机*</label>
                        <div class="input-group">
                            <input type="tel" class="form-control" id="phone" placeholder="请输入手机号或固定电话">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" id="get-code">获取验证码</button>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="verificationCode">验证码*</label>
                        <input type="text" class="form-control" id="verificationCode" placeholder="请输入验证码">
                    </div>

                    <button type="submit" class="btn btn-primary btn-block">注册</button>
                    <p>已有账号<a href="login.jsp">去登陆</a> </p>
                </form>
            </div>

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            <script>
                $(document).ready(function () {
                    // 用户名输入框失去焦点时触发
                    $('#username').blur(function () {
                        var username = $(this).val();
                        var feedback = $('#username-feedback');
                        var feedbackText = feedback.find('.input-group-text');

                        // 模拟 AJAX 请求（实际应用中应替换为真正的 AJAX 调用）
                        // 这里只是一个简单的示例，假设用户名为 "test" 时不可用，其他都可用
                        if (username === "test") {
                            feedbackText.text('账号已被占用').removeClass('text-success').addClass('text-danger');
                            feedback.show();
                        } else if (username) { // 检查用户名是否为空
                            feedbackText.text('账号可使用').removeClass('text-danger').addClass('text-success');;
                            feedback.show();
                        } else {
                            feedback.hide(); //如果为空，隐藏反馈
                        }
                    });

                    // 模拟获取验证码按钮点击事件
                    $('#get-code').click(function () {
                        //这里实现获取验证码逻辑
                        alert("获取验证码逻辑")
                    })
                });
            </script>
        </body>

        </html>