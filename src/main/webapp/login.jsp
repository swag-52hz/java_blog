<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/6/9
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>
<h3>登陆页面</h3>
<form action="/admin/login" method="post">
    用户名：<input type="text" name="account"><br/>
    密码：<input type="password" name="password"><br/>
    <span style="color: red;font-weight: bolder;">${error}</span><br/>
    <input type="submit" value="登录">
</form>
</body>
</html>
