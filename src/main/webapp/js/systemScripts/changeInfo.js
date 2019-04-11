$(function () {
    $('#btn_changeInfo').click(function ()
    {
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

        if(checkPhone()==false||checkManager()==false)
        {
            alert("您的表单包含无效信息，请检查并修改后再次提交！")
        }

        else
        {
            var info ={
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
                url:baselocation+"/changeInfo",
                data:info,
                dataType:'json',
                success:function (data) {
                    console.info(data);
                    if(data.code === 1)
                    {
                        alert('modify success!');
                    }

                    else
                    {
                        alert('error: the status of web is '+data.code+', debug it!');//查看webResult的code
                    }


                }

            }
        )

    })

})