<#include "../layout/layout.ftl">
<@html page_title="权限列表" page_tab="admin_user_permission">
  <section class="content-header">
      <h1>
          权限
          <small>列表</small>
      </h1>
      <ol class="breadcrumb">
          <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
          <li><a href="/admin/permission/list">权限</a></li>
          <li class="active">添加</li>
      </ol>
  </section>
  <section class="content">
      <div class="box box-info">
          <div class="box-header with-border">
              <h3 class="box-title">权限添加</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
              <div class="row">
                  <div class="col-sm-9">
                      <form id="form">
                          <div class="form-group">
                              <label>权限名称</label>
                              <input type="text" id="permName" class="form-control" placeholder="如：话题删除权限">
                          </div>
                          <div class="form-group">
                              <label>授权地址</label>
                              <input type="text" id="permUrl" class="form-control" placeholder="如：/admin/topic/delete">
                          </div>
                          <button type="submit" class="btn btn-sm btn-primary">保存</button>
                      </form>
                  </div>
              </div>
          </div>
      </div>
  </section>
<script>

    $("#form").submit(function () {
        var name = $("#permName").val();
        var url = $("#permUrl").val();
        if (!name) {
            toast('权限名称不能为空');
            return false;
        }
        if (!url) {
            toast('授权地址不能为空');
            return false;
        }
        $.ajax({
            url: '/admin/permission/add',
            async: true,
            cache: false,
            type: 'post',
            dataType: 'json',
            data: {
                name: name,
                url: url
            },
            success: function (data) {
                if (data.successful) {
                    toast('添加成功');
                    setTimeout(function () {
                        window.location.href = "/admin/permission/list";
                    }, 1000);
                } else {
                    toast(data.describe);
                }
            }
        })
        return false;
    })
</script>
</@html>