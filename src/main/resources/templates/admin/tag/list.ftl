<#include "../layout/layout.ftl">
<@html page_title="标签列表" page_tab="tag">
  <section class="content-header">
    <h1>
      标签
      <small>列表</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li><a href="/admin/tag/list">标签</a></li>
      <li class="active">列表</li>
    </ol>
  </section>
  <section class="content">
    <div class="box box-info">
      <div class="box-header with-border">
        <h3 class="box-title">标签列表</h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <table class="table table-bordered">
          <thead>
          <tr>
            <th>#</th>
            <th>名称</th>
            <th>话题数</th>
            <th>操作</th>
          </tr>
          </thead>
          <tbody>
          <#list tagsWithNums as tag>
            <tr>
              <td>${tag.id}</td>
              <td>${tag.tag!}</td>
              <td>${tag.num!0}</td>
              <td>
                <#if shi.allGranted('标签编辑许可')>
                  <a href="/admin/tag/editPage?id=${tag.id}" class="btn btn-sm btn-warning">编辑</a>
                </#if>
                <#if shi.allGranted('标签删除许可')>
                  <button onclick="deleteBtn('${tag.id}')" class="btn btn-sm btn-danger">删除</button>
                </#if>
              </td>
            </tr>
            <#if tag.describ??>
              <tr><td colspan="4">${tag.describ!}</td></tr>
            </#if>
          </#list>
          </tbody>
        </table>
      </div>
      <#if basePageResult.totalCount &gt; 1>
        <div class="box-footer clearfix">
          <#include "../layout/paginate.ftl">
          <@paginate currentPage=(basePageResult.getPageNum()) totalPage=basePageResult.getTotalPage() actionUrl="/admin/tag/list" urlParas=""/>
        </div>
      </#if>
    </div>
  </section>
<script>
  function deleteBtn(id) {
    if (confirm('确定要删除这个标签吗？')) {
      $.ajax({
        url: '/admin/tag/delete',
        type: 'get',
        async: false,
        cache: false,
        dataType: 'json',
        data: {
          id: id
        },
        success: function(data) {
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