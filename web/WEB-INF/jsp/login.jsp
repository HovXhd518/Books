<%--
  Created by IntelliJ IDEA.
  User: 白开水
  Date: 2022/3/25
  Time: 7:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <title>用户登录</title>
    <link type="text/css" rel="stylesheet" href="${APP_PATH}/dist/css/bootstrap.css" />
</head>
<body>
    <div class="container" style="margin-top: 100px">

        <div class="col-lg-offset-3 col-lg-6">

            <form class="form-horizontal" action="${APP_PATH}/login">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" name="uName" class="form-control" id="inputEmail3" placeholder="uName">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" name="pwd" class="form-control" id="inputPassword3" placeholder="Password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Remember me
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Sign in</button>
                    </div>
                </div>
            </form>

        </div>

    </div>
</body>
</html>
