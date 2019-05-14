<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/base.jsp" %>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../../../css/bootstrap.min.css">
<link href="../../../css/signin.css" rel="stylesheet">
<link href="../../../css/style1.css" rel="stylesheet">
<script src="../../../js/jquery-1.7.1.min.js"></script>
<script src="../../../js/ui.js"></script>
<script type="text/javascript">baselocation="${ctx}"</script>

<title>欢迎注册媒体管理平台</title>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<link rel="stylesheet" href="../../../css/bootstrap.min.css">
    <script src="../../../js/jquery-1.7.1.min.js"></script>
    <script src="../../../js/bootstrap.min.js"></script>--%>
    <title>欢迎注册媒体管理平台</title>
</head>
<body>


<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <p class="navbar-brand">
                <font size="5">媒体管理平台</font>
            </p>
        </div>
    </div>
</nav>

<div class="container" style="margin-top: 80px;">
    <div class="col-md-6 col-md-offset-3">
        <form class="">

            <div class="form-group has-feedback">
                <label for="registerName">用户名*</label>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                    <input id="registerName" name="identity" class="form-control" placeholder="请输入用户名" maxlength="20" type="text" required="" >
                </div>
                <span id="id-message" style="color: red; font-size: small;"></span>

            </div>

            <div class="form-group has-feedback">
                <label for="registerPassword">密码*</label>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                    <input id="registerPassword" class="form-control" name="password" placeholder="请输入密码" maxlength="20" type="password" required="">
                </div>
                <span id="password-message" style="color: red; font-size: small;"></span>
            </div>

            <div class="form-group has-feedback">
                <label for="passwordConfirm">确认密码*</label>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                    <input id="passwordConfirm" class="form-control" name="chkpassword" placeholder="请再次输入密码" maxlength="20" type="password" required="">
                </div>
                <span id="repassword-message" style="color: red; font-size: small;"></span>
            </div>

            <div class="form-group has-feedback">
                <label for="departmentName">所属部门*</label>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                    <input id="departmentName" class="form-control"  placeholder="请输入部门" maxlength="45" type="text">
                </div>
                <span id="name-message" style="color: red; font-size: small;"></span>
            </div>



            <div class="form-group has-feedback">
                <label for="studentNumber">学号*</label>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                    <input id="studentNumber" class="form-control" name="studentNumber" placeholder="请输入学号" maxlength="45" type="text" required="">
                </div>
            </div>

            <div class="form-group has-feedback">
                <label for="phoneNumber">联系方式*</label>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-phone"></span>
                        </span>
                    <input id="phoneNumber" class="form-control" name="phone" placeholder="请输入手机号码" maxlength="11" type="text" required="">
                </div>
                <span id="phone-message" style="color: red; font-size: small;"></span>
            </div>

            <div class="form-group has-feedback">
                <label for="startYear">入学年份*</label>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                    <input id="startYear" class="form-control" name="manager" placeholder="请输入入学年份" maxlength="45" type="text" required="" >
                </div>
                <span id="manager-message" style="color: red; font-size: small;"></span>
            </div>

            <div class="form-group has-feedback">
                <label for="description">职位描述*</label>
                <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                    <input id="description" class="form-control" name="description" placeholder="请描述店铺业务" maxlength="45" type="text" required="">
                </div>
            </div>



            <div class="form-group">
                <input class="form-control btn btn-primary" id="btn_register"  value="立&nbsp;&nbsp;即&nbsp;&nbsp;注&nbsp;&nbsp;册" type="submit">
            </div>

            <div class="form-group">
                <input value="重置" id="reset" class="form-control btn btn-danger" type="reset">
            </div>

            <br><br>

            <div class="form-group">
                <input class="form-control btn btn-primary" id="btn_gotoLogin"  value="去&nbsp;&nbsp;登&nbsp;&nbsp;录" type="submit">
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="../../../js/systemScripts/register.js"></script>

<%--<script>
    function checkId() {
        //字母数字下划线
        var regex = /^[^_][A-Za-z]*[a-z0-9_]*$/;
        var inputValue = document.getElementById("username").value;
        var ret = regex.test(inputValue);
        if(inputValue == ""){
            document.getElementById("id-message").innerHTML = ""
        }else if(inputValue.length > 20 || inputValue.length == 1 || ret != true){
            document.getElementById("id-message").innerHTML = "输入2-20位数字字母下划线";
            return false;
        }else{
            document.getElementById("id-message").innerHTML = ""
        }
    }

    function checkPassword() {
        var inputValue = document.getElementById("password").value;
        if(inputValue.length == 1 || inputValue.length > 20){
            document.getElementById("password-message").innerHTML = "请输入2-20个任意字符"
            return false;
        }else{
            document.getElementById("password-message").innerHTML = "";
        }
    }

    function checkPasswordRepeat(){
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;
        if (repassword == "") {
            document.getElementById("repassword-message").innerHTML = ""
        } else if (repassword != password) {
            document.getElementById("repassword-message").innerHTML = "请确保两次输入的密码一致"
            return false;
        } else{
            document.getElementById("repassword-message").innerHTML = "";
        }
    }

    function checkPhone(){
        //只输入数字
        var number = /^1[3|4|5|8][0-9]\d{4,8}$/;
        var phone = document.getElementById("shop_phone").value;
        var ret = number.test(phone);
        if(phone == ""){
            document.getElementById("phone-message").innerHTML = "";
        }else if((phone.length < 11 && phone.length > 0) || (ret != true && phone.length > 0)){
            document.getElementById("phone-message").innerHTML = "请确保正确输入11位手机号码";
            return false;
        }else{
            document.getElementById("phone-message").innerHTML = "";
        }
    }

    function checkManager(){
        //只输入字母和汉字
        var word = /^[a-zA-Z\u4e00-\u9fa5]+$/;
        var manager = document.getElementById("shop_manager").value;
        var ret = word.test(manager);
        if(ret != true && manager.length > 0){
            document.getElementById("manager-message").innerHTML = "请确保您输入的内容只有汉字和字母";
            return false;
        }else{
            document.getElementById("manager-message").innerHTML = "";
        }
    }

    function checkSubmit(){
        if(checkId() == false || checkPassword() == false || checkPasswordRepeat() == false || checkPhone() == false || checkManager() == false){
            alert("您的表单包含无效信息，请检查并修改后再次提交！")
        }
    }
    function keyPress() {

        var keyCode = event.keyCode;

        if ((keyCode >= 48 && keyCode <= 57))

        {

            event.returnValue = true;

        } else {

            event.returnValue = false;

        }

    }
</script>--%>

</body>
</html>