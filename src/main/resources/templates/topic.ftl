<#include "./layout/layout.ftl">
<@html page_title="帖子详情">
    <!--内容开始-->
<div class="container" style="border-radius: 15px;margin-top: 10px">
    <div class="content">
        <div class="left-content">
            <div class="left-content-list">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <ol class="breadcrumb">
                            <li><a href="/index">首页</a></li>
                            <li class="active">详情</li>
                        </ol>
                    </div>

                    <div class="panel-body paginate-bot">

                        <h2>${(topicDetailPageResult.topic.title)!}
                        </h2>

                        <div class="divide mar-top-5"></div>

                        <div class="media topic-media">
                            <div class="media-left">
                                <a href="/homepage/${(topicDetailPageResult.user.id)!}"><img
                                        src="../photo/user/${(topicDetailPageResult.user.image)!}"
                                        class="topic-img" alt=""></a>
                            </div>
                            <div class="media-body topic-media-body">
                                <p class="gray">
                                    <#if topicDetailPageResult.topic.good == 1>
                                        <a href="/index?good=true"><span class="label label-success">精</span></a>
                                        <span class="hidden-sm hidden-xs">•</span>
                                    </#if>
                                    <span><a
                                            href="/homepage/${topicDetailPageResult.user.id}">${(topicDetailPageResult.user.username)!}</a></span>
                                    <span class="hidden-sm hidden-xs">•</span>
                                    <span class="hidden-sm hidden-xs"><a href="#">${(topicDetailPageResult.replyCount)!}个评论</a></span>
                                    <span class="hidden-sm hidden-xs">•</span>
                                    <span class="hidden-sm hidden-xs">${(topicDetailPageResult.topic.view)!}次浏览</span>
                                    <span>•</span>
                                    <span>${topicDetailPageResult.topic.inTime?string("MM/dd")}</span>
                                    <#if user0??>
                                    <#if user0.username == topicDetailPageResult.user.username>
                                        <span class="hidden-sm hidden-xs">•</span>
                                        <span class="hidden-sm hidden-xs"><a href="/topic/edit?id=${(topicDetailPageResult.topic.id)!}">编辑</a></span>
                                        <span class="hidden-sm hidden-xs">•</span>
                                        <span class="hidden-sm hidden-xs"><a href="javascript:if(confirm('确定要删除《${(topicDetailPageResult.topic.title)!}》吗？'))location.href='/topic/delete?id=${(topicDetailPageResult.topic.id)!}&&userId=${user0.id!}'">删除</a></span>
                                    </#if>
                                    </#if>
                                </p>
                            </div>
                        </div>

                        <div class="divide mar-top-5"></div>

                        <div class="media topic-media">
                            ${topicDetailPageResult.topic.content!}
                        </div>
                        <p>
                                <#list topicDetailPageResult.topic.tags?split(",") as tag>
                                    <a href="/tags/${tag}"><span class="label label-success">${tag}</span></a>
                                </#list>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="right-content">
            <#if user0??>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="media">
                            <div class="media-left">
                                <a href="/homepage/${user0.id}">
                                    <img src="/photo/user/${user0.image!"1.jpg"}" title=""
                                         class="avatar" style="width: 48px;height: 48px">
                                </a>
                            </div>
                            <div class="media-body">
                                <div class="media-heading">
                                    <a href="/homepage/${user0.id}">${user0.username!}</a>
                                    <div style="color: #7A7A7A; font-size: 12px; margin-top:5px;">
                                        <i>
                                            ${user0.intro!"这家伙很懒，什么都没有留下"}
                                        </i>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 15px;">
                                <a href="/topic/create" style="text-decoration: underline"><span
                                        class="glyphicon glyphicon-pencil"></span><i>发布话题</i></a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer" style="background-color: white">
                        <div class="row">
                            <span class="col-md-6"><a href="/building"><span
                                    id="n_count">0</span> 条未读消息</a></span>
                            <span class="col-md-6 text-right">声望：<a href="/building">0</a></span>
                        </div>
                    </div>
                </div>
            <#else>
            <div class="panel panel-default">
                <div class="panel-body">
                    <h5>属于Java语言的bbs</h5>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在这里，您可以提问，回答，分享，诉说，这是个属于Java程序员的社区，欢迎您的加入！</p>
                </div>
            </div>
            </#if>
        </div>
    </div>
</div>
<!--评论区开始-->
<div class="container topic-comment" style="border-radius: 15px;margin-top: 10px">
    <div class="content">
        <div class="left-content">
            <div class="left-content-list">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-heading breadcrumb">${topicDetailPageResult.replyCount} 条评论</div>
                    </div>

                    <div class="panel-body paginate-bot">

                        <div class="media media-comment" style="margin-left: 0px;">

                            <#list topicDetailPageResult.replys as replyResult>
                                <div class="media-body">
                                    <div class="media-heading gray">
                                        <a href="/homepage/${replyResult.user.id}"><img
                                                src="/photo/user/${replyResult.user.image!"1.jpg"}"
                                                class="comment-img" alt=""></a>
                                        <a href="/homepage/${replyResult.user.id}">${replyResult.user.username!} </a>
                                        ${replyResult.reply.inTime?string("MM/dd")}
                                    </div>
                                    <div class="show_big_image comment-detail-content clearfix">
                                        <p>${replyResult.reply.content!}<br></p>
                                    </div>
                                </div>
                                <div class="divide mar-bottom-0"></div>
                            </#list>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--评论区结束-->


<!--副文本编译器开始-->
<div class="container topic-comment" style="border-radius: 15px;margin-top: 10px">
    <div class="content">
        <div class="left-content">
            <div class="left-content-list">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-heading breadcrumb">发表评论</div>
                    </div>

                    <div class="panel-body paginate-bot">
                        <div class="media media-comment" style="margin-left: 0px;">
                            <div id="editor">

                            </div>
                        </div>
                    </div>

                    <#if user0??>
                    <div class="panel-heading">
                        <div class="panel-heading breadcrumb editor-btn">
                            <button id="reply-submit-btn">提交</button>
                        </div>
                    </div>
                    <#else >
                    <div class="panel-heading">
                        <div class="panel-heading breadcrumb editor-btn">
                            <a href="/login">登录可评论</a>
                        </div>
                    </div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>
<!--副文本编译器结束-->
<script type="text/javascript" src="/wangEditor/wangEditor.min.js"></script>
<script type="text/javascript">

    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.create();

    document.getElementById('reply-submit-btn').addEventListener('click', function () {
        // 读取内容
        var comment = editor.txt.text();
        if (!comment) {
            layer.msg("您还没有写任何评论，请输入后重试", {time: 1500, icon: 5, shift: 6}, function () {

            });
            return false;
        }
        var loadingReply = null;
        $.ajax({
            url: "/reply/save",
            type: "POST",
            async: false,
            cache: false,
            dataType: 'json',
            data: {
                "topicId": '${topicDetailPageResult.topic.id!}',
                "userId": '${(user0.id)!}',
                "comment": comment
            },
            beforeSend: function () {
                loadingReply = layer.msg("处理中...", {icon: 16});
            },
            success: function (data) {
                layer.close(loadingReply);
                if (data.successful) {
                    layer.msg("评论成功，跳转到浏览页", {time: 1500, icon: 6, shift: 3}, function () {

                    });
                    setTimeout("window.location.href='/topic/${topicDetailPageResult.topic.id!}'", 1500);
                } else {
                    layer.msg(data.describe, {time: 2000, icon: 5, shift: 6}, function () {

                    });
                }
            }
        });
        return false;
    }, false);

</script>
<!--内容结束-->
</@html>