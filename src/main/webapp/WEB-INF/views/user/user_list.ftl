<html>
<#include "common/header.ftl">

<body>
<div id="wrapper" class="toggled">

    <#--边栏sidebar-->
    <#include "common/nav.ftl">

    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>手机号</th>
                            <th>密保问题</th>
                            <th>答案</th>
                            <th>电子邮箱</th>
                            <th>权限</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th>IP</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list user_list as user>
                            <tr>
                                <td>${user.username}</td>
                                <td>${user.password}</td>
                                <td>${user.phone}</td>
                                <td>${user.question}</td>
                                <td>${user.answer}</td>
                                <td>${user.email}</td>
                                <td>${user.role}</td>
                                <td>${user.createTime}</td>
                                <td>${user.updateTime}</td>
                                <td>${user.ip}</td>
                                <td><a href="update/${user.id}" >修改/</a>
                                    <a href="delete/${user.id}" >删除</a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

                <#--分页-->
<#--                <div class="col-md-12 column">-->
<#--                    <ul class="pagination pull-right">-->
<#--                        <#if currentPage lte 1>-->
<#--                            <li class="disabled"><a href="#">上一页</a></li>-->
<#--                        <#else>-->
<#--                            <li><a href="/sell/seller/order/list?page=${currentPage - 1}&size=${size}">上一页</a></li>-->
<#--                        </#if>-->

<#--                        <#list 1..productInfoPage.getTotalPages() as index>-->
<#--                            <#if currentPage == index>-->
<#--                                <li class="disabled"><a href="#">${index}</a></li>-->
<#--                            <#else>-->
<#--                                <li><a href="/sell/seller/order/list?page=${index}&size=${size}">${index}</a></li>-->
<#--                            </#if>-->
<#--                        </#list>-->

<#--                        <#if currentPage gte productInfoPage.getTotalPages()>-->
<#--                            <li class="disabled"><a href="#">下一页</a></li>-->
<#--                        <#else>-->
<#--                            <li><a href="/sell/seller/order/list?page=${currentPage + 1}&size=${size}">下一页</a></li>-->
<#--                        </#if>-->
<#--                    </ul>-->
<#--                </div>-->
            </div>
        </div>
    </div>

</div>
</body>
</html>