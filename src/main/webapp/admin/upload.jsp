<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/6/10
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>头像上传</title>
</head>
<body>
<h3>头像上传页面</h3>
<form action="/admin/upload" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${param.id}">
    选择头像：<input type="file" name="headpic"><input type="submit" value="上传">
</form>
</body>
</html>
