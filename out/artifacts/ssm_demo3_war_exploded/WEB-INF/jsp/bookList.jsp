<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/3/14
  Time: 7:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="${APP_PATH}/dist/css/bootstrap.css"/>
</head>
<body>

<h1><%out.print(request.getContextPath());
    %></h1>

    <div class="container">

        <div class="row">
            <h1 class="col-lg-6">图书列表</h1>
        </div>
        <div class="col-lg-12 col-lg-offset-4">
            <a href="${APP_PATH}/book/add" class="btn btn-default">
                <span class="glyphicon glyphicon-plus">&nbsp;添加图书</span>
            </a>
        </div>

        <table class="table table-hover table-striped">
            <tr>
                <th>图书编号</th>
                <th>图书名称</th>
                <th>图书数量</th>
                <th>图书描述</th>
                <th>操作</th>
            </tr>
            <c:forEach var="book" items="${pageInfo.list}">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.bookName}</td>
                    <td>${book.bookCounts}</td>
                    <td>${book.detail}</td>
                    <td>
                        <a href="#" class="btn btn-sm btn-primary">
                            <span class="glyphicon glyphicon-pencil">&nbsp;修改</span>
                        </a>
                        <a href="#" class="btn btn-md btn-danger">
                            <span class="glyphicon glyphicon-trash">&nbsp;删除</span>
                        </a>
                    </td>
                </tr>
            </c:forEach>

        </table>

        <div class="row">
            <div class="row">
                <div class="col-lg-6">
                    当前是第  <span class="badge">${pageInfo.pageNum}</span>页 ${pageInfo.pageNum}/${pageInfo.pages}页  共<span class="badge">${pageInfo.total}</span>条信息
                </div>
                <nav aria-label="Page navigation">
                    <ul class="pagination">

                        <c:if test="${pageInfo.isFirstPage !=true}">
                            <li><a href="/book/getBook">首页</a></li>
                            <li>
                                <a href="/book/getBook?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="npn" end="${pageInfo.navigatePages-1}">
                            <c:if test="${pageInfo.pageNum == npn}">
                                <li><a class="active" href="${APP_PATH}/book/getBook?pn=${npn}">${npn}</a></li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum != npn}">
                                <li><a href="/book/getBook?pn=${npn}">${npn}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.isLastPage !=true}">
                            <li>
                                <a href="/book/getBook?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li><a href="/book/getBook?pn=${pageInfo.pages}">末页</a></li>
                        </c:if>

                    </ul>
                </nav>
            </div>

        </div>

    </div>
</body>
</html>
