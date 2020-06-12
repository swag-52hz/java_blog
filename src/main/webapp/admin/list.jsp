<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/6/9
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户列表页</title>
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
            <dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="/role/list">角色管理</a></dd>
            <dd><a href="javascript:;">退出登录</a></dd>
        </dl>
    </li>
</ul>
<form class="layui-form" action="">
    <input type="hidden" name="pageNum" value="1">
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline">
            <input type="text" name="account" value="${param.account}" placeholder="请输入账号" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="radio" name="status" value="1" title="正常" <c:if test="${param.status=='1'}">checked</c:if>>
            <input type="radio" name="status" value="0" title="注销" <c:if test="${param.status=='0'}">checked</c:if>>
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="name" value="${param.name}" placeholder="请输入姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-inline">
        <label class="layui-form-label">显示条数</label>
        <div class="layui-input-inline">
            <select name="pageSize" lay-verify="required">
                <option value="1" <c:if test="${param.pageSize=='1'}">selected</c:if>>1条/页</option>
                <option value="2" <c:if test="${param.pageSize=='2'}">selected</c:if>>2条/页</option>
                <option value="5" <c:if test="${param.pageSize=='5'}">selected</c:if>>5条/页</option>
                <option value="10" <c:if test="${param.pageSize=='10'}">selected</c:if>>10条/页</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-inline" style="width:70px;">
        <div class="layui-input-inline">
            <button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
        </div>
    </div>
</form>
    <div style="width: 100px;margin:auto;"><a href="/admin/toAdd" class="layui-btn">新增用户</a></div>
    <table class="layui-table">
        <colgroup>
            <col width="50">
            <col width="100">
            <col>
        </colgroup>
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
            <td>头像</td>
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
                <td>
                    <img style="width:25px;height: 25px;border-radius: 50%" src="${pageContext.request.contextPath}${admin.headpic}" alt="">
                    <a href="/admin/download?filename=${fn:replace(admin.headpic,"/head/","")}" class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">下载</a>
                </td>
                <td>
                    <a href="#" class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                    <a href="javascript:deleteAdmin(${admin.id})" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                    <a href="/admin/upload.jsp?id=${admin.id}" class="layui-btn layui-btn-warm layui-btn-xs" lay-event="edit">修改头像</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
<div class="layui-table-page" style="width: 300px;margin:auto">
    <div id="layui-table-page1">
        <div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-4">
            <a href="javascript:goPage(${pageInfo.pageNum-1})" class="layui-laypage-prev">
                <i class="layui-icon"></i>
            </a>
            <span class="layui-laypage-curr">
                <em class="layui-laypage-em"></em>
                <em>${pageInfo.pageNum}</em>
            </span>
            <a href="javascript:goPage(${pageInfo.pageNum+1})" class="layui-laypage-next">
                <i class="layui-icon"></i>
            </a>
            <span style="width:50px;" class="layui-badge layui-bg-blue">共${pageInfo.total}条</span>
            <span style="margin-left: 10px;width: 50px" class="layui-badge layui-bg-blue">共${pageInfo.pages}页</span>
        </div>
    </div>
</div>
    <script src="/static/layui/layui.js"></script>
    <script>
    layui.use(['form','element'], function(){
        var form = layui.form;
        var element = layui.element;
        //各种基于事件的操作，下面会有进一步介绍
    });
</script>
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
