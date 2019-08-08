<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/6
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table width="600" border="1" cellspacing="0">

    <thead>
        <th>类别编号</th>
        <th>类别名称</th>
        <th>所属父类</th>
        <th>状态</th>
        <th>创建时间</th>
        <th>修改时间</th>
        <th>操作</th>
    </thead>
    <c:forEach items="${category_list}" var="category">
        <tr>
            <td>${category.id}</td>
            <td>${category.name}</td>
            <td>${category.parentCategory.name}</td>
            <td>${category.status}</td>
            <td>${category.createTime}</td>
            <td>${category.updateTime}</td>
            <td><a href="update/${category.id}" >修改/</a>
                <a href="delete/${category.id}" >删除</a>
            </td>
        </tr>

    </c:forEach>

</table>
<button onclick="category_add()">添加新的分类</button>
<script>
    function category_add() {
        location.href="http://localhost:8080/user/category/add";
    }

</script>
<a href="/user/home">返回主页</a>
</body>
</html>
