
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>



<button onclick="toLogin()">登录</button>
<%--<button onclick="toRegister()">注册</button>--%>


<script language="JavaScript" type="text/javascript">
    function toLogin() {
        window.location="http://localhost:8080/user/login";
    }
    function toRegister() {
        window.location="http://localhost:8080/register";
    }
</script>
</body>
</html>
