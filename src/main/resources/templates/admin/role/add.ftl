<#include "../layout/layout.ftl">
<@html page_title="角色添加" page_tab="admin_user_role">
  <section class="content-header">
    <h1>
      角色
      <small>添加</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li><a href="/admin/role/list">角色</a></li>
      <li class="active">添加</li>
    </ol>
  </section>
  <section class="content">
    <div class="box box-info">
      <div class="box-header with-border">
        <h3 class="box-title">角色添加</h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <div class="row">
          <div class="col-sm-3">
              <div id="tree">
                  <div style="text-align: center">
                      <p style="font-weight: 700;font-size: 16px">权限分配</p>
                  </div>


                <#list sysPermissionIdNameList as per>
                <div style="float: left;width: 115px">
                    <input type="checkbox" name="perId" value="${per.id}" id="per_${per.id}">&nbsp;
                    <label for="per_${per.id}">${per.name!}</label>
                </div>
                </#list>


              </div>
          </div>
          <div class="col-sm-9">
            <form id="form">
              <div class="form-group">
                <label>角色名</label>
                <input type="text" id="role" class="form-control" placeholder="角色名">
              </div>
              <div class="form-group">
                <label>角色描述</label>
                <textarea name="description" id="description" rows="5" class="form-control" placeholder="最好不超过50个字"></textarea>
              </div>
              <button type="submit" class="btn btn-sm btn-primary">保存</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
<script>

    /*获取checkbox的值*/
    function getTheCheckBoxValue() {
        var test = $("input[name='perId']:checked");
        var checkBoxValue = "";
        test.each(function () {
            checkBoxValue += $(this).val() + ",";
        })
        checkBoxValue = checkBoxValue.substring(0, checkBoxValue.length - 1);
        return checkBoxValue;
    }

    $("#form").submit(function() {
        var role = $("#role").val();
        var description = $("#description").val();
        var permIds = getTheCheckBoxValue();
        if (!role) {
            toast('角色名不能为空');
            return false;
        }
        $.ajax({
            url: '/admin/role/add',
            async: true,
            cache: false,
            type: 'post',
            dataType: 'json',
            data: {
                role: role,
                description: description,
                permIds: permIds
            },
            success: function(data) {
                if (data.successful) {
                    toast('保存成功');
                    setTimeout(function() {
                        window.location.href = "/admin/role/list";
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