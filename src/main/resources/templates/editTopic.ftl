<#include "layout/layout.ftl">
<@html page_title="编辑话题" page_tab="">
<!--内容开始-->
<div class="container" style="padding: 0 25px;">
    <form class="hidden-lg hidden-md" style="margin: 0 -10px;" role="search" action="/search" method="get">
        <div class="form-group has-feedback" style="margin-bottom: 10px;">
            <input class="form-control" name="q" value="" placeholder="回车搜索" type="text">
            <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span>
        </div>
    </form>
    <div class="row">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="/index">主页</a> / <a href="/homepage/${user0.id!}">${user0.username!}</a> / 编辑话题
                </div>
                <div class="panel-body">
                    <form id="form">
                        <!--标题-->
                        <div class="form-group">
                            <label for="title">标题</label>
                            <input class="form-control" id="title" name="title" placeholder="标题" type="text"
                                   value="${topic.title!}">
                        </div>

                        <!--内容-->
                        <div class="form-group">
                            <label for="content">内容</label>
                            <!--副文本编译器开始-->

                            <div class="content">
                                <div id="editor">

                                </div>
                            </div>

                            <!--副文本编译器结束-->
                            <script type="text/javascript" src="/wangEditor/wangEditor.min.js"></script>
                            <script type="text/javascript">
                                var E = window.wangEditor;
                                var editor = new E('#editor');
                                editor.create();

                                function huixian() {
                                    editor.txt.html("${topic.content!}");
                                }

                                huixian();

                            </script>
                        </div>

                        <!--标签-->
                        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
                              rel="stylesheet"/>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
                        <div class="form-group">
                            <label for="tag">标签</label>
                            <select id="tags" name="tags" multiple="multiple"
                                    class="form-control js-example-basic-multiple">
                                    <#list topic.tags?split(",") as listTag>
                                        <option value="${listTag}">${listTag}</option>
                                    </#list>
                            </select>
                            <script>

                                function optionList() {
                                    var html = "";
                                    $.ajax({
                                        url: "/tags/gettags",
                                        type: "GET",
                                        async: false,
                                        cache: false,
                                        dataType: 'json',
                                        success: function (data) {
                                            if (data.successful) {
                                                var list = data.datas;

                                                for (var index = 0; index < list.length; index++) {
                                                    html += "<option value= '" + list[index] +  " '>" + list[index] + "</option>"
                                                }

                                                $('#tags').append(html);

                                                $("#tags").select2({
                                                    placeholder: '请选择',//默认文字提示
                                                    allowClear: true,
                                                    tags: true//允许手动添加
                                                });

                                                $('#tags').val([<#list topic.tags?split(",") as taglist>'${taglist!}',</#list>]).trigger('change');

                                            } else {
                                                layer.msg(data.describe, {time: 2000, icon: 5, shift: 6}, function () {

                                                });
                                            }
                                        }
                                    });

                                }

                                optionList();



                            </script>
                        </div>

                        <button type="button" id="btn" class="btn btn-default">
                            <span class="glyphicon glyphicon-send"></span> 提交
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-3 hidden-sm hidden-xs">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <b>话题发布指南</b>
                </div>
                <div class="panel-body">
                    <p>• 在标题中描述内容要点。如果一件事情在标题的长度内就已经可以说清楚，那就没有必要写正文了。</p>
                    <p>• 保持对陌生人的友善。用知识去帮助别人。</p>
                    <p>• <b>如果是转载的文章，请务必只填上原文的URL，内容就不用复制过来了。</b></p>
                    <p>• 请为你的主题选择至少一个，最多五个标签。恰当的归类会让你发布的信息更加有用。</p>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $("#btn").click(function () {
                var title = $("#title").val();
                if (!title) {
                    layer.msg("请输入标题", {time: 1500, icon: 5, shift: 6}, function () {

                    });
                    return false;
                }
                var content = editor.txt.html();
                var tagsObject = $("#tags").val();

                if (!tagsObject) {
                    layer.msg("请输入标签", {time: 1500, icon: 5, shift: 6}, function () {

                    });
                    return false;
                }
                var tags = tagsObject.toString();
                var loadingCreate = null;
                $.ajax({
                    url: '/topic/editSave',
                    type: 'post',
                    async: false,
                    cache: false,
                    dataType: 'json',
                    data: {
                        "id": ${topic.id},
                        "title": title,
                        "content": content,
                        "tags": tags
                    },
                    beforeSend: function () {
                        loadingCreate = layer.msg("处理中...", {icon: 16});
                    },
                    success: function (data) {
                        layer.close(loadingCreate);
                        if (data.successful) {
                            layer.msg("修改成功，跳转到详情页", {time: 1500, icon: 6, shift: 3}, function () {
                                window.location.href = '/topic/' + data.datas;
                            });
                        } else {
                            layer.msg(data.describe, {time: 2000, icon: 5, shift: 6}, function () {

                            });
                        }
                    }
                })
            })
        });
    </script>
</div>
<!--内容结束-->
</@html>