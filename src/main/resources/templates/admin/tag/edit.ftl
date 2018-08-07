<#include "../layout/layout.ftl">
<@html page_title="标签编辑" page_tab="tag">
  <section class="content-header">
    <h1>

      <small>列表</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="/admin/index"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li><a href="/admin/tag/list">标签</a></li>
      <li class="active">编辑</li>
    </ol>
  </section>
  <section class="content">
    <div class="box box-info">
      <div class="box-header with-border">
        <h3 class="box-title">标签编辑</h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <form id="form" action="/admin/tag/edit" method="post" enctype="multipart/form-data">
          <input type="hidden" value="${tag.id!}" name="id">
          <div class="form-group">
            <label>名称</label>
            <input type="text" name="tag" readonly value="${tag.tag!}" class="form-control">
          </div>
          <div class="form-group">
            <label for="">描述</label>
            <textarea name="describ" rows="7" class="form-control">${tag.describ!}</textarea>
          </div>
          <button type="submit" id="btn" class="btn btn-sm btn-primary">提交</button>
        </form>
      </div>
    </div>
  </section>
</@html>