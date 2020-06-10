<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/6/9
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户新增页面</title>
</head>
<body>
<form action="/admin/add" method="post">
    账号：<input type="text" name="account"><br/>
    密码：<input type="password" name="password"><br/>
    姓名：<input type="text" name="name"><br/>
    手机号：<input type="text" name="phone"><br/>
    邮箱：<input type="text" name="email"><br/>
    状态：<input type="radio" name="status" checked value="1">正常
        <input type="radio" name="status" value="0">注销<br/>
    <input type="hidden" name="operator" value="${sessionScope.admin.id}"><br/>
    性别：<select name="sex">
    <option value="1">男</option>
    <option value="2">女</option>
        </select><br/>
    角色：<select name="roleid" id="">
        <c:forEach items="${roles}" var="role">
            <option value="${role.id}">${role.roleName}</option>
        </c:forEach>
    </select><br/>
    <input type="submit" value="添加">
</form>
</body>
</html>
