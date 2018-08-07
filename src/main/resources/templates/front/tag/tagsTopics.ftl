<#include "../layout/layout.ftl">
<@html page_title="${tagsWithNum.tag!}" page_tab="">
<!--内容开始-->
<div class="container" style="border-radius: 15px;margin-top: 10px">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-body">
                <h4 style="margin-top: 0; margin-bottom: 10px;">
                    <#--<img src="http://p7o6459pu.bkt.clouddn.com/Fpu8NspRHZiUgk4InLBgvvyxwCiH" alt="" width="32">-->
                    <span class="label label-success">${tagsWithNum.tag!}</span>
                    <small>共有${tagsWithNum.num}篇话题</small>
                </h4>
                <small>${tagsWithNum.describ!}</small>
                <span></span>
            </div>
            <div class="divide"></div>
            <div class="panel-body paginate-bot">

                <#list topicList as list>
                <div class="media">
                    <div class="media-left">
                        <a href="/homepage/#{list.userId}"><img src="/photo/user/${list.image!}" class="avatar" alt=""></a>
                    </div>
                    <div class="media-body">
                        <div class="title">
                            <a href="/topic/${list.id!}">
                                ${list.title!}
                            </a>
                        </div>
                        <p class="gray">
                            <span><a href="/homepage/${list.userId}">${list.username}</a></span>
                            <span class="hidden-sm hidden-xs">•</span>
                            <span class="hidden-sm hidden-xs"><a href="/topic/${list.id!}">${list.replyCount}个评论</a></span>
                            <span class="hidden-sm hidden-xs">•</span>
                            <span class="hidden-sm hidden-xs">${list.view}次浏览</span>
                            <span>•</span>
                            <span>2个月前</span>
                            <span>•</span>
                            <#list list.tags?split(",") as tag>
                            <a href="/tags/${tag!}"><span class="label label-success">${tag!}</span></a>
                            </#list>
                        </p>
                    </div>
                </div>
                <div class="divide mar-top-5"></div>
                </#list>


                <ul class="pagination pagination-sm">

                        <#if basePageResult.totalCount == 0>
                            没有查询到符合条件的数据喔
                        <#else >
                            <#assign startPage = basePageResult.pageNum - 2>
                            <#if (startPage < 1)><#assign startPage = 1></#if>

                            <#assign endPage = basePageResult.pageNum + 2>
                            <#if (endPage > basePageResult.totalPage)><#assign endPage = basePageResult.totalPage></#if>
                            <#if basePageResult.pageNum == 1>
                            <#else >
                                        <li>
                                            <a href="/tags/${tagsWithNum.tag}?pageNum=1" aria-label="Previous">
                                                <span aria-hidden="true"> << </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/tags/${tagsWithNum.tag}?pageNum=${basePageResult.prevPage}" aria-label="Previous">
                                                <span aria-hidden="true"> < </span>
                                            </a>
                                        </li>
                            </#if>
                            <#list startPage..endPage as n>
                                        <li <#if basePageResult.pageNum==n>class="active" </#if> ><a <#if basePageResult.pageNum==n><#else >href="/tags/${tagsWithNum.tag}?pageNum=${n}"</#if> >${n}</a></li>
                            </#list>
                            <#if basePageResult.pageNum == basePageResult.totalPage>
                            <#else >
                                        <li>
                                            <a href="/tags/${tagsWithNum.tag}?pageNum=${basePageResult.nextPage}" aria-label="Next">
                                                <span aria-hidden="true"> > </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/tags/${tagsWithNum.tag}?pageNum=${basePageResult.totalPage}" aria-label="Next">
                                                <span aria-hidden="true"> >> </span>
                                            </a>
                                        </li>
                            </#if>
                        </#if>

                </ul>


            </div>
        </div>
    </div>
</div>
<!--内容结束-->
</@html>