<#include "layout/layout.ftl">
<@html page_title="登录" page_tab="login">
<!--内容开始-->
<div class="container" style="border-radius: 15px;margin-top: 10px">
    <div class="content">
        <div class="left-content">
            <div class="left-content-list">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <ol class="breadcrumb">
                            <li><a href="#">首页</a></li>
                            <li class="active">登录</li>
                        </ol>
                    </div>

                    <div class="panel-body paginate-bot">
                        <div class="panel-body">
                            <form role="form" id="form" method="post">
                                <div class="form-group">
                                    <label for="username">用户名</label>
                                    <input class="form-control" id="username" name="username" placeholder="用户名"
                                           type="text">
                                </div>
                                <div class="form-group">
                                    <label for="password">密码</label>
                                    <input class="form-control" id="password" name="password" placeholder="密码"
                                           type="password">
                                </div>
                                <div class="form-group">
                                    <label for="code">验证码</label>
                                    <div class="input-group">
                                        <input class="form-control" id="code" name="code" placeholder="验证码" type="text">
                                        <span class="input-group-btn">
                                            <img src="/common/code" id="changeCode" title="点击切换"/>
                                        </span>
                                    </div>
                                </div>
                                <div class="login-btn">
                                    <button id="btn" class="btn btn-default" type="submit">登录</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="right-content">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h5>其他登录方式</h5>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ，微信，.....<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ，微信，.....<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ，微信，.....<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ，微信，.....<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ，微信，.....<br>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--内容结束-->
<script type="text/javascript">
    $(function () {
        $("#changeCode").click(function () {
            var date = new Date();
            $(this).attr("src", "/common/code?ver=" + date.getTime());
        })
        $("#form").submit(function () {
            var username = $("#username").val();
            var password = $("#password").val();
            var code = $("#code").val();
            if (!username) {
                layer.msg("用户名不能为空", {time: 1500, icon: 5, shift: 6}, function () {

                });
                return false;
            }
            if (!password) {
                layer.msg("密码不能为空", {time: 1500, icon: 5, shift: 6}, function () {

                });
                return false;
            }
            if (!code) {
                layer.msg("验证码不能为空", {time: 1500, icon: 5, shift: 6}, function () {

                });
                return false;
            }
            var loadingLogin = null;
            $.ajax({
                url: "user/login",
                type: "POST",
                async: false,
                cache: false,
                dataType: 'json',
                data: {
                    "username": $("#username").val(),
                    "password": $("#password").val(),
                    "code": $("#code").val()
                },
                beforeSend: function () {
                    loadingLogin = layer.msg("处理中...", {icon: 16});
                },
                success: function (data) {
                    layer.close(loadingLogin);
                    if (data.successful) {
                        layer.msg("登录成功，跳转到浏览页", {time: 1500, icon: 6, shift: 3}, function () {
                            window.location.href='/index';
                        });
                    } else {
                        layer.msg(data.describe, {time: 2000, icon: 5, shift: 6}, function () {

                        });
                    }
                }
            });
            return false;
        })
    })
</script>
</@html>