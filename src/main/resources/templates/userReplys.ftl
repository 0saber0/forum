<#include "./layout/layout.ftl">
<@html page_title="${replys_user.username}评论的话题">
    <!--内容开始-->
<div class="container" style="border-radius: 15px;margin-top: 10px">
    <div class="content">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">${replys_user.username}评论的话题</div>
                <table class="table table-striped">
                    <tbody>

                    <#list user_replys_list as replys_list>
                    <tr>
                        <td>
                            ${replys_list.inTime?string("MM/dd")}
                            评论了
                            <a href="/homepage/${replys_list.userId!}">${replys_list.username}</a>
                            创建的话题 › <a href="/topic/${replys_list.topicId}">${replys_list.title}</a>
                        </td>
                    </tr>
                    <tr class="user_comments">
                        <td class="show_big_image">
                            ${replys_list.content}
                        </td>
                    </tr>
                    </#list>

                    </tbody>
                </table>
                <div class="panel-body" style="padding: 0 15px;">

                    <ul class="pagination pagination-sm">

                        <#if basePageResult.totalCount == 0>
                            没有查询到符合条件的数据喔
                        <#else >
                            <#if basePageResult.pageNum == 1>
                            <#else >
                                        <li>
                                            <a href="/user/${replys_user.username}/replys?pageNum=1" aria-label="Previous">
                                                <span aria-hidden="true"> << </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/user/${replys_user.username}/replys?pageNum=${basePageResult.prevPage}" aria-label="Previous">
                                                <span aria-hidden="true"> < </span>
                                            </a>
                                        </li>
                            </#if>
                            <#list 1..basePageResult.totalPage as n>
                                        <li <#if basePageResult.pageNum==n>class="active" </#if> ><a href="/user/${replys_user.username}/replys?pageNum=${n}">${n}</a></li>
                            </#list>
                            <#if basePageResult.pageNum == basePageResult.totalPage>
                            <#else >
                                        <li>
                                            <a href="/user/${replys_user.username}/replys?pageNum=${basePageResult.nextPage}" aria-label="Next">
                                                <span aria-hidden="true"> > </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/user/${topics_user.username}/replys?pageNum=${basePageResult.totalPage}" aria-label="Next">
                                                <span aria-hidden="true"> >> </span>
                                            </a>
                                        </li>
                            </#if>
                        </#if>

                    </ul>

                </div>


            </div>
            <button id="toggleBigImageBtn" data-toggle="modal" class="hidden" data-target="#showBigImageModal"></button>
            <div class="modal fade" tabindex="-1" role="dialog" id="showBigImageModal">
                <div class="modal-dialog" style="width: 98%" role="document">
                    <div class="modal-content">
                        <div class="modal-body text-center">
                            <img src="" id="bigImage" style="max-width: 100%;" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $(function () {
                    $(".show_big_image img").click(function () {
                        var src = $(this).attr("src");
                        $("#bigImage").attr("src", src);
                        $("#toggleBigImageBtn").click();
                    });
                })
            </script>
        </div>
    </div>
</div>
<!--内容结束-->
</@html>