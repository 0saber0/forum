<#include "./layout/layout.ftl">
<@html page_title="首页" page_tab="index">
    <!--内容开始-->
<div class="container" style="border-radius: 15px;margin-top: 10px">
    <div class="content">
        <div class="left-content">
            <div class="left-content-list">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <ul class="nav nav-pills index-nav">
                            <li <#if query4object??><#if query4object.default1 == true>class="active"</#if></#if> ><a href="/index<#if (query4object.keyWord)??>?keyWord=${(query4object.keyWord)!}</#if>">默认</a></li>
                            <li <#if query4object??><#if query4object.good??>class="active"</#if></#if> ><a href="/index?good=true<#if (query4object.keyWord)??>&keyWord=${(query4object.keyWord)!}</#if>">精华</a></li>
                            <li <#if query4object??><#if query4object.newest??>class="active"</#if></#if> ><a href="/index?newest=true<#if (query4object.keyWord)??>&keyWord=${(query4object.keyWord)!}</#if>">最新</a>
                            </li>
                            <li <#if query4object??><#if query4object.zeroComment??>class="active"</#if></#if> ><a href="/index?zeroComment=true<#if (query4object.keyWord)??>&keyWord=${(query4object.keyWord)!}</#if>">等待评论</a>
                            </li>
                        </ul>
                    </div>

                    <div class="panel-body paginate-bot">
                        <#list indexList as list>
                        <div class="media">
                            <div class="media-left">
                                <a href="/homepage/${list.user.id}"><img
                                        src="/photo/user/${list.user.image!"1.jpg"}"
                                        class="avatar" alt=""></a>
                            </div>
                            <div class="media-body">
                                <div class="title">
                                    <a href="/topic/${list.topic.id}">
                                        ${list.topic.title!}
                                    </a>
                                </div>
                                <p class="gray">
                                    <#if list.topic.good == 1>
                                        <a href="/index?good=true"><span class="label label-success">精</span></a>
                                    </#if>
                                    <span><a href="/homepage/${list.user.id}">${list.user.username!}</a></span>
                                    <span class="hidden-sm hidden-xs">•</span>
                                    <span class="hidden-sm hidden-xs"><a href="/topic/${list.topic.id}">${list.replyCount!}个评论</a></span>
                                    <span class="hidden-sm hidden-xs">•</span>
                                    <span class="hidden-sm hidden-xs">${list.topic.view!}次浏览</span>
                                    <span>•</span>
                                    <span>${list.topic.inTime?string("MM月dd日")}</span>
                                    <span>•</span>
                                    <#list list.topic.tags?split(",") as tag>
                                    <a href="/building"><span class="label label-success">${tag}</span></a>
                                    </#list>
                                </p>
                            </div>
                        </div>

                        <div class="divide mar-top-5"></div>

                        </#list>

                        <ul class="pagination">
                            <#if basePageResult.totalCount == 0>
                                没有查询到符合条件的数据喔
                                <#else >
                                    <#if basePageResult.pageNum == 1>
                                    <#else >
                                        <li>
                                            <a href="/index?pageNum=1<#if query4object.good??>&good=true</#if><#if query4object.newest??>&newest=true</#if><#if query4object.zeroComment??>&zeroComment=true</#if><#if query4object.keyWord??>&keyWord=${query4object.keyWord}</#if>"
                                               aria-label="Previous">
                                                <span aria-hidden="true"> << </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/index?pageNum=${basePageResult.prevPage}<#if query4object.good??>&good=true</#if><#if query4object.newest??>&newest=true</#if><#if query4object.zeroComment??>&zeroComment=true</#if><#if query4object.keyWord??>&keyWord=${query4object.keyWord}</#if>" aria-label="Previous">
                                                <span aria-hidden="true"> < </span>
                                            </a>
                                        </li>
                                    </#if>
                                    <#list 1..basePageResult.totalPage as n>
                                        <li <#if basePageResult.pageNum==n>class="active" </#if> ><a href="/index?pageNum=${n}<#if query4object.good??>&good=true</#if><#if query4object.newest??>&newest=true</#if><#if query4object.zeroComment??>&zeroComment=true</#if><#if query4object.keyWord??>&keyWord=${query4object.keyWord}</#if>">${n}</a></li>
                                    </#list>
                                    <#if basePageResult.pageNum == basePageResult.totalPage>
                                    <#else >
                                        <li>
                                            <a href="/index?pageNum=${basePageResult.nextPage}<#if query4object.good??>&good=true</#if><#if query4object.newest??>&newest=true</#if><#if query4object.zeroComment??>&zeroComment=true</#if><#if query4object.keyWord??>&keyWord=${query4object.keyWord}</#if>" aria-label="Next">
                                                <span aria-hidden="true"> > </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/index?pageNum=${basePageResult.totalPage}<#if query4object.good??>&good=true</#if><#if query4object.newest??>&newest=true</#if><#if query4object.zeroComment??>&zeroComment=true</#if><#if query4object.keyWord??>&keyWord=${query4object.keyWord}</#if>" aria-label="Next">
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
        <div class="right-content">
            <#if user0??>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="media">
                            <div class="media-left">
                                <a href="/homepage/${user0.id!}">
                                    <img src="/photo/user/${user0.image!"1.jpg"}" title=""
                                         class="avatar" style="width: 48px;height: 48px">
                                </a>
                            </div>
                            <div class="media-body">
                                <div class="media-heading">
                                    <a href="/homepage/${user0.id!}">${user0.username!}</a>
                                    <div style="color: #7A7A7A; font-size: 12px; margin-top:5px;">
                                        <i>
                                            ${user0.intro!"这家伙很懒，什么都没有留下"}
                                        </i>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 15px;">
                                <a href="/topic/create" style="text-decoration: underline"><span
                                        class="glyphicon glyphicon-pencil"></span><i>发布话题</i></a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer" style="background-color: white">
                        <div class="row">
                            <span class="col-md-6"><a href="/building"><span
                                    id="n_count">0</span> 条未读消息</a></span>
                            <span class="col-md-6 text-right">声望：<a href="/building">0</a></span>
                        </div>
                    </div>
                </div>
            <#else>
            <div class="panel panel-default">
                <div class="panel-body">
                    <h5>属于Java语言的bbs</h5>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在这里，您可以提问，回答，分享，诉说，这是个属于Java程序员的社区，欢迎您的加入！</p>
                </div>
            </div>
            </#if>

            <!--声望榜-->
            <div class="panel panel-default panel-prestige">
                <div class="panel-heading">声望榜 <a href="#">TOP 100 &gt;&gt;</a></div>
                <table class="table">
                    <tbody>
                    <tr>
                        <td><a href="#">tomoya92</a></td>
                        <td align="right">15</td>
                    </tr>
                    <tr>
                        <td><a href="#">Fiekers</a></td>
                        <td align="right">0</td>
                    </tr>
                    <tr>
                        <td><a href="#">alex</a></td>
                        <td align="right">0</td>
                    </tr>
                    <tr>
                        <td><a href="#">ddffas</a></td>
                        <td align="right">0</td>
                    </tr>
                    <tr>
                        <td><a href="#">tianxia007</a></td>
                        <td align="right">0</td>
                    </tr>
                    <tr>
                        <td><a href="#">18218368055</a></td>
                        <td align="right">0</td>
                    </tr>
                    <tr>
                        <td><a href="#">wadjsnkk</a></td>
                        <td align="right">0</td>
                    </tr>
                    <tr>
                        <td><a href="#">langhsu</a></td>
                        <td align="right">0</td>
                    </tr>
                    <tr>
                        <td><a href="#">ivoyan</a></td>
                        <td align="right">0</td>
                    </tr>
                    <tr>
                        <td><a href="#">12138wzm</a></td>
                        <td align="right">0</td>
                    </tr>
                    </tbody>
                </table>
            </div>


        </div>
    </div>
</div>
<script>

</script>
<!--内容结束-->
</@html>