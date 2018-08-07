<#include "../layout/layout.ftl">
<@html page_title="${topics_user.username}创建的话题">
    <!--内容开始-->
<div class="container" style="border-radius: 15px;margin-top: 10px">
    <div class="content">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">${topics_user.username}创建的话题</div>
                <div class="panel-body paginate-bot">

                    <#list user_topics_list as topic_list>
                    <div class="media">
                        <div class="media-body">
                            <div class="title">
                                <a href="/topic/${topic_list.id}">
                                    ${topic_list.title}
                                </a>
                            </div>
                            <p>
                                <span><a href="/homepage/${topics_user.id}">${topics_user.username}</a></span>
                                <span class="hidden-sm hidden-xs">•</span>
                                <span class="hidden-sm hidden-xs"><a href="/topic/${topic_list.id!}">${topic_list.replyCount!}个评论</a></span>
                                <span class="hidden-sm hidden-xs">•</span>
                                <span class="hidden-sm hidden-xs">${topic_list.view!}次浏览</span>
                                <span>•</span>
                                <span>${topic_list.inTime?string("yyyy/MM/dd")}</span>
                            </p>
                        </div>
                    </div>
                    <div class="divide mar-top-5"></div>
                    </#list>

                    <ul class="pagination pagination-sm ">

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
                                            <a href="/user/${topics_user.username}/topics?pageNum=1" aria-label="Previous">
                                                <span aria-hidden="true"> << </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/user/${topics_user.username}/topics?pageNum=${basePageResult.prevPage}" aria-label="Previous">
                                                <span aria-hidden="true"> < </span>
                                            </a>
                                        </li>
                                </#if>
                                <#list startPage..endPage as n>
                                        <li <#if basePageResult.pageNum==n>class="active" </#if> ><a <#if basePageResult.pageNum==n><#else >href="/user/${topics_user.username}/topics?pageNum=${n}"</#if> >${n}</a></li>
                                </#list>
                                <#if basePageResult.pageNum == basePageResult.totalPage>
                                <#else >
                                        <li>
                                            <a href="/user/${topics_user.username}/topics?pageNum=${basePageResult.nextPage}" aria-label="Next">
                                                <span aria-hidden="true"> > </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/user/${topics_user.username}/topics?pageNum=${basePageResult.totalPage}" aria-label="Next">
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
</div>
<!--内容结束-->
</@html>