<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/7
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table width="600" border="1" cellspacing="0">

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
    <c:forEach items="${user_list}" var="user">
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


    </c:forEach>

</table>
<a href="/user/home">返回主页</a>
</body>
</html>
