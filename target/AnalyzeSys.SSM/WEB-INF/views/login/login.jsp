<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/base.jsp" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="../../../css/bootstrap.min.css">
    <link href="../../../css/signin.css" rel="stylesheet">
    <link href="../../../css/style1.css" rel="stylesheet">
    <script src="../../../js/jquery-1.7.1.min.js"></script>
    <script src="../../../js/ui.js"></script>
    <script type="text/javascript">baselocation="${ctx}"</script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <p class="navbar-brand" ><font size="5">媒体管理平台</font></p>
        </div>

    </div>
</nav>

<div class="container" style="margin-top: 120px">

    <form class="form-signin">

        <h2 class="form-signin-heading" id="sign_top">登录</h2>  <br><br>

        <label for="loginName" class="sr-only">username</label>
        <input type="text" id="loginName" name="name" class="form-control" placeholder="请输入学号" autofocus>

        </br>

        <label><font size="4" color="#dc143c"></font> </label>

        <label for="loginPassword" class="sr-only">Password</label>
        <input type="password" id="loginPassword" name="password" class="form-control" placeholder="请输入密码">

        <label><font size="4" color="#dc143c"></font> </label>
        <label><font size="4" color="#dc143c"></font> </label>

        <br><br>

        <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="button" value="登录">登录</button>

        <h3>还没有账户？？？</h3>>
        <br>
        <button id="btn_gotoRegister" class="btn btn-lg btn-primary btn-block" type="button" value="登录">去注册</button>


    </form>


</div>
</body>

<script type="text/javascript" src="../../../js/systemScripts/login.js"></script>
<%--
<script>
    var success = document.getElementById("success").value;
    if(success.localeCompare("")) {
        mizhu.alert('', success);
    }
</script>--%>


</html>

