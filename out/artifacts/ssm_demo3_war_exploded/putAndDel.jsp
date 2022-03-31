<%--
  Created by IntelliJ IDEA.
  User: 白开水
  Date: 2022/3/23
  Time: 7:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
</head>
<body background="images/3.jpg">
<div style="width: 1000px;margin: 50px auto;border: solid 1px #ccc;min-height: 500px;height: auto;background-color: pink">
    <p>
        <a href="${APP_PATH}/test" style="color: white">发送get请求</a>
    </p>
    <hr>
    <form name="form1" action="${APP_PATH}/test" method="post">
        <input type="submit" value="提交post请求">
    </form>
    <hr>
    <form name="form2" action="${APP_PATH}/test" method="post">
        <input type="text" name="_method" value="PUT">
        <input type="button" value="提交put请求" id="putBtn">
<%--        <input type="submit" value="提交put请求">--%>
    </form>

    <form name="form3" action="${APP_PATH}/test" method="post">
        <input type="text" name="_method" value="delete">
<%--        <input type="button" value="提交DELETE请求" id="putBtn">--%>
                <input type="submit" value="提交DELETE请求">
    </form>

</div>


<script src="${APP_PATH}/dist/js/jquery-1.12.4.js"></script>
<script>
    $(function () {
        $("#putBtn").click(function () {
            $.ajax({
                url:"${APP_PATH}/test",
                method:"post",
                data:"_method=put",
                success:function (data) {
                    console.log(data)
                }
            })
        })
    })
</script>
</body>
</html>
