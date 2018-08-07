<#macro header page_tab="">
<header>
    <nav class="navbar navbar-default" style="border-radius: 0px;margin-bottom: 10px;">
        <div class="container">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/index" style="font-weight: bold;">密拉诺</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <form class="navbar-form navbar-left" method="post" action="/index">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="关键字" name="keyWord" value="<#if query4object??>${query4object.keyWord!}</#if>">
                        </div>
                        <button type="submit" class="btn btn-default btn-header" onclick="keyWordQuery()">查询</button>
                    </form>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden-xs <#if page_tab == "index">active</#if>">
                            <a href="/index">首页</a>
                        </li>
                        <li class="hidden-xs <#if page_tab == "tags">active</#if>">
                            <a href="/tags/tagspage">标签</a>
                        </li>
                        <#if user0??>
                          <li class="hidden-md hidden-lg">
                              <a href="#">发布话题</a>
                          </li>
                          <li <#if page_tab == 'user'> class="active" </#if>>
                              <a href="/homepage/${user0.id}">
                                  ${user0.username!}
                                  <span class="badge" id="badge"></span>
                              </a>
                          </li>
                          <li <#if page_tab == 'setting'> class="active" </#if>><a href="/user/setting">设置</a></li>
                          <li><a href="javascript:if(confirm('确定要登出${user0.username!}吗？'))location.href='/logout'">退出</a></li>
                        <#else>
                          <li <#if page_tab == "login">class="active"</#if>><a href="/login">登录</a></li>
                          <li <#if page_tab == "register">class="active"</#if>><a href="/register">注册</a></li>
                        </#if>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </div>
    </nav>
</header>
<script>
    var keyWordQuery = function () {
        $('.navbar-form').submit();
    }
</script>
</#macro>