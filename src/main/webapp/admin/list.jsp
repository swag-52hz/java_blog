<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/6/9
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户列表页</title>
</head>
<body>
    <h3>欢迎来到用户列表页</h3>
    <form action="" style="margin: auto;">
        <input type="hidden" name="pageNum" value="1">
        账号：<input type="text" name="account" value="${param.account}">
        状态：<select name="status" id="">
                <option value="">请选择</option>
                <option value="0" <c:if test="${param.status=='0'}">selected</c:if>>注销</option>
                <option value="1" <c:if test="${param.status=='1'}">selected</c:if>>正常</option>
             </select>
        姓名: <input type="text" name="name" value="${param.name}">
        显示条数：<select name="pageSize">
        <option value="1" <c:if test="${param.pageSize=='1'}">selected</c:if>>1条/页</option>
        <option value="2" <c:if test="${param.pageSize=='2'}">selected</c:if>>2条/页</option>
        <option value="5" <c:if test="${param.pageSize=='5'}">selected</c:if>>5条/页</option>
                 </select>
        <input type="submit" value="查询">
    </form>
    <div><a href="/admin/toAdd">新增用户</a></div>
    <table border="1px" width="1000" style="border-collapse: collapse">
        <thead>
            <tr>
                <td>ID</td>
                <td>账号</td>
                <td>密码</td>
                <td>用户名</td>
                <td>手机号</td>
                <td>邮箱</td>
                <td>状态</td>
                <td>性别</td>
                <td>角色</td>
                <td>操作人</td>
                <td>操作</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${pageInfo.list}" var="admin">
                <tr>
                    <td>${admin.id}</td>
                    <td>${admin.account}</td>
                    <td>${admin.password}</td>
                    <td>${admin.name}</td>
                    <td>${admin.phone}</td>
                    <td>${admin.email}</td>
                    <td>${admin.status==0?"注销":"正常"}</td>
                    <td>${admin.sex=="1"?"男":"女"}</td>
                    <td>${admin.role.roleName}</td>
                    <td>${admin.runner.account}</td>
                    <td><a href="#">修改</a> <a href="javascript:deleteAdmin(${admin.id})">删除</a> <a href="#">修改头像</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div>
        <a href="javascript:goPage(${pageInfo.pageNum-1})">上一页</a>
        <a href="javascript:goPage(${pageInfo.pageNum+1})">下一页</a>
        当前页：${pageInfo.pageNum},总记录数：${pageInfo.total},总页数：${pageInfo.pages}
    </div>
    <script src="../static/js/jquery-3.2.1.min.js"></script>
    <script>
        // 跳转对应页面
        function goPage(num){
            $("input[name='pageNum']").val(num);
            $("form").submit();
        }

        // 删除用户
        function deleteAdmin(id) {
            if(confirm("确认删除吗")){
                // 异步删除
                $.ajax({
                    url:"/admin/delete",
                    type:"get",
                    data:{"id":id},
                    dataType:"json",
                    success:function (result) {
                        if(result.code==200){
                            alert("删除成功！");
                            window.location.reload()
                        }else{
                            alert("删除失败！")
                        }
                    },
                    error:function () {
                        alert("删除失败！");
                    }
                })
            }
        }
    </script>
</body>
</html>
