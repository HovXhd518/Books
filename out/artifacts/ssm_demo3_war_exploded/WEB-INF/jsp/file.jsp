<%--
  Created by IntelliJ IDEA.
  User: 白开水
  Date: 2022/3/22
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <title>文件下载测试</title>
</head>
<body>
<h1>文件下载测试</h1>
<a href="${APP_PATH}/testDown">测试文件下载</a>
</body>
</html>
