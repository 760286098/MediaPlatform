$(function ()
{
    $('#publish_Message').click(function()
        {
            //运行一个对发布通知的标题和内容是否为空的检查
            if($('#Message_title').val()=="")
            {
                alert('标题不能为空');
            }
            if($('#Message_content').val()=="")
            {
                alert('正文不能为空');
            }
            else
            {
                var info =
                    {
                        Message_title:$('#Message_title').val(),
                        Message_content:$('#Message_content').val()
                    }
            }
            $.ajax(
                {
                    type:'post',
                    url:baselocation+"/publish",
                    data:info,
                    dataType:'json',
                    success:function (data) {
                        console.info(data);
                        if(data.code === 1)
                        {
                            alert('发布成功');
                            window.location.href = baselocation+"/social/social/view";
                        }
                        else
                        {
                            alert('error: the status of web is '+data.code+', debug it!');//查看webResult的code
                        }

                    }
                }
            )



        }
    )

})