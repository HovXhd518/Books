<%--
  Created by IntelliJ IDEA.
  User: 白开水
  Date: 2022/3/21
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<html>
<head>
    <link type="text/css" rel="styleSheet" href="${APP_PATH}/dist/css/bootstrap.css"/>
    <title>用户界面</title>
</head>
<body>

    <%--添加用户modal--%>
    <div class="modal fade" id="addUserModal" role="dialog" arialabelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" arialabel="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">用户添加</h4>
                </div>
                <div class="modal-body">
                    <form method="post" name="form1" id="form1"
                          enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="uName">用户名</label>
                            <input type="text" class="form-control" id="uName"
                                   name="uName" placeholder="username">
                        </div>
                        <div class="form-group">
                            <label for="pwd">密码</label>
                            <input type="password" autocomplete class="form-control"
                                   name="pwd" id="pwd" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="email">邮箱</label>
                            <input type="email" name="email" class="form-control"
                                   id="email" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <label for="birthday">出生日期</label>
                            <input type="date" name="birthday" class="form-control"
                                   id="birthday" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <label for="picfile">上传头像</label>
                            <%--文件域--%>
                            <input type="file" name="file" id="picfile">
                            <p class="help-block"></p>
                        </div>
                        <div class="form-group">
                            <label for="phone">电话</label>
                            <input type="text" name="phone" class="form-control"
                                   id="phone" placeholder="电话">
                        </div>
                        <div class="form-group" id="sex">
                            <label>性别</label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="inlineRadio1" value="1"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="inlineRadio2" value="0"> 女
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" datadismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="saveUserBtn">保存用户</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-lg-offset-9">
                <button class="btn btn-primary btn-lg" id="addUserBtn">添加用户</button>
            </div>
        </div>
    </div>
<script type="text/javascript" src="${APP_PATH}/dist/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${APP_PATH}/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">

    $(function () {
        //点击添加用户  弹出添加的模态框
        $("#addUserBtn").click(function () {
            $("#addUserModal").modal({
                backdrop:'static',  //点击背景 模态框不消失
                show:true
            })
        })

        //发送添加请求
        $("#saveUserBtn").click(function () {
            //在ES6 ES2015 版本中加入了class的语法糖 创建对象可以使用new 关键字了 let const
            var formData = new FormData();
            var uName = $("#uName").val();
            var pwd = $("#pwd").val();
            var birthday = $("#birthday").val();
            var phone = $("#phone").val();
            var sex = $("#sex input").val();
            var email = $("#email").val();
            //$("#picfile")[0]
            formData.append("file",$("#picfile")[0].files[0]);
            formData.append("uName",uName);
            formData.append("pwd",pwd);
            formData.append("birthday",birthday);
            formData.append("phone",phone);
            formData.append("sex",sex);
            formData.append("email",email);

            $.ajax({
                url:"${APP_PATH}/user",
                method:"post",
                /*$("#form1").serialize() 普通字段是可以的*/
                data:formData,
                // 告诉jQuery不要去处理发送的数据
                processData : false,
                // 告诉jQuery不要去设置Content-Type请求头
                contentType : false,

                success:function (data) {
                    console.log(data)
                },
                error:function (data) {
                    console.log(data)
                }
            })
        })
    })

</script>

</div>
</body>
</html>
