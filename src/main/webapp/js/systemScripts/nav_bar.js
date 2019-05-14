$(function() {
    $('#a_gotoHomepage').click(function() {
        window.location.href = baselocation + "/home/view";
    })
});

$(function() {
    $('#a_gotoDataTotal').click(function() {
        window.location.href = baselocation + "/dataAnalyze/dataTotal/view";
    })
});

$(function() {
    $('#a_gotoViewPersonInfo').click(function() {
        window.location.href = baselocation + "/info/viewPersonInfo/view";
    })
});

$(function() {
    $('#a_gotosocial').click(function() {
        window.location.href = baselocation + "/social/social/view";
    })
});

$(function() {
    $('#a_InsideGotoDataTotal').click(function() {
        window.location.href = baselocation + "/dataAnalyze/dataTotal/view";
    })
});

$(function() {
    $('#a_InsideGotoDataDiagram').click(function() {
        window.location.href = baselocation + "/dataAnalyze/dataDiagram/view";
    })
});

$(function() {
    $('#a_InsideGotoViewPersonInfo').click(function() {
        window.location.href = baselocation + "/info/viewPersonInfo/view";
    })
});

$(function() {
    $('#a_InsideGotoChangePersonInfo').click(function() {
        window.location.href = baselocation + "/info/changePersonInfo/view";
    })
});

$(function() {
    $('#a_InsideGotoPublishMsg').click(function() {
        window.location.href = baselocation + "/social/publishMsg/view";
    })
});

$(function() {
    $(".messagelist").each(function () {
        $(this).click(function () {
            /*alert($(this).attr('id'));*/
            $.ajax(
                {
                    type:'get',
                    url:baselocation+"/viewDetails",
                    data:{
                        messageId:$(this).attr('id') //这里是String类型
                    },
                    dataType:'json',
                    success:function (data) {
                        if(data.code === 1)
                        {
                            window.location.href = baselocation+"/social/msgDetail/view";
                        }
                    }

                }
            )
        })
    })
});

$(function() {
    $('#btn_publishComment').click(function() {
        $.ajax(
            {
                type:'post',
                url:baselocation+"/publishComment",
                data:
                    {
                        content: $('#comment_content').val()
                    },
                dataType:'json',
                success:function (data) {
                    if(data.code === 1)
                    {
                        alert('comment send success');
                        window.location.href = baselocation + "/social/msgDetail/view";
                    }
                }
            }
        )
    })
});


$(function() {
    $(".MpList").each(function () {
        $(this).click(function () {
            /*alert($(this).attr('id'));*/
            $.ajax(
                {
                    type:'get',
                    url:baselocation+"/showArticles",
                    data:{
                        mpId:$(this).attr('id') //这里是String类型
                    },
                    dataType:'json',
                    success:function (data) {
                        if(data.code === 1)
                        {
                            window.location.href = baselocation + "/dataAnalyze/data_ArticleList/view";
                        }
                    }

                }
            )
        })
    })
});

$(function() {
    $(".ArticleLists").each(function () {
        $(this).click(function () {
            /*alert($(this).attr('id'));*/
            $.ajax(
                {
                    type:'get',
                    url:baselocation+"/showArticleDetail",
                    data:{
                        articleId:$(this).attr('id') //这里是String类型
                    },
                    dataType:'json',
                    success:function (data) {
                        if(data.code === 1)
                        {
                            window.location.href = baselocation + "/dataAnalyze/data_ArticleDetails/view";
                        }
                    }

                }
            )
        })
    })
});

$(function() {
    $(".RecentArticle").each(function () {
        $(this).click(function () {
            /*alert($(this).attr('id'));*/
            $.ajax(
                {
                    type:'get',
                    url:baselocation+"/showArticleDetailUsingName",
                    data:{
                        articleName:$(this).attr('name') //这里是String类型
                    },
                    dataType:'json',
                    success:function (data) {
                        if(data.code === 1)
                        {
                            window.location.href = baselocation + "/dataAnalyze/data_ArticleDetails/view";
                        }
                    }

                }
            )
        })
    })
});






