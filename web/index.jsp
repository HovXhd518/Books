<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/3/13
  Time: 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
  <head>
    <title>$Title$</title>
    <link type="text/css" rel="stylesheet" href="${APP_PATH}/dist/css/bootstrap.css"/>
  </head>

  <br>
  <h1><%out.print(request.getContextPath());
  %></h1>
  <body background="images/background.jpg">
    <div class="container">
        <div class="row">
            <a href="${APP_PATH}/book/getBook" class="btn btn-lg btn-info col-lg-6 col-lg-offset-3">
              <span>进入图书列表</span>
            </a>
        </div>

        <p>
            <div class="row">
                <a href="${APP_PATH}/gotoBooks" class="btn btn-lg btn-info col-lg-6 col-lg-offset-3">
                    <span>进入图书列表2</span>
                </a>
            </div>
        </p>


        <p>
            <div class="row">
                <a href="${APP_PATH}/user" class="btn btn-lg btn-info col-lg-6 col-lg-offset-3">
                   <span>进入添加用户界面</span>
                </a>
            </div>
        </p>

    </div>



  </body>
</html>
