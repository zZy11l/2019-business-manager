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
                    <form role="form" method="post" action="">
                        <div class="form-group">
                            <label>类别名称</label>
                            <input name="name" type="text" class="form-control" value="${(category_info.name)!''}"/>
                        </div>

                        <div class="form-group">
                            <label>所属父类</label>
                            <select name="parentId" class="form-control">

                                    <option value="0">无</option>

                                <#list category_list as category>
                                    <#if category.id==category_info.parentId>
                                        <option value="${category.id}" selected="selected"> ${category.name} </option>
                                    </#if>
                                    <#if category.id!=category_info.parentId>
                                        <option value="${category.id}" > ${category.name} </option>
                                    </#if>
                                </#list>
                            </select><br>
                        </div>
                        <div class="form-group">
                            <label>状态</label>
                            <input name="status" type="text" class="form-control" value="${(category_info.status)!''}"/>
                        </div>


                        <input hidden type="text" name="id" value="${(category_info.id)!''}">
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>