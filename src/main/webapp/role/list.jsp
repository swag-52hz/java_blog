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
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<ul class="layui-nav" style="margin-bottom: 10px;">
    <li class="layui-nav-item">
        <a href="">控制台<span class="layui-badge">9</span></a>
    </li>
    <li class="layui-nav-item">
        <a href="">个人中心<span class="layui-badge-dot"></span></a>
    </li>
    <li class="layui-nav-item">
        <a href=""><img src="${sessionScope.admin.headpic}" class="layui-nav-img">${sessionScope.admin.name}</a>
        <dl class="layui-nav-child">
            <dd><a href="/admin/list">用户管理</a></dd>
            <dd><a href="/role/list">角色管理</a></dd>
            <dd><a href="javascript:;">退出登录</a></dd>
        </dl>
    </li>
</ul>
<div style="width: 100px;margin:auto;"><a href="/role/toAdd" class="layui-btn">添加角色</a></div>
<table class="layui-table">
    <colgroup>
        <col width="150">
        <col width="200">
    </colgroup>
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
            <td>
                <a href="/role/toUpdate?id=${role.id}" class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                <a href="/role/delete?id=${role.id}" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['form','element'], function(){
        var form = layui.form;
        var element = layui.element;
        //各种基于事件的操作，下面会有进一步介绍
    });
</script>
</body>
</html>
