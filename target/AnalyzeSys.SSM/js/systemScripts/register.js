$(function () {
    $('#btn_register').click(function ()
    {
        function checkId() {
            //字母数字下划线
            var regex = /^[^_][A-Za-z]*[a-z0-9_]*$/;
            var inputValue = $("#registerName").val();  //注意，用jquery的语法$，就用匹配的.val()语法来获取值；用document.getElementById()就用.value
            var ret = regex.test(inputValue);
            if (inputValue == "") {
                $("id-message").innerHTML = ""
            } else if (inputValue.length > 20 || inputValue.length == 1 || ret != true) {
                $("id-message").innerHTML = "输入2-20位数字字母下划线";
                return false;
            } else {
                $("id-message").innerHTML = ""
            }
        }

        function checkPassword() {
            var inputValue = $("#registerPassword").val(); //#id是jQuery的选择器，CSS中选择元素的方式是#id,.class，jQuery和此相同
            if (inputValue.length == 1 || inputValue.length > 20) {
                $("password-message").innerHTML = "请输入2-20个任意字符"
                return false;
            } else {
                $("password-message").innerHTML = "";
            }
        }

        function checkPasswordRepeat() {
            var password = $("#registerPassword").val();
            var repassword = $("#passwordConfirm").val();
            if (repassword == "") {
                $("repassword-message").innerHTML = ""
            } else if (repassword != password) {
                $("repassword-message").innerHTML = "请确保两次输入的密码一致"
                return false;
            } else {
                $("repassword-message").innerHTML = "";
            }
        }

        function checkPhone() {
            //只输入数字
            var number = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            var phone = $("#phoneNumber").val();
            var ret = number.test(phone);
            if (phone == "") {
                $("phone-message").innerHTML = "";
            } else if ((phone.length < 11 && phone.length > 0) || (ret != true && phone.length > 0)) {
                $("phone-message").innerHTML = "请确保正确输入11位手机号码";
                return false;
            } else {
                $("phone-message").innerHTML = "";
            }
        }

        function checkManager() {
            //只输入字母和汉字
            var word = /^[a-zA-Z\u4e00-\u9fa5]+$/;
            var manager = $("#description").val();
            var ret = word.test(manager);
            if (ret != true && manager.length > 0) {
                $("manager-message").innerHTML = "请确保您输入的内容只有汉字和字母";
                return false;
            } else {
                $("manager-message").innerHTML = "";
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

        if (checkId() == false || checkPassword() == false || checkPasswordRepeat() == false || checkPhone() == false || checkManager() == false) {
            alert("您的表单包含无效信息，请检查并修改后再次提交！")
        }

        else {
            var info = {
                registerName: $("#registerName").val(),
                registerPassword: $("#registerPassword").val(),
                departmentName: $("#departmentName").val(),
                studentNumber: $("#studentNumber").val(),
                phoneNumber: $("#phoneNumber").val(),
                startYear: $("#startYear").val(),
                description :$("#description").val()
            }
        }

        $.ajax(
            {
                type:'post',
                url:baselocation+"/register",
                data:info,
                dataType:'json',
                success:function(data){
                    console.info(data);
                    if(data.code === 1)
                    {
                        alert('register success!');
                    }
                    else {
                        alert('error: the status of web is '+data.code+', debug it!');//查看webResult的code
                    }
                }

            }
        )


    })

})


$(function() {
    $('#btn_gotoLogin').click(function() {
          window.location.href = baselocation + "/login";
    })
});