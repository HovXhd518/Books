<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/3/13
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="${APP_PATH}/dist/css/bootstrap.css">
</head>
<body>
<div class="container">
<%--    <form action="add" method="post" class="container btn">--%>
<%--        <p>图书名称:<input type="text" name="bookName"></p>--%>
<%--        <p>图书数量:<input type="text" name="bookCounts"></p>--%>
<%--        <p>图书介绍:<input type="text" name="detail"></p>--%>
<%--        <p><input type="submit" value="添加" class="btn btn-primary"></p>--%>
<%--    </form>--%>
    <br><br><br>
    <div class="col-lg-6 col-lg-offset-3">
        <form action="/book/add" method="post">
            <div  class="form-group">
                <label for="bookName">BookName</label>
                <input type="text" name="bookName" id="bookName" class="form-control"  placeholder="图书名称">
            </div>
            <div  class="form-group">
                <label for="bookCounts">BookCount</label>
                <input type="text" name="bookCounts" id="bookCounts" class="form-control"  placeholder="图书数量">
            </div>
            <div  class="form-group">
                <label for="detail">Detail</label>
                <input type="text" name="detail" id="detail" class="form-control"  placeholder="图书描述">
            </div>
            <button type="submit" class="btn btn-default">添&nbsp;加</button>
        </form>
    </div>

</div>

</body>
</html>
