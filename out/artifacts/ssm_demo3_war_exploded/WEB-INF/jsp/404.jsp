<%--
  Created by IntelliJ IDEA.
  User: 白开水
  Date: 2022/3/25
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>该页面不存在-404.life</title>
    <link rel="shortcut icon" href="${APP_PATH}/images/favicon.ico">
    <link type="text/css" rel="stylesheet" href="${APP_PATH}/dist/css/style.css"/>

</head>
<body>
<!-- partial:index.partial.html -->
<div class="container">
    <div class="display">
        <h1 class="num"></h1>
        <h1 class="stg"></h1>
    </div>
</div>
<!-- partial -->
<script type="text/javascript" src="${APP_PATH}/dist/js/script.js"></script>

</body>
</html>
