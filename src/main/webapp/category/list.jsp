<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/6/11
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>演示二级下拉联动</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>

<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">一级菜单</label>
        <div class="layui-input-inline">
            <%--lay-filter：相当于layui中的id--%>
            <select id="one" lay-filter="one">

            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">二级菜单</label>
        <div class="layui-input-inline">
            <select id="two">

            </select>
        </div>
    </div>
</form>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['layer','form','jquery'], function(){
        var layer = layui.layer;  // 弹窗对象
        var form = layui.form;  // 表单对象
        var $ = layui.$;    // 引入jquery
        // 发送异步请求获取一级菜单
        $.get(
            "/category/childCategory",
            {parentid:-1},
                function(result){
                if(result.code==200){
                    var html = "<option value=''>请选择</option>";
                    // 获取数据并展示到下拉列表
                    for(var i=0;i<result.data.length;i++){
                        html+="<option value='"+result.data[i].id+"'>"+result.data[i].name+"</option>"
                    }
                    // 将内容添加到下拉列表中
                    $("#one").html(html);
                    // 修改表单元素后，需重新渲染
                    form.render();
                }
            },
            "json"
        );

        form.on('select(one)',function(data){
            if(data.value==''){
                // 如果是请选择，则清空选择框内容
                $("#two").empty();
                form.render();
                return;
            }
            $.get(
                "/category/childCategory",
                {parentid:data.value},
                function(result){
                    if(result.code==200){
                        var html = "<option value=''>请选择</option>";
                        // 获取数据并展示到下拉列表
                        for(var i=0;i<result.data.length;i++){
                            html+="<option value='"+result.data[i].id+"'>"+result.data[i].name+"</option>"
                        }
                        // 将内容添加到下拉列表中
                        $("#two").html(html);
                        // 修改表单元素后，需重新渲染
                        form.render();
                    }
                },
                "json"
            );

        })
    });
</script>
</body>
</html>
