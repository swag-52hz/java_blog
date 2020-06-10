<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/6/8
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>角色列表页</title>
</head>
<body>
    <h3>欢迎来到角色列表页</h3>
    <a href="/role/toAdd">添加角色</a>
    <table border="1px" width="600" style="text-align: center;border-collapse: collapse">
        <thead>
            <tr>
                <td>ID</td>
                <td>角色名</td>
                <td>描述</td>
                <td>状态</td>
                <td>操作人</td>
                <td>创建时间</td>
                <td>操作</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${roles}" var="role">
                <tr>
                    <td>${role.id}</td>
                    <td>${role.roleName}</td>
                    <td>${role.explain}</td>
                    <td>${role.status=="1"?"正常":"注销"}</td>
                    <td>${role.operator}</td>
                    <td><fmt:formatDate value="${role.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td><a href="/role/toUpdate?id=${role.id}">修改</a> <a href="/role/delete?id=${role.id}">删除</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
