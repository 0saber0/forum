<#include "../layout/layout.ftl">
<@html page_title="话题列表" page_tab="topic">
  <section class="content-header">
    <h1>
      话题
      <small>列表</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li><a href="/admin/topic/list">话题</a></li>
      <li class="active">列表</li>
    </ol>
  </section>
  <section class="content">
    <div class="box box-info">
      <div class="box-header with-border">
        <h3 class="box-title">话题列表</h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <table class="table table-bordered">
          <thead>
          <tr>
            <th>#</th>
            <th>标题</th>
            <th>用户</th>
            <th>状态</th>
            <th>时间</th>
            <th>操作</th>
          </tr>
          </thead>
          <tbody>
          <#list topicList as topic>
            <tr>
              <td>${topic.id}</td>
              <td><a href="/topic/${topic.id}" target="_blank">${topic.title!}</a></td>
              <td>${topic.username!}</td>
              <td>
                <#if topic.top==1>
                  置顶
                <#elseif topic.good==1>
                  精华
                <#else>
                  &nbsp;
                </#if>
              </td>
              <td>${topic.inTime?string("yyyy/MM/dd")}</td>
              <td>
                <#if shi.allGranted('话题置顶许可')>
                  <button onclick="actionBtn('${topic.id}', 'top')" class="btn btn-sm btn-warning">置顶</button>
                </#if>
                <#if shi.allGranted('话题升精许可')>
                  <button onclick="actionBtn('${topic.id}', 'good')" class="btn btn-sm btn-warning">加精</button>
                </#if>
                <#if shi.allGranted('话题编辑许可')>
                  <a href="/admin/topic/editPage?id=${topic.id}" class="btn btn-sm btn-warning">编辑</a>
                </#if>
                <#if shi.allGranted('话题删除许可')>
                  <button onclick="actionBtn('${topic.id}', 'delete')" class="btn btn-sm btn-danger">删除</button>
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
          <@paginate currentPage=(basePageResult.getPageNum()) totalPage=basePageResult.getTotalPage() actionUrl="/admin/topic/list" urlParas=""/>
        </div>
      </#if>
    </div>
  </section>
<script>
  function actionBtn(id, action) {
    var msg, url;
    if(action === 'top') {
      url = '/admin/topic/top';
      msg = '确定要置顶这条话题吗？';
    } else if(action === 'good') {
      url = '/admin/topic/good';
      msg = '确定要加精这条话题吗？';
    } else if(action === 'delete') {
      url = '/admin/topic/delete';
      msg = '确定要删除这条话题吗？';
    }
    if (confirm(msg)) {
      $.ajax({
        url: url,
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
            toast(data.description);
          }
        }
      })
    }
  }
</script>
</@html>