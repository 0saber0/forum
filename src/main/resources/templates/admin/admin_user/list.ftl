<#include "../layout/layout.ftl">
<@html page_title="用户列表" page_tab="admin_user_list">
  <section class="content-header">
      <h1>
          用户
          <small>列表</small>
      </h1>
      <ol class="breadcrumb">
          <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
          <li><a href="/admin/user/list">用户</a></li>
          <li class="active">列表</li>
      </ol>
  </section>
  <section class="content">
      <div class="box box-info">
          <div class="box-header with-border">
              <h3 class="box-title">用户列表</h3>
        <#if shi.allGranted('后台用户添加')>
          <a href="/admin/admin_user/addPage" class="btn btn-sm btn-primary pull-right">添加</a>
        </#if>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
              <table class="table table-bordered">
                  <thead>
                  <tr>
                      <th>#</th>
                      <th>用户名</th>
                      <th>注册时间</th>
                      <th>状态</th>
                      <th>操作</th>
                  </tr>
                  </thead>
                  <tbody>

                      <#list userInfoList as user>
                      <tr <#if user.state == 2> class="danger"</#if>>
                          <td>${user.id}</td>
                          <td>${user.username!}</td>
                          <td>${user.inTime?string("yyyy/MM/dd")}</td>
                          <td>
                            <#if user.state == 2>
                                <span class="text-danger">禁用</span>
                            <#elseif user.state == 1>
                              <span class="text-success">正常</span>
                            <#else>
                            </#if>
                          </td>
                          <td>
                            <#if  user.username == "admin">
                            <#else>
                            <#if shi.allGranted('后台用户禁用')>
                              <button onclick="blockBtn('${user.id}')" class="btn btn-sm btn-warning">禁用</button>
                            </#if>
                            <#if shi.allGranted('后台用户启用')>
                              <button onclick="useringBtn('${user.id}')" class="btn btn-sm btn-warning">启用</button>
                            </#if>
                            <#if shi.allGranted('后台用户编辑')>
                              <a href="/admin/admin_user/editPage?id=${user.id}" class="btn btn-sm btn-warning">编辑</a>
                            </#if>
                            <#if shi.allGranted('后台用户删除')>
                              <button onclick="deleteBtn('${user.id}')" class="btn btn-sm btn-danger">删除</button>
                            </#if>
                            </#if>
                          </td>
                      </tr>
                      </#list>
                  </tbody>
              </table>
          </div>
      <#if basePageResult.totalPage &gt; 1>
        <div class="box-footer clearfix">
          <#include "../layout/paginate.ftl">
          <@paginate currentPage=(basePageResult.getPageNum()) totalPage=basePageResult.getTotalPage() actionUrl="/admin/user/list" urlParas=""/>
        </div>
      </#if>
      </div>
  </section>
<script>
    function deleteBtn(id) {
        if (confirm('确定要删除这个用户吗？\r\n 注：此过程不可逆！！')) {
            if (confirm('真的确定了吗？此过程不可逆！！！')) {
                $.ajax({
                    url: '/admin/admin_user/delete',
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
    }

    function blockBtn(id) {
        $.ajax({
            url: '/admin/admin_user/block',
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
            url: '/admin/admin_user/usering',
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