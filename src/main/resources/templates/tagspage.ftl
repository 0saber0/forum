<#include "layout/layout.ftl">
<@html page_title="标签" page_tab="tags">
<!--内容开始-->
<div class="container" style="border-radius: 15px;margin-top: 10px">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <#list tagsList as list>
                    <div class="col-md-3" style="margin-bottom: 10px; padding-left: 10px; width: 284px; height: 160px">
                    <#--<img src="http://p7o6459pu.bkt.clouddn.com/Fpu8NspRHZiUgk4InLBgvvyxwCiH" class="sponsor-tag-img" alt="minecraft" width="24">-->
                        <a href="/tags/${list.tag!}">
                            <span class="label label-success">${list.tag!}</span>
                        </a>
                        <span class="text-muted">x ${list.num!}</span>
                        <small class="excerpt text-muted"
                               style="display: block; margin-top: 10px;">${list.describ!}</small>
                    </div>
                </#list>

            </div>

            <div class="divide mar-top-5"></div>

            <ul class="pagination pagination-sm ">

                            <#if basePageResult.totalCount == 0>
                                没有查询到符合条件的数据喔
                            <#else >
                                <#if basePageResult.pageNum == 1>
                                <#else >
                                        <li>
                                            <a href="/tags/tagspage?pageNum=1"
                                               aria-label="Previous">
                                                <span aria-hidden="true"> << </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/tags/tagspage?pageNum=${basePageResult.prevPage}"
                                               aria-label="Previous">
                                                <span aria-hidden="true"> < </span>
                                            </a>
                                        </li>
                                </#if>
                                <#list 1..basePageResult.totalPage as n>
                                        <li <#if basePageResult.pageNum==n>class="active" </#if> ><a
                                                href="/tags/tagspage?pageNum=${n}">${n}</a></li>
                                </#list>
                                <#if basePageResult.pageNum == basePageResult.totalPage>
                                <#else >
                                        <li>
                                            <a href="/tags/tagspage?pageNum=${basePageResult.nextPage}"
                                               aria-label="Next">
                                                <span aria-hidden="true"> > </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/tags/tagspage?pageNum=${basePageResult.totalPage}"
                                               aria-label="Next">
                                                <span aria-hidden="true"> >> </span>
                                            </a>
                                        </li>
                                </#if>
                            </#if>

            </ul>

        </div>
    </div>
</div>
<!--内容结束-->
<script type="text/javascript">

</script>
</@html>