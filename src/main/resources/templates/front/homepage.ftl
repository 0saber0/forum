<#include "layout/layout.ftl">
<@html page_title="个人主页" page_tab="user">
<!--内容开始-->
<div class="container" style="padding: 0 25px;">
    <div class="row">
        <div class="col-md-3" style="padding-left: 5px;padding-right: 5px">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="media">
                        <div class="media-left">
                            <img src="/photo/user/${homepage_user.image!"1.jpg"}" class="avatar-lg"
                                 alt="" style="height: 75px;width: 75px">
                        </div>
                        <div class="media-body homepage-media">
                            <h3 style="margin-top: 0">${homepage_user.username!}</h3>
                            <p>声望：<a href="">0</a></p>
                            <div>收藏话题: <a href="">0</a></div>
                            <div>入驻时间: ${homepage_user.inTime?string("yyyy/MM/dd")}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-9" style="padding-left: 5px;padding-right: 5px">
            <div class="panel panel-default">
                <div class="panel-heading">${homepage_user.username!}创建的话题</div>
                <div class="panel-body paginate-bot">

                    <#if homepage_topic_list?size<1 >
                        他还没有发表任何话题
                        <#else >
                        <#list homepage_topic_list as topic_list>
                        <div class="media">
                            <div class="media-body">
                                <div class="title">
                                    <a href="/topic/${topic_list.id!}">
                                        ${topic_list.title!}
                                    </a>
                                </div>
                                <p>
                                    <span><a href="/homepage/${homepage_user.id}">${homepage_user.username}</a></span>
                                    <span class="hidden-sm hidden-xs">•</span>
                                    <span class="hidden-sm hidden-xs"><a href="/topic/${topic_list.id}">${topic_list.replyCount!}个评论</a></span>
                                    <span class="hidden-sm hidden-xs">•</span>
                                    <span class="hidden-sm hidden-xs">${topic_list.view!"0"}次浏览</span>
                                    <span>•</span>
                                    <span>${topic_list.inTime?string("yyyy/MM/dd")}</span>
                                </p>
                            </div>
                        </div>
                        <div class="divide mar-top-5"></div>
                        </#list>
                    </#if>

                </div>
                <div class="panel-footer">
                    <a href="/user/${homepage_user.username}/topics?pageNum=1">${homepage_user.username}更多话题&gt;&gt;</a>
                </div>
            </div>

            <div class="panel panel-default" style="margin-top: 10px">
                <div class="panel-heading">${homepage_user.username}评论的话题</div>
                <table class="table table-striped">
                    <tbody>

                    <#if homepage_reply?size<1 >
                        他还没有发表任何评论
                        <#else >
                        <#list homepage_reply as replys>
                        <tr>
                            <td>
                                ${replys.inTime?string("MM/dd")}
                                评论了
                                <a href="/homepage/${replys.userId}">${replys.username}</a>
                                创建的话题 › <a href="/topic/${replys.topicId}">${replys.title}</a>
                            </td>
                        </tr>
                        <tr class="user_comments">
                            <td class="show_big_image">
                                ${replys.content}
                            </td>
                        </tr>
                        </#list>
                    </#if>

                    </tbody>
                </table>
                <div class="panel-footer">
                    <a href="/user/${homepage_user.username}/replys?pageNum=1">${homepage_user.username}更多评论&gt;&gt;</a>
                </div>
            </div>
            <button id="toggleBigImageBtn" data-toggle="modal" class="hidden" data-target="#showBigImageModal"></button>
            <div class="modal fade" tabindex="-1" role="dialog" id="showBigImageModal">
                <div class="modal-dialog" style="width: 98%" role="document">
                    <div class="modal-content">
                        <div class="modal-body text-center">
                            <img src="" id="bigImage" style="max-width: 100%;" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $(function () {
                    $(".show_big_image img").click(function () {
                        var src = $(this).attr("src");
                        $("#bigImage").attr("src", src);
                        $("#toggleBigImageBtn").click();
                    });
                })
            </script>
        </div>

    </div>
</div>
<!--内容结束-->
</@html>