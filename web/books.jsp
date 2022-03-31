<%--
  Created by IntelliJ IDEA.
  User: 白开水
  Date: 2022/3/16
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="${APP_PATH}/dist/css/bootstrap.css" />
</head>

<body>

<!-- editModal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">Modify the book</h4>
            </div>
            <div class="modal-body">
                <form name="addForm" id="editForm" method="post">
                    <div  class="form-group">
                        <label for="bookName">BookId</label>
                       <p id="edit_id"></p>
                        <span class="help-block"></span>
                    </div>
                    <input type="hidden" name="id" id="bookId">
                    <input type="hidden" name="pn" id="pn">
                    <div  class="form-group">
                        <label for="bookName">BookName</label>
                        <input type="text"  name="bookName" id="edit_bookName" class="form-control"  placeholder="图书名称">
                        <span class="help-block"></span>
                    </div>
                    <div  class="form-group">
                        <label for="bookCounts">BookCount</label>
                        <input type="text" name="bookCounts" id="edit_bookCounts" class="form-control"  placeholder="图书数量">
                        <span class="help-block"></span>
                    </div>
                    <div  class="form-group">
                        <label for="detail">Detail</label>
                        <input type="text" name="detail" id="edit_detail" class="form-control"  placeholder="图书描述">
                        <span class="help-block"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="updateSubmit" class="btn btn-primary">Update changes</button>
            </div>
        </div>
    </div>
</div>

<!-- addModal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">AddBooks</h4>
            </div>
            <div class="modal-body">
                <form name="addForm" id="addForm" method="post">
                    <div  class="form-group">
                        <label for="bookName">BookName</label>
                        <input type="text"  name="bookName" id="bookName" class="form-control"  placeholder="图书名称">
                        <span class="help-block"></span>
                    </div>
                    <div  class="form-group">
                        <label for="bookCounts">BookCount</label>
                        <input type="text" name="bookCounts" id="bookCounts" class="form-control"  placeholder="图书数量">
                        <span class="help-block"></span>
                    </div>
                    <div  class="form-group">
                        <label for="detail">Detail</label>
                        <input type="text" name="detail" id="detail" class="form-control"  placeholder="图书描述">
                        <span class="help-block"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="addSubmit" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>


<div class="container">

    <div class="row">
        <h1 class="col-lg-6">图书列表</h1>
    </div>
    <div class="col-lg-2 col-lg-offset-4">
        <button  class="btn btn-primary" id="addBtn">
            <span class="glyphicon glyphicon-plus" >&nbsp;添加图书</span>
        </button>
    </div>
    <table class="table table-hover">
        <tr>
            <th>图书编号</th>
            <th>图书名称</th>
            <th>图书数量</th>
            <th>图书描述</th>
            <th>操作</th>
        </tr>
        <tbody id="book_table">

        </tbody>
    </table>

    <div class="row">
        <div class="row">
            <div class="col-lg-6" id="pageInfo">

            </div>
            <div class="col-lg-6" id="pageList">
                <nav aria-label="Page navigation">
                    <ul class="pagination">

                    </ul>
                </nav>
            </div>
        </div>

    </div>

</div>

