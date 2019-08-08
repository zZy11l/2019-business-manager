<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/7
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加分类</title>
</head>
<body>

<form action="" method="post">
    <input type="hidden"  name="id"/><br>
    类别名称：<input type="text"  name="name"/><br>
    类别状态 ： <input type="text"  name="status"/><br>
    所属父类：<select name="parentId">
    <option value="0">无</option>
    <c:forEach items="${category_list}" var="category">

            <option value="${category.id}" > ${category.name} </option>




    </c:forEach>


</select><br>
    <input type="submit" value="提交"><br>
</form>
</body>
</html>
