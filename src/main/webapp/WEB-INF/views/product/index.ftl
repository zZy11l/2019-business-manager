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
                    <form role="form" method="post" action="" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>商品名称</label>
                            <input name="name" type="text" class="form-control" value="${(product_info.name)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>所属类别</label>
                            <select name="categoryId" class="form-control">
                                <#list category_list as category>
                                    <#if category.id==product_info.categoryId>
                                        <option value="${category.id}" selected="selected"> ${category.name} </option>
                                    </#if>
                                    <#if category.id!=product_info.categoryId>
                                        <option value="${category.id}" > ${category.name} </option>
                                    </#if>
                               </#list>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>子标题</label>
                            <input name="subtitle" type="text" class="form-control" value="${(product_info.subtitle)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>商品详情</label>
                            <input name="detail" type="text" class="form-control" value="${(product_info.detail)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>商品价格</label>
                            <input name="price" type="text" class="form-control" value="${(product_info.price)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>商品库存</label>
                            <input name="stock" type="text" class="form-control" value="${(product_info.stock)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>商品状态</label>
                            <input name="status" type="text" class="form-control" value="${(product_info.status)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>商品主图</label>

                            <div class="file-loading">
                                <input id="input-id-main" type="file" name="mainImage_file">
                                <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过1M</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>商品子图</label>

                            <div class="file-loading">
                                <input id="input-id-sub" type="file" name="subImages_files" multiple="multiple">
                                <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过1M</p>
                            </div>
                        </div>

                        <input hidden type="text" name="id" value="${(product_info.id)!''}">
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/fileinput.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/locales/zh.min.js"></script>
<script>

    $(function () {
        var initialPreview = [];


        $("#input-id-main").fileinput({
            uploadUrl: '/user/product/index/${product_info.id}',
            language: 'zh',
            browseClass: "btn btn-primary btn-block",
            showCaption: false,
            showRemove: false,
            showUpload: false,
            allowedFileExtensions: [ 'jpg', 'jpeg', 'png', 'gif' ],
            maxFileSize: 1024,
            autoReplace: true,
            overwriteInitial: true,
            maxFileCount: 1,
            initialPreview: initialPreview,
        });
        $("#input-id-sub").fileinput({
            uploadUrl: '/user/product/index/${product_info.id}',
            language: 'zh',
            browseClass: "btn btn-primary btn-block",
            showCaption: false,
            showRemove: false,
            showUpload: false,
            allowedFileExtensions: [ 'jpg', 'jpeg', 'png', 'gif' ],
            maxFileSize: 1024,
            autoReplace: true,
            overwriteInitial: true,

            initialPreview: initialPreview,
        });
    });

</script>
</body>
</html>