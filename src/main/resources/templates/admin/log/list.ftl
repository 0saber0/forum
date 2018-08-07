<#include "../layout/layout.ftl">
<@html page_title="日志列表" page_tab="log">
  <section class="content-header">
    <h1>
      日志
      <small>列表</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li><a href="/admin/log/list">日志</a></li>
      <li class="active">列表</li>
    </ol>
  </section>
  <section class="content">
    <div class="box box-info">
      <div class="box-header with-border">
        <h3 class="box-title">日志列表</h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <table class="table table-bordered">
          <thead>
          <tr>
            <th>#</th>
            <th>详情</th>
            <th>用户</th>
            <th>时间</th>
          </tr>
          </thead>
          <tbody>
          <#list page.content as map>
            <tr>
              <td>${map.log.id}</td>
              <td>${map.log.eventDescription!}</td>
              <td>${map.user.username!}</td>
              <td>${map.log.inTime!}</td>
            </tr>
          </#list>
          </tbody>
        </table>
      </div>
      <#if page.totalPages &gt; 1>
        <div class="box-footer clearfix">
          <#include "../layout/paginate.ftl">
          <@paginate currentPage=(page.getNumber() + 1) totalPage=page.getTotalPages() actionUrl="/admin/log/list" urlParas=""/>
        </div>
      </#if>
    </div>
  </section>
</@html>