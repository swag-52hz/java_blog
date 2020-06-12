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
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<form class="layui-form" action="/role/update" method="post">
    <input type="hidden" name="id" value="${role.id}"/>
    <div class="layui-form-item">
        <label class="layui-form-label">角色名</label>
        <div class="layui-input-inline">
            <input type="text" name="roleName" value="${role.roleName}" required  lay-verify="required" placeholder="请输入角色名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="radio" name="status" value="1" title="正常" <c:if test="${role.status=='1'}">checked</c:if>>
            <input type="radio" name="status" value="0" title="注销" <c:if test="${role.status=='0'}">checked</c:if>>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">操作人</label>
        <div class="layui-input-inline">
            <%--lay-verify: 验证所填必须为数字--%>
            <input type="text" name="operator" lay-verify="number" value="${role.operator}" required  lay-verify="required" placeholder="请输入角色名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-inline">
            <textarea name="explain" placeholder="请输入内容" class="layui-textarea">${role.explain}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
        </div>
    </div>
</form>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
    });
</script>
</body>
</html>
