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

                .error-message {
                    color: #e74c3c;
                    font-size: 14px;
                    margin-top: 5px;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h1 class="text-center mt-5">注册页面</h1>

                <!-- 显示错误信息 -->
                <% if(request.getAttribute("error") !=null) { %>
                    <div class="alert alert-danger">
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>

                        <form class="mt-4" action="${pageContext.request.contextPath}/doReg" method="POST"
                            id="registerForm">
                            <div class="form-group">
                                <label for="username">账号*</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="username" name="username"
                                        placeholder="请输入用户名" required maxlength="20">
                                    <div class="input-group-append" id="username-feedback" style="display: none;">
                                        <span class="input-group-text"></span>
                                    </div>
                                </div>
                                <small class="form-text text-muted">用户名最多20个字符</small>
                            </div>

                            <div class="form-group">
                                <label for="password">密码*</label>
                                <input type="password" class="form-control" id="password" name="pass"
                                    placeholder="请输入密码" required>
                            </div>

                            <div class="form-group">
                                <label for="confirmPassword">确认密码*</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPass"
                                    placeholder="请确认密码" required>
                                <div id="passwordError" class="error-message" style="display: none;">两次输入的密码不一致</div>
                            </div>

                            <div class="form-group">
                                <label for="phone">手机*</label>
                                <div class="input-group">
                                    <input type="tel" class="form-control" id="phone" name="tel"
                                        placeholder="请输入手机号或固定电话" required maxlength="11" pattern="[0-9]{11}">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button"
                                            id="get-code">获取验证码</button>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="verificationCode">验证码*</label>
                                <input type="text" class="form-control" id="verificationCode" name="code"
                                    placeholder="请输入验证码" required>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block" id="submitBtn">注册</button>
                            <p>已有账号<a href="${pageContext.request.contextPath}/login">去登录</a> </p>
                        </form>
            </div>

            <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            <script>
                $(document).ready(function () {
                    // 用户名输入框失去焦点时触发
                    $('#username').blur(function () {
                        var username = $(this).val();
                        var feedback = $('#username-feedback');
                        var feedbackText = feedback.find('.input-group-text');

                        if (!username) {
                            feedback.hide(); //如果为空，隐藏反馈
                            return;
                        }

                        // 检查用户名长度
                        if (username.length > 20) {
                            feedbackText.text('用户名长度不能超过20个字符').removeClass('text-success').addClass('text-danger');
                            feedback.show();
                            return;
                        }

                        // 使用AJAX请求检查用户名是否可用
                        $.ajax({
                            url: '${pageContext.request.contextPath}/checkUsername',
                            method: 'POST',
                            data: { username: username },
                            success: function (response) {
                                if (response === 'available') {
                                    feedbackText.text('账号可使用').removeClass('text-danger').addClass('text-success');
                                } else {
                                    feedbackText.text('账号已被占用').removeClass('text-success').addClass('text-danger');
                                }
                                feedback.show();
                            },
                            error: function () {
                                // 如果AJAX请求失败，继续使用模拟方式
                                if (username === "test") {
                                    feedbackText.text('账号已被占用').removeClass('text-success').addClass('text-danger');
                                } else {
                                    feedbackText.text('账号可使用').removeClass('text-danger').addClass('text-success');
                                }
                                feedback.show();
                            }
                        });
                    });

                    // 检查密码一致性
                    $('#confirmPassword').blur(function () {
                        var password = $('#password').val();
                        var confirmPassword = $(this).val();

                        if (password && confirmPassword && password !== confirmPassword) {
                            $('#passwordError').show();
                        } else {
                            $('#passwordError').hide();
                        }
                    });

                    // 表单提交前验证
                    $('#registerForm').submit(function (event) {
                        var password = $('#password').val();
                        var confirmPassword = $('#confirmPassword').val();

                        // 检查密码是否一致
                        if (password !== confirmPassword) {
                            $('#passwordError').show();
                            event.preventDefault();
                            return false;
                        }

                        // 检查用户名长度
                        var username = $('#username').val();
                        if (username.length > 20) {
                            alert('用户名长度不能超过20个字符');
                            event.preventDefault();
                            return false;
                        }

                        return true;
                    });

                    // 获取验证码按钮点击事件
                    $('#get-code').click(function () {
                        var phone = $('#phone').val();
                        if (!phone) {
                            alert('请先输入手机号');
                            return;
                        }
                        if (!/^[0-9]{11}$/.test(phone)) {
                            alert('请输入11位手机号码');
                            return;
                        }

                        // 倒计时功能
                        var btn = $(this);
                        var seconds = 60;
                        btn.prop('disabled', true);
                        btn.text(seconds + '秒后重试');

                        var timer = setInterval(function () {
                            seconds--;
                            btn.text(seconds + '秒后重试');
                            if (seconds <= 0) {
                                clearInterval(timer);
                                btn.prop('disabled', false);
                                btn.text('获取验证码');
                            }
                        }, 1000);

                        // 这里实现获取验证码逻辑
                        alert("验证码已发送至" + phone);
                    });
                });
            </script>
        </body>

        </html>