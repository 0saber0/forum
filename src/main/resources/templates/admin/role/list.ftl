<#include "../layout/layout.ftl">
<@html page_title="角色列表" page_tab="admin_user_role">
  <section class="content-header">
      <h1>
          角色
          <small>列表</small>
      </h1>
      <ol class="breadcrumb">
          <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
          <li><a href="/admin/role/list">角色</a></li>
          <li class="active">列表</li>
      </ol>
  </section>
  <section class="content">
      <div class="box box-info">
          <div class="box-header with-border">
              <h3 class="box-title">角色列表</h3>
        <#if shi.allGranted('角色添加许可')>
          <a href="/admin/role/addPage" class="btn btn-sm btn-primary pull-right">添加</a>
        </#if>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
              <table class="table table-bordered">
                  <thead>
                  <tr>
                      <th>#</th>
                      <th>角色名称</th>
                      <th>状态</th>
                      <th>操作</th>
                  </tr>
                  </thead>
                  <tbody>
          <#list sysRoleList as role>
          <tr <#if role.available == 2> class="danger"</#if>>
              <td>${role.id}</td>
              <td>${role.role!}</td>
              <td>
                <#if role.available == 2>
                    <span class="text-danger">禁用</span>
                <#else>
                  <span class="text-success">正常</span>
                </#if>
              </td>
              <td>
                <#if shi.allGranted('角色禁用许可')>
                  <button onclick="blockBtn('${role.id}')" class="btn btn-sm btn-warning">禁用</button>
                </#if>
                <#if shi.allGranted('角色启用许可')>
                  <button onclick="useringBtn('${role.id}')" class="btn btn-sm btn-warning">启用</button>
                </#if>
                <#if shi.allGranted('角色编辑许可')>
                  <a href="/admin/role/editPage?id=${role.id}" class="btn btn-sm btn-warning">编辑</a>
                </#if>
                <#if shi.allGranted('角色删除许可')>
                  <button onclick="deleteBtn('${role.id}')" class="btn btn-sm btn-danger">删除</button>
                </#if>
              </td>
          </tr>
            <#if role.description??>
              <tr>
                  <td colspan="3">${role.description!}</td>
              </tr>
            </#if>
          </#list>
                  </tbody>
              </table>
          </div>
      </div>
  </section>
<script>
    function deleteBtn(id) {
        if (confirm('确定要删除这个角色吗？\r\n 注：此过程不可逆！！')) {

            $.ajax({
                url: '/admin/role/delete',
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

    function blockBtn(id) {
        $.ajax({
            url: '/admin/role/block',
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

    function useringBtn(id) {
        $.ajax({
            url: '/admin/role/usering',
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
</script>
</@html>