<script type="text/javascript" src="${APP_PATH}/dist/js/jquery-1.12.4.js"></script>
<%--bootstrap的插件是依赖于jQuery的--%>
<script type="text/javascript" src="${APP_PATH}/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        goToPageNum(1);
    })
    //构建图书列表
    function build_books_table(data) {
        //清空历史数据
        $("#book_table").empty();
        var books = data.returnData.booksPageInfo.list;
        $.each(books,function (index,item) {
            //构建5个td 存放数据
            var id_td = $("<td></td>").append(item.id);
            var bookName_td = $("<td></td>").append(item.bookName);
            var bookCounts_td = $("<td></td>").append(item.bookCounts);
            var  detail_td = $("<td></td>").append(item.detail);
            //操作列的td
            //编辑按钮
            var edit_btn = $("<button></button>").addClass("btn btn-sm btn-primary edit_btn").attr("data-id",item.id).attr("data-pn",data.returnData.booksPageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("&nbsp;修改")
            //删除按钮
            var del_btn = $("<button></button>").addClass("btn btn-sm btn-danger del_btn").attr("data-id",item.id).attr("data-pn",data.returnData.booksPageInfo.pageNum)
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("&nbsp;删除")
            //将操作按钮放入操作的td列
            var ac =$("<td></td>").append(edit_btn).append(del_btn)

            //将4个td 放入一个tr里
            var tr = $("<tr></tr>")
                .append(id_td)
                .append(bookName_td)
                .append(bookCounts_td)
                .append(detail_td)
                .append(ac);
            //将tr添加至tbody
            tr.appendTo($("#book_table"))
        })
    }
    //构建分页信息
    function build_books_info(data) {
        $("#pageInfo").empty();
        var pageInfo = data.returnData.booksPageInfo;
        //节点：元素节点(标签) 文本节点（text） 属性节点  注释
        $("#pageInfo").append("当前是第"+pageInfo.pageNum+"页  "
            +pageInfo.pageNum+"/ "+pageInfo.pages+"共"+pageInfo.total+"条信息")
    }
    //构建分页列表信息
    function build_books_list(data) {
        $(".pagination").empty();
        //获取分页信息
       var pageInfo = data.returnData.booksPageInfo;
       //ul标签
       var ul = $(".pagination")
    //    生成 首页 上一页的li
        var firstPageLi = creatLi("首页");
        var prePageLi = creatLi("&laquo;");
        //添加点击事件 跳转

        if (pageInfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled")
            prePageLi.addClass("disabled")
        }else {
            liClick(firstPageLi,1);
            liClick(prePageLi,pageInfo.pageNum -1);
        }
        ul.append(firstPageLi);
        ul.append(prePageLi);

        //页码列表
        $.each(pageInfo.navigatepageNums,function (index,item) {
            var li = creatLi(item);
            liClick(li,item);
            if (item == pageInfo.pageNum){
                li.addClass("active");
            }
            li.appendTo(ul);
        })

        var nextPageLi = creatLi("&raquo;");
        var lastPageLi = creatLi("末页");

        if (pageInfo.hasNextPage==false){
            nextPageLi.addClass("disabled")
            lastPageLi.addClass("disabled")
        }else {
            liClick(lastPageLi,pageInfo.pages);
            liClick(nextPageLi,pageInfo.pageNum +1);
        }
        ul.append(nextPageLi);
        ul.append(lastPageLi);
    }

    //生成li
     function creatLi(str) {
        var li = $("<li></li>").append($("<a></a>").attr("href","#").append(str));
       return  li;
    }
    //给生成的li添加点击事件
    function liClick(obj,pn) {
        obj.click(function () {
            // alert(pn)
            goToPageNum(pn)
        })
    }

    function goToPageNum(pn) {
        $.ajax({
            url:"${APP_PATH}/books",
            data:"pageNum="+pn,
            type:"GET",
            success:function (data) {
                console.log(data)
                build_books_table(data);
                build_books_info(data);
                build_books_list(data);
            }
        })
    }

    //添加的模态框
    $("#addBtn").click(function () {
        $("#addModal").modal({
            backdrop:"static" //点击背景 模态框不消失
        });
    })
    //添加图书
    $("#addSubmit").click(function () {
        //进行数据校验
        if (!validate_addBook()) {
            return false;
        }

        // alert($("#addForm").serialize())
        //发送添加的请求
        $.ajax({
            method:"POST",
            url:"${APP_PATH}/books",
            data:$("#addForm").serialize(),
            success:function (data) {
                // alert(data.info);
                //操作失败
                if(data.code == 100){
                    //获取错误信息
                    var errorMap = data.returnData.errorMap;
                     //渲染
                    addStatusInfo($("#bookName"),"error",errorMap.bookName);
                    addStatusInfo($("#bookCounts"),"error",errorMap.bookCounts);
                    addStatusInfo($("#detail"),"error",errorMap.detail);
                    // console.log(data)
                }
                //操作成功
                if (data.code == 200){
                    //关闭模态框
                    $('#addModal').modal('hide');
                    //跳转到第一页
                    goToPageNum(1);
                }

            }
        })
    })
    
    function addStatusInfo(ele,status,msg) {
        if(status=="error"){
            ele.parent().removeClass("has-error success-error");
            ele.parent().addClass("has-error");
            ele.next("span").text(msg)
        }
        if(status=="success"){
            ele.parent().removeClass("has-error success-error");
            ele.parent().addClass("has-success");
            ele.next("span").text(msg)
        }
    }
    
    //添加图书的数据校验
    function validate_addBook() {
        //英文 中文 数字 _ 中文
        var bookNameVal = $("#bookName").val();
        var regBookName = /^[A-Za-z0-9_\u2E80-\u9FFF]{1,50}$/
        if(!regBookName.test(bookNameVal)){
                addStatusInfo($("#bookName"),"error","中英文下划线组合，不能有特殊字符")
            // alert("图书名称不正确，应为中英文，不能含有特殊符号")
            return false;
        }else {
           addStatusInfo($("#bookName"),"success","√")
        }
        var bookCountsVal = $("#bookCounts").val();
        var RegbookCounts = /^[0-9]+$/
        if(!RegbookCounts.test(bookCountsVal)){
            addStatusInfo($("#bookCounts"),"error","图书数量必须是数字")
            // alert("图书数量必须是数字")
            return false;
        }else{
            addStatusInfo($("#bookCounts"),"success","√")
        }
        var detailVal = $("#detail").val();
        var Regdetail = /^[A-Za-z0-9_\u2E80-\u9FFF]{5,100}$/
        if(!Regdetail.test(detailVal)){
            addStatusInfo($("#detail"),"error","描述太短，必须5个字以上")
            // alert("描述太短，必须5个字以上")
            return false;
        }else {
            addStatusInfo($("#detail"),"success","√")
        }
        return true;
    }

    // 修改图书
   $(document).on("click",".edit_btn",function () {
       //保存当前页码
       $("#pn").val($(this).attr("data-pn"));
       alert($(this).attr("data-pn"))

       //显示修改的模态框
        // alert($(this).attr("data-id"))
       $("#editModal").modal({
           backdrop: "static", //点击背景  模态框不消失
           show:true
       })
       //做一次查询 根据id查询
       $.ajax({
           url:"${APP_PATH}/books/"+$(this).attr("data-id"),
           method: "GET",
           success:function (data) {
               console.log(data);
               var book = data.returnData.book;
               $("#edit_id").text(book.id);
               $("#bookId").val(book.id);
               $("#edit_bookName").val(book.bookName);
               $("#edit_bookCounts").val(book.bookCounts);
               $("#edit_detail ").val(book.detail);
           }
       })
   })

    //点击更新按钮
    $("#updateSubmit").on("click",function () {
        // alert("gerwgwagr")
        //发送ajax 请求
        $.ajax({
            url:"${APP_PATH}/books",
            method:"post",
            data:$("#editForm").serialize()+"&_method=put",
            success:function (data) {
                console.log(data);
                if (data.returnData.msg=="success"){
                    alert("修改成功")
                    $("#editModal").modal('hide'); //关闭模态框
                    //跳转页面
                    goToPageNum($("#pn").val());

                }
            }
        })
    })

    //给删除按钮添加点击事件
    $(document).on("click",".del_btn",function () {
        var pn = $(this).attr("data-pn");
        if (confirm("你确定删除吗")){
            // alert("删除")
            //发送删除的请求
            $.ajax({
                url:"${APP_PATH}/books/"+$(this).attr("data-id"),
                data:"_method=delete",
                method:"POST",
                success:function (data) {
                    console.log(data)
                    if (data.returnData.msg=="success"){
                        alert("删除成功")
                        $("#editModal").modal('hide'); //关闭模态框
                        //跳转页面
                        goToPageNum(pn);

                    }
                }
            })
        }
    })

</script>
</body>
</html>