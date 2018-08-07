<#include "../layout/layout.ftl">
<@html page_title="评论编辑" page_tab="comment">
  <section class="content-header">
    <h1>
      评论
      <small>列表</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li><a href="/admin/comment/list">评论</a></li>
      <li class="active">编辑</li>
    </ol>
  </section>
  <section class="content">
    <div class="box box-info">
      <div class="box-header with-border">
        <h3 class="box-title">评论编辑</h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <form id="form">
          <div class="form-group">
            <label>话题</label>
            <p>${replyAdmin.title!}</p>
          </div>
          <div class="form-group">
            <label>评论内容</label>
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
                      editor.txt.html("${(replyAdmin.content)!}");
                  }

                  huixian();

              </script>
          </div>
          <button type="submit" id="btn" class="btn btn-sm btn-primary">提交</button>
        </form>
      </div>
    </div>
  </section>
<script>
  $(function() {
    $("#form").submit(function() {
      var content = editor.txt.html();
      if(!content) {
        toast("评论不能为空");
      } else {
        $.ajax({
          url: '/admin/comment/editSave',
          type: 'post',
          async: false,
          cache: false,
          dataType: 'json',
          data: {
            id: '${replyAdmin.id}',
            content: content
          },
          success: function(data){
            if(data.successful) {
              window.location.href = "/admin/comment/list";
            } else {
              toast(data.describe);
            }
          }
        })
        return false;
      }
    })
  })
</script>
</@html>