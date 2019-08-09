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
                            <th>商品编号</th>
                            <th>商品名称</th>
                            <th>所属类别</th>
                            <th>子标题</th>
                            <th>商品详情</th>
                            <th>商品价格</th>
                            <th>商品库存</th>
                            <th>商品主图</th>
                            <th>商品子图</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>修改时间</th>

                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list product_list as product>
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td>${product.category.name}</td>
                            <td>${product.subtitle}</td>
                            <td>${product.detail}</td>
                            <td>${product.price}</td>
                            <td>${product.stock}</td>
                            <td><a href="/user/product/mainImage/${product.mainImage}">${product.mainImage}</a></td>
                            <td id="subImages">
                                <#list product.subImagesNames as item>
                                    <a href="/user/product/subImages/${item}">${item}  </a>
                                </#list>

                            </td>
                            <td>${product.status}</td>
                            <td>${product.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td>${product.updateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td><a href="/user/product/index/${product.id}">修改</a>
                                <a href="/user/product/delete/${product.id}">删除</a></td>

                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

            <#--分页-->
<#--                <div class="col-md-12 column">-->
<#--                    <ul class="pagination pull-right">-->
<#--                    <#if currentPage lte 1>-->
<#--                        <li class="disabled"><a href="#">上一页</a></li>-->
<#--                    <#else>-->
<#--                        <li><a href="/sell/seller/order/list?page=${currentPage - 1}&size=${size}">上一页</a></li>-->
<#--                    </#if>-->

<#--                    <#list 1..productInfoPage.getTotalPages() as index>-->
<#--                        <#if currentPage == index>-->
<#--                            <li class="disabled"><a href="#">${index}</a></li>-->
<#--                        <#else>-->
<#--                            <li><a href="/sell/seller/order/list?page=${index}&size=${size}">${index}</a></li>-->
<#--                        </#if>-->
<#--                    </#list>-->

<#--                    <#if currentPage gte productInfoPage.getTotalPages()>-->
<#--                        <li class="disabled"><a href="#">下一页</a></li>-->
<#--                    <#else>-->
<#--                        <li><a href="/sell/seller/order/list?page=${currentPage + 1}&size=${size}">下一页</a></li>-->
<#--                    </#if>-->
<#--                    </ul>-->
<#--                </div>-->
            </div>
        </div>
    </div>

</div>
</body>
</html>