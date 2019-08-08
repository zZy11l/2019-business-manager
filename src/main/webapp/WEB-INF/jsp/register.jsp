<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/3
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="register">
    用户名：<input type="text" name="username">（必填）<br>
    密码：<input type="password" name="password">（必填）<br>
    手机号：<input type="text" name="phone"><br>
    密保问题：<input type="text" name="question"><br>
    答案：<input type="text" name="answer"><br>
    邮箱<input type="text" name="email"><br>
    权限<input type="text" name="role"><br>
    ip<input type="text" name="ip"><br>
    <input type="submit" value="注册">

</form>
<button  onclick="toLogin()">去登录</button>
<script>
    function toLogin() {
        window.location.href="http://localhost:8080/user/login";

    }
    
</script>

</body>
</html>
