<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/6
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改类别</title>
</head>
<body>
<h1>修改类别Id=${category_info.id}</h1>

<form action="" method="post">
    <input type="hidden" value=${category_info.id} name="id"/><br>
    类别名称：<input type="text" value=${category_info.name} name="name"/><br>
    类别状态 ： <input type="text" value=${category_info.status} name="status"/><br>
    所属父类：<select name="parentId">

    <option value="0">无</option>
    <c:forEach items="${category_list}" var="category">
        <c:if test="${category.id==category_info.parentId}">
            <option value="${category.id}" selected="selected"> ${category.name} </option>
        </c:if>
        <c:if test="${category.id!=category_info.parentId}">
            <option value="${category.id}" > ${category.name} </option>
        </c:if>



    </c:forEach>


</select><br>
    <input type="submit" value="提交"><br>
</form>

</body>
</html>
