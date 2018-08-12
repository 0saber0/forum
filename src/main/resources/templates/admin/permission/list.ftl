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
          <li class="active">列表</li>
      </ol>
  </section>
  <section class="content">
      <div class="box box-info">
          <div class="box-header with-border">
              <h3 class="box-title">权限列表</h3>
              <#if shi.allGranted('权限添加许可')>
                <a href="/admin/permission/addPage" class="btn btn-sm btn-primary pull-right">添加</a>
              </#if>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
              <table class="table table-bordered">
                  <thead>
                  <tr>
                      <th>#</th>
                      <th>权限名称</th>
                      <th>url</th>
                      <th>操作</th>
                  </tr>
                  </thead>
                  <tbody>
                    <#list sysPermissionList as perm>
                    <tr>
                        <td>${perm.id}</td>
                        <td>${perm.name!}</td>
                        <td>${perm.url!}</td>
                        <td>
                            <#if shi.allGranted('权限编辑许可')>
                              <a href="/admin/permission/editPage?id=${perm.id}" class="btn btn-sm btn-warning">编辑</a>
                            </#if>
                            <#if shi.allGranted('权限删除许可')>
                              <button onclick="deleteBtn('${perm.id}')" class="btn btn-sm btn-danger">删除</button>
                            </#if>
                        </td>
                    </tr>

                    </#list>
                  </tbody>
              </table>
          </div>
      </div>
  </section>
<script>
    function deleteBtn(id) {
        if (confirm('确定要删除这个权限吗？\r\n 注：此过程不可逆！！')) {

            $.ajax({
                url: '/admin/permission/delete',
                type: 'get',
                async: false,
                cache: false,
                dataType: 'json',
                data: {
                    id: id
                },
                success: function (data) {
                    if (data.successful) {
                        window.location.reload();
                    } else {
                        toast(data.describe);
                    }
                }
            })

        }
    }
</script>
</@html>