<#include "../layout/layout.ftl">
<@html page_title="用户编辑" page_tab="admin_user_list">
  <section class="content-header">
    <h1>
      用户
      <small>编辑</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li><a href="/admin/user/list">用户</a></li>
      <li class="active">编辑</li>
    </ol>
  </section>
  <section class="content">
    <div class="box box-info">
      <div class="box-header with-border">
        <h3 class="box-title">用户编辑</h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="row">
          <div class="col-sm-6">
            <form id="form">
              <div class="form-group">
                <label>用户名</label>
                <input type="text" id="username" value="${userInfo.username!}" class="form-control" placeholder="用户名">
              </div>
              <div class="form-group">
                <label>旧密码</label>
                <input type="password" id="oldPassword" class="form-control" placeholder="密码">
              </div>
              <div class="form-group">
                <label>密码</label>
                <input type="password" id="password" class="form-control" placeholder="密码">
              </div>
              <div class="form-group">
                <label>角色</label>
                <#list sysRoleList as role>
                  <input type="checkbox" name="roleId" value="${role.id}" id="role_${role.id}" <#list userRolesIds as roleId><#if role.id == roleId>checked</#if></#list>>&nbsp;
                  <label for="role_${role.id}" title="${role.description!}">${role.role!}</label>&nbsp;&nbsp;&nbsp;&nbsp;
                </#list>
              </div>
              <button type="submit" class="btn btn-sm btn-primary">保存</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
<script>

    function getTheCheckBoxValue() {
        var test = $("input[name='roleId']:checked");
        var checkBoxValue = "";
        test.each(function () {
            checkBoxValue += $(this).val() + ",";
        })
        checkBoxValue = checkBoxValue.substring(0, checkBoxValue.length - 1);
        return checkBoxValue;
    }

  $(function() {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
    $("#form").submit(function() {
      var username = $("#username").val();
      var oldPassword = $("#oldPassword").val();
      var password = $("#password").val();
      var roleId = getTheCheckBoxValue();
      if(!username) {
        toast('用户名不能为空');
        return false;
      }
      $.ajax({
        url: '/admin/admin_user/edit',
        async: true,
        cache: false,
        type: 'post',
        dataType: 'json',
        data: {
          id: '${userInfo.id}',
          username: username,
          oldPassword: oldPassword,
          password: password,
          roleId: roleId
        },
        success: function(data) {
          if(data.successful) {
            toast('编辑成功');
            setTimeout(function() {
              window.location.href = '/admin/admin_user/list';
            }, 1000);
          } else {
            toast(data.describe);
          }
        }
      })
      return false;
    })
  })
</script>
</@html>