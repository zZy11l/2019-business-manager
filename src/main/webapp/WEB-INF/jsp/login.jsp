<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/2
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="" method="post">
    用户名：<input type="text" name="username" /><br>
    密码：<input type="password" name="password"/><br>
    <input type="submit" value="submit"/>


</form>

<button  onclick="toRegister()">去注册</button>
<script>
    function toRegister() {
       location.href="http://localhost:8080/register";
    }

</script>
</body>
</html>
