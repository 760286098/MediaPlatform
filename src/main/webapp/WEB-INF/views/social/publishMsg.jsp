<%@ page contentType="text/html;charset=UTF-8"%>
<%
/*获取工程路径*/
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../css/favicon.ico">
    <title>社区</title>
	<!-- css引用 -->
    <!-- Bootstrap core CSS -->
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../../../css/childstyle.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="../../../css/childmenu.css" type="text/css" media="screen">
	<link rel="stylesheet" href="../../../css/bootstrap-table.css"/>
	<link rel="stylesheet" href="../../../css/bootstrap-table-fixed-columns.css"/>
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
		
		<!--导航栏-->
	    <nav class="navbar navbar-inverse navbar-fixed-top">
		    <div class="container-fluid">
				<div class="navbar-header">
					<img src="../../../img/mainlogo.png" style="width:50px">
				</div>
			    <div class="navbar-header">
		  		    <p class="navbar-brand" ><font size="5">媒体管理平台</font></p>
			    </div>
			    <div>
				    <p id= "huanying" class="navbar-brand" align="right"><font size="4">用户：<a href="/SwitchPage?page=setpage">${userid}</a> </font></p>
			    </div>

			    <div id="navbar" class="navbar-collapse collapse">
				    <ul class="nav navbar-nav navbar-right">
						<li><a href="../home/homepage.jsp" class="active"><font size="3">首页</font></a></li>
						<li><a href="../system/dataTotal.jsp"><font size="3">数据分析</font></a></li>
						<li><a href="../info/viewPersonInfo.jsp"><font size="3">我的信息</font></a></li>
						<li><a href="social.jsp"><font size="3">留言社区</font></a></li>
				    </ul>
				</div>
		    </div>
	    </nav>
		<!--//导航栏-->


		<div class="tab-content">
			<!--内容-->
			<div class="container-fluid">

				<!-- 左边空白部分 -->
				<div class="col-sm-3 col-md-2 sidebar">
					<div></div>
				</div>
				<!-- //左边空白部分 -->


				<!-- 控制输出内容在右半部分 -->
				<div class="col-sm-9 col-sm-offset-3 col-md-7 col-md-offset-2 main">
					<div class="tab-content">
					<!--进行消息推送-->
					<p>
						<font size="6">
							发布通知
						</font>
					</p>
						<form role="form">
							<div>
								<label for="title">标题(15字以内)</label>
								<input name="price" id= "title" style="width:500px" type="text" class="form-control"
								placeholder="请输入标题" required="required" >
								<br/><br/>
								<textarea name="customermessage" style="width:1000px;" rows="5" warp="virtual" placeholder="正文"></textarea>
							</div>
							<br/><br/>
							<div class="btn-group pull-left" style="margin-left: 0px;">
								<button id="addBtn" type="button" class="btn btn-default">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>发布</button>
							</div>
						</form>			
					<!--//进行消息推送-->
					</div>
				</div>


					<!--帮助手册内容-->



					<div class="container">
						<div style="position:fixed; top: 58%; right:0px; text-align: center;">
							<span>关注我们</span>
							<img src="../../../img/公众号二维码.jpg" class="img-responsive" alt="Cinque Terre" width="200" height="150">
						</div>

						<button onclick="topFunction()" id="myBtn" title="返回顶部">返回顶部</button>

					</div>



				</div>
				<!-- //控制输出内容在右半部分 -->


			</div>
			<!--内容-->

		</div>
		<style type="text/css">
			#myBtn {
				display: none;
				position: fixed;
				bottom: 20px;
				right: 30px;
				z-index: 99;
				border: none;
				outline: none;
				background-color: rgb(15,130,218);
				color: white;
				cursor: pointer;
				padding: 15px;
				border-radius: 10px;
			}
			#myBtn:hover {
				background-color: #555;
			}
		</style>

		<script type="text/javascript">
            window.onscroll = function() {scrollFunction()};

            function scrollFunction() {console.log(121);
                if (document.body.scrollTop > 20 || document.documentElement	.scrollTop > 20) {
                    document.getElementById("myBtn").style.display = "block";
                } else {
                    document.getElementById("myBtn").style.display = "none";
                }
            }
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
		</script>

	</body>
</html>