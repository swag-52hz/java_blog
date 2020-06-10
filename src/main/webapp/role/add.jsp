<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/6/8
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>添加页面</title>
</head>
<body>
<form action="/role/add" method="post">
    角色名：<input type="text" name="roleName"><br/>
    状态：<input type="radio" name="status" value="1">正常
         <input type="radio" name="status" value="0">注销<br/>
    <input type="hidden" name="operator" value="${sessionScope.admin.id}">
    描述：<textarea name="explain" id="" cols="30" rows="10"></textarea><br/>
    <input type="submit" value="添加">
</form>
</body>
</html>
