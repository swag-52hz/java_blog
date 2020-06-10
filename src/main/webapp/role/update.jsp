<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/6/8
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>修改页面</title>
</head>
<body>
<form action="/role/update" method="post">
    <input type="hidden" name="id" value="${role.id}"/>
    角色名：<input type="text" name="roleName" value="${role.roleName}"><br/>
    状态：<input type="radio" name="status" value="1" <c:if test="${role.status=='1'}">checked</c:if>>正常
    <input type="radio" name="status" value="0" <c:if test="${role.status=='0'}">checked</c:if>>注销<br/>
    操作人：<input type="text" name="operator" value="${role.operator}"/><br/>
    描述：<input type="text" name="explain" value="${role.explain}"/><br/>
    <input type="submit" value="修改">
</form>

</body>
</html>
