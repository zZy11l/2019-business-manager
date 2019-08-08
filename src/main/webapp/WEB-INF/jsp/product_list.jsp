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

<table  border="1" cellspacing="0">

    <thead>
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
    <th>操作</th>
    </thead>
    <c:forEach items="${product_list}" var="product">
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
                <c:forEach var="item" items="${product.subImages}">
                    <a href="/user/product/subImages/${item}">${item}  </a>
                </c:forEach>

            </td>
            <td>${product.status}</td>
            <td>${product.createTime}</td>
            <td>${product.updateTime}</td>
            <td><a href="update/${product.id}" >修改/</a>
                <a href="delete/${product.id}" >删除</a>
            </td>
        </tr>

    </c:forEach>

</table>
<button onclick="product_add()">添加新的商品</button>
<script>



    function product_add() {
        location.href="http://localhost:8080/user/product/add";
    }

</script>

</body>
</html>
