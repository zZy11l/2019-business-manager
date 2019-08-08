<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/2
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<p>首页</p>



<h1>欢迎，${current_user.username}登录</h1>

<h2>你想要干什么？</h2>
<a href="find">操作用户</a><br>
<a href="category/find">操作类别</a><br>
<a href="product/all">操作商品</a><br>




<button onclick="quit()">退出登录</button>

<script>
    function quit() {
        window.location.href="http://localhost:8080/user/login";
    }
</script>






</body>
</html>
