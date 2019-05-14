<%@ page contentType="text/html;charset=UTF-8"%>
<%
    /*获取工程路径*/
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../css/favicon.ico">
    <title>数据分析</title>
    <!-- css引用 -->
    <!-- Bootstrap core CSS -->
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../css/childstyle.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../../../css/childmenu.css" type="text/css" media="screen">
    <link rel="stylesheet" href="../../../css/bootstrap-table.css"/>
    <link rel="stylesheet" href="../../../css/bootstrap-table-fixed-columns.css"/>
    <link rel="stylesheet" href="../../../css/souGouWeiXin_css.css"/>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../../../css/dashboard.css" rel="stylesheet">
    <link href="../../../css/carousel.css" rel="stylesheet">

    <script src="../../../js/ie-emulation-modes-warning.js"></script>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--jquery和box和bootstrap-->
    <script type="text/javascript" src="../../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/bootbox.js/4.4.0/bootbox.min.js"></script><!-- 如果断网，需要下载这个js -->
    <script type="text/javascript" src="../../../js/bootstrap-table.js"></script>
    <script type="text/javascript" src="../../../js/bootstrap-table-zh-CN.js"></script>
    <script language="javascript" type="text/javascript" src="../../../js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">baselocation="${ctx}"</script>



</head>

<body>
<style type="text/css">
    #result{
        width: 800px;
        height:500px;
        border:1px solid #eee;
    }
    #result img{
        height:500px;
    }
</style>

<!--上方导航栏-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <img src="../../../img/mainlogo.png" style="width:50px">
        </div>
        <div class="navbar-header">
            <p class="navbar-brand" ><font size="5">媒体管理平台</font></p>
        </div>
        <div>
            <p id= "huanying" class="navbar-brand" align="right"><font size="4">用户：</font><label type="text" id="user" name="user">${userInfo.name}</label>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a type="text" id="a_gotoHomepage" class = "active"><font size="3">首页</font></a></li>
                <li><a type="text" id="a_gotoDataTotal" class = "active"><font size="3">数据分析</font></a></li>
                <li><a type="text" id="a_gotoViewPersonInfo" class = "active"><font size="3">我的信息</font></a></li>
                <li><a type="text" id="a_gotosocial" class = "active"><font size="3">留言社区</font></a></li>

            </ul>

        </div>
    </div>
</nav>
<!--//上方导航栏-->


<!--内容-->
<div class="container-fluid">

    <!-- 左边导航栏 -->
    <div class="col-sm-3 col-md-2 sidebar">
        <ul class="nav nav-sidebar">
            <li class="active" id="a_InsideGotoDataTotal"><a>数据概览</a></li>
            <li><a id="a_InsideGotoDataDiagram">图表分析</a></li>
            <!--功能可以继续扩展-->
        </ul>
    </div>
    <!-- //左边导航栏 -->


    <!-- 控制输出内容在右半部分 -->
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="w3ls-details">
            <!--文章概览-->


                <li style="background: #f4f4f4">
                    <div class="gzh-box2">
                        <div class="txt-box">
                            <p class="tit">
                                <a target="_blank" id="${currentArticle._id}"><em><!--red_beg--><font size="5">${currentArticle.title}<!--red_end--></font></em></a>
                            </p>
                            <c:choose>
                                <c:when test="${currentArticle.author ne null}">
                                    <p class="info"><label>作者：${currentArticle.author}</label>
                                    </p>
                                </c:when>
                                <c:when test="${currentArticle.author eq null}">
                                    <p class="info"><label>作者：佚名</label>
                                    </p>
                                </c:when>
                            </c:choose>


                        </div>
                    </div>
                    <br/>
                    <br/>
                    <br/>
                    <dl>
                        <dt>一句话介绍：</dt>
                        <dd>${currentArticle.description}</dd>
                    </dl>
                    <br>
                    <dl>
                        <dt>发表时间：</dt>
                        <dd>
                            <a target="_blank" uigs="account_article_0">${currentArticle.date_time}</a>
                        </dd>
                    </dl>
                    <br>
                    <br>
                    <dl>
                        <dt>内容：</dt>
                        <p>${currentArticle.content}</p>
                    </dl>
                    <br>
                    <br>

                    <div style="text-align:center;">
                        <img src="${currentArticle.wordCloud_Graph}" style="  width: 358px; height: auto;">
                    </div>

                    <br/>
                    <br/>
                </li>
                <hr style=" height:2px;border:none;border-top:2px dotted #9d9d9d;"/>


        </div>

    </div>
    <!-- //控制输出内容在右半部分 -->

</div>
<!--内容-->

</div>
</body>

<script type="text/javascript" src="../../../js/systemScripts/nav_bar.js"></script>
<%--<script type="text/javascript" src="../../../js/systemScripts/dataTotal.js"></script>--%>
</html>



