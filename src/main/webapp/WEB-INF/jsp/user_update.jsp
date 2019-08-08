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
<form method="post" action="register">
    <input type="hidden" value="${user_info.id}" name="id">
    用户名：<input type="text" value="${user_info.username}" name="username">（必填）<br>
    密码：<input type="password" value="${user_info.password}" name="password">（必填）<br>
    手机号：<input type="text" value="${user_info.phone}" name="phone"><br>
    密保问题：<input type="text" value="${user_info.question}" name="question"><br>
    答案：<input type="text" value="${user_info.answer}" name="answer"><br>
    邮箱<input type="text" value="${user_info.email}" name="email"><br>
    权限<input type="text" value="${user_info.role}" name="role"><br>
    ip<input type="text" value="${user_info.ip}" name="ip"><br>
    <input type="submit" value="提交">

</form>
</body>
</html>
