<#include "../layout/layout.ftl">
<@html page_title="话题编辑" page_tab="topic">
  <section class="content-header">
      <h1>
          话题
          <small>编辑</small>
      </h1>
      <ol class="breadcrumb">
          <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
          <li><a href="/admin/topic/list">话题</a></li>
          <li class="active">编辑</li>
      </ol>
  </section>
  <section class="content">
      <div class="box box-info">
          <div class="box-header with-border">
              <h3 class="box-title">话题编辑</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
              <form id="form">
                  <div class="form-group">
                      <label>标题</label>
                      <input type="text" id="title" value="${(topic.title)!}" class="form-control"/>
                  </div>
                  <div class="form-group">
                      <label>内容</label>
                      <!--副文本编译器开始-->
                      <div class="content">
                          <div id="editor">

                          </div>
                      </div>

                      <!--副文本编译器结束-->
                      <script type="text/javascript" src="/wangEditor/wangEditor.min.js"></script>
                      <!--添加弹窗插件-->
                      <script src="/layer/layer.js"></script>
                      <script type="text/javascript">
                          var E = window.wangEditor;
                          var editor = new E('#editor');
                          editor.create();

                          function huixian() {
                              editor.txt.html("${(topic.content)!}");
                          }

                          huixian();

                      </script>
                  </div>
                  <div class="form-group">
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
                                                  html += "<option value= '" + list[index] + " '>" + list[index] + "</option>"
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
                  </div>
                  <button type="submit" id="btn" class="btn btn-sm btn-primary">提交</button>
              </form>
          </div>
      </div>
  </section>
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
                        layer.msg("修改成功，跳转到话题列表", {time: 1500, icon: 6, shift: 3}, function () {
                            window.location.href = '/admin/topic/list';
                        });
                    } else {
                        layer.msg(data.describe, {time: 2000, icon: 5, shift: 6}, function () {

                        });
                    }
                }
            })
            return false;
        })
    });
</script>
</@html>