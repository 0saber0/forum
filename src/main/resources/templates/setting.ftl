<#include "layout/layout.ftl">
<@html page_title="个人设置" page_tab="setting">
<!--内容开始-->
<div class="container" style="padding: 0 25px;">
    <div class="row">

        <div class="col-md-3 hidden-sm hidden-xs" style="padding-right: 5px;padding-left: 5px">
            <div class="panel panel-default">
                <div class="list-group">
                    <button class="list-group-item list-btn active" onclick="changeRightDiv(0)">个人设置</button>
                    <button class="list-group-item list-btn" onclick="changeRightDiv(1)">修改头像</button>
                    <button class="list-group-item list-btn" onclick="changeRightDiv(2)">修改密码</button>
                    <button class="list-group-item list-btn" onclick="changeRightDiv(3)">用户令牌</button>
                    <button class="list-group-item list-btn" onclick="changeRightDiv(4)">日志记录</button>
                </div>
            </div>
        </div>

        <!--个人设置-->
        <div class="col-md-9 right-div" style="padding-right: 5px;padding-left: 5px">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="/index">主页</a> / 个人设置
                </div>
                <div class="panel-body">
                    <form method="post" id="userProfileForm" role="form" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="username">昵称</label>
                            <input disabled="" class="form-control" id="username" name="username" value="${user0.username!}" type="text">
                        </div>
                        <div class="form-group">
                            <label for="email">邮箱</label>
                            <input class="form-control" id="email" name="email" value="${user0.email!"未设置"}" type="text">
                        </div>
                        <div class="form-group">
                            <label for="intro">个性签名</label>
                            <textarea class="form-control" name="intro" id="intro">${user0.intro!"这个人很懒，什么都没写"}</textarea>
                        </div>
                        <div class="form-group">
                            <input name="commentEmail" id="commentEmail" checked="" type="checkbox">
                            <label for="commentEmail">话题被评论邮件提醒(该功能还在建设中)</label>
                        </div>
                        <div class="form-group">
                            <input name="replyEmail" id="replyEmail" checked="" type="checkbox">
                            <label for="replyEmail">评论被回复邮件提醒(该功能还在建设中)</label>
                        </div>
                        <button type="submit" id="userProfileUpdateBtn" class="btn btn-default">保存设置
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!--修改头像-->

        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/fileinput.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/locales/zh.js"></script>

        <div class="col-md-9 right-div" style="padding-right: 5px;padding-left: 5px">
            <div class="panel panel-default">
                <div class="panel-heading">修改头像</div>
                <div class="panel-body">
                    <form method="post" action="/user/image" class="image-form" enctype="multipart/form-data">
                        <div class="form-group">
                            <input id="itemImagers" name="file" type="file" class="itemImagers" data-overwrite-initial="false" value=""/>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            $("#itemImagers").fileinput();
        </script>

        <!--修改密码-->
        <div class="col-md-9 right-div" style="padding-right: 5px;padding-left: 5px">
            <div class="panel panel-default">
                <div class="panel-heading">
                    修改密码
                </div>
                <div class="panel-body">
                    <form id="passwordForm" method="post">
                        <div class="form-group">
                            <label for="oldPassword">旧密码</label>
                            <input class="form-control" id="oldPassword" name="oldPassword" type="password">
                        </div>
                        <div class="form-group">
                            <label for="newPassword">新密码</label>
                            <input class="form-control" id="newPassword" name="newPassword" type="password">
                        </div>
                        <button type="submit" class="btn btn-default password-btn">修改密码</button>
                    </form>
                </div>
            </div>
        </div>

        <!--用户令牌-->
        <div class="col-md-9 right-div" style="padding-right: 5px;padding-left: 5px">
            <div class="panel panel-default">
                <div class="panel-heading">用户令牌</div>
                <div class="panel-body">
                    <p>Token: e4221f6f-8c30-4ae9-91a0-678440fe1ccd <a href="" class="btn btn-xs btn-danger">刷新Token</a></p>
                    <p id="qrcode"><canvas width="256" height="256"></canvas></p>
                </div>
            </div>
        </div>

        <!--个人日志记录-->
        <div class="col-md-9 right-div" style="padding-right: 5px;padding-left: 5px">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="/index">主页</a> / 个人日志记录
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tbody><tr>
                            <th>ID</th>
                            <th>详情</th>
                            <th>添加日期</th>
                        </tr>
                        <tr>
                            <td>166</td>
                            <td>创建话题 <a href="" target="_blank">shi</a></td>
                            <td>3天前</td>
                        </tr>
                        </tbody></table>
                </div>

                <ul class="pagination pagination-sm hidden-xs hidden-sm hidden-md hidden-lg">

                    <!--<li>上页</li>-->

                    <li class="active"><a class="disabled">1</a></li>

                    <!--<li>下页</li>-->
                </ul>
            </div>
        </div>

    </div>
    <script>

        $("#userProfileForm").submit(function () {
            var email = $("#email").val();
            var intro = $("#intro").val();
            if (intro.length > 300) {
                layer.msg("个性签名不能超过300个字", {time: 1500, icon: 5, shift: 6}, function () {

                });
                return false;
            }
            var loadingUpdate = null;
            $.ajax({
                url: "/user/update",
                type: "POST",
                async: false,
                cache: false,
                dataType: 'json',
                data: {
                    "id" : '${user0.id}',
                    "email": $("#email").val(),
                    "intro": $("#intro").val()
                },
                beforeSend: function () {
                    loadingUpdate = layer.msg("处理中...", {icon: 16});
                },
                success: function (data) {
                    layer.close(loadingUpdate);
                    if (data.successful) {
                        layer.msg("修改成功", {time: 1500, icon: 6, shift: 3}, function () {

                        });
                    } else {
                        layer.msg(data.describe, {time: 2000, icon: 5, shift: 6}, function () {

                        });
                    }
                }
            });
            return false;
        });

        $("#passwordForm").submit(function () {
            var oldPassword = $("#oldPassword").val();
            var newPassword = $("#newPassword").val();
            if (!newPassword) {
                layer.msg("新密码不能为空", {time: 1500, icon: 6, shift: 6}, function () {

                });
                return false;
            }
            if (!oldPassword) {
                layer.msg("原密码不能为空", {time: 1500, icon: 6, shift: 6}, function () {

                });
                return false;
            }
            var updatepassword = null;
            $.ajax({
                url: "/user/updatePassword",
                type: "POST",
                async: false,
                cache: false,
                dataType: 'json',
                data: {
                    "id" : '${user0.id}',
                    "newPassword": newPassword,
                    "oldPassword": oldPassword
                },
                beforeSend: function () {
                    updatepassword = layer.msg("处理中...", {icon: 16});
                },
                success: function (data) {
                    layer.close(updatepassword);
                    if (data.successful) {
                        layer.msg("修改成功,请重新登录", {time: 1500, icon: 6, shift: 3}, function () {

                        });
                        setTimeout("window.location.href='/login'",1500);
                    } else {
                        layer.msg(data.describe, {time: 2000, icon: 5, shift: 6}, function () {

                        });
                    }
                }
            });
            return false;
        });

        var hiddenRightDiv = function() {
            $('.right-div').css('display','none');
            $($('.right-div')[0]).css('display','block');
        }
        hiddenRightDiv();
        var changeRightDiv = function(obj) {
            $('.right-div').css('display','none');
            $('.list-btn').removeClass("active");
            $($('.right-div')[obj]).css('display','block');
            $($('.list-btn')[obj]).addClass("active");
        }

        $('.btn-primary').click(function () {
            $('#newAvatarFile').click();
            $('#newAvatarFile').show();
        });
    </script>
</div>
<!--内容结束-->
</@html>