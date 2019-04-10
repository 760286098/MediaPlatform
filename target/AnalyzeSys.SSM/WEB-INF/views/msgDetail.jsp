<%@ page contentType="text/html;charset=UTF-8"%>
<%
/*获取工程路径*/
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
	<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../css/favicon.ico">
    <title>社区</title>
	<!-- css引用 -->
    <!-- Bootstrap core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../../css/childstyle.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="../../css/childmenu.css" type="text/css" media="screen">
	<link rel="stylesheet" href="../../css/bootstrap-table.css"/>
	<link rel="stylesheet" href="../../css/bootstrap-table-fixed-columns.css"/>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../../css/dashboard.css" rel="stylesheet">
	<link href="../../css/carousel.css" rel="stylesheet">
	

    <script src="../../js/ie-emulation-modes-warning.js"></script>
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<!--jquery和box和bootstrap-->
	<script type="text/javascript" src="../../js/jquery.min.js"></script>
	<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.bootcss.com/bootbox.js/4.4.0/bootbox.min.js"></script><!-- 如果断网，需要下载这个js -->
	<script type="text/javascript" src="../../js/bootstrap-table.js"></script>
	<script type="text/javascript" src="../../js/bootstrap-table-zh-CN.js"></script>


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
					<img src="../../img/mainlogo.png" style="width:50px">
				</div>
			    <div class="navbar-header">
		  		    <p class="navbar-brand" ><font size="5">媒体管理平台</font></p>
			    </div>
			    <div>
				    <p id= "huanying" class="navbar-brand" align="right"><font size="4">用户：<a href="/SwitchPage?page=setpage">${userid}</a> </font></p>
			    </div>

			    <div id="navbar" class="navbar-collapse collapse">
				    <ul class="nav navbar-nav navbar-right">
						<li><a href="homepage.jsp" class="active"><font size="3">首页</font></a></li>
						<li><a href="system/dataTotal.jsp"><font size="3">数据分析</font></a></li>
						<li><a href="system/viewPersonInfo.jsp"><font size="3">我的信息</font></a></li>
						<li><a href="system/social.jsp"><font size="3">留言社区</font></a></li>
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
					<h2>通知详情</h2>
					</br></br>
					<h4>
					主要页面：</br>
					1.首页：用于展示组织公告，通知（轮播），提供其他页面入口和菜单</br>
					2.登录界面（不解释）</br>
					3.注册界面（注册需要符合准入列表，因为是内部管理系统，类似于需要有档案才能注册武大学生账号这种）</br>
					4.会员信息浏览和修改界面</br>
					5.数据界面（含子界面）</br>
						用于展示爬到的静态数据（预先爬取到数据库的数据，如微信文章的标题，浏览量等）</br>
						用于展示对于已有数据的分析（例如高频词，发布时间统计，因为暂时不好爬评论和浏览量）</br>
						用于展示数据图表（基于数据用图标生成）</br>
					6.留言评论界面</br>
						用于会员发布留言（类似于帖子），下面可以评论和交流（需要记录浏览历史）</br>
						可能会有子界面</br>
					7.浏览历史统计界面（待定）</br>
					</br>
					</br>
					需要的数据实体（暂定，可优化）</br>
					会员信息：（准入列表以及已注册列表：作为管理系统，需要在后台定义准入列表，符合准入列表才能成功注册）</br>
					微信文章数据：</br>
					留言信息：</br>
					留言浏览历史及其评论</br>
					公告（通过网站后台修改）信息：</br>
					公告浏览历史：</br>
					</h4>
					</br></br></br></br>

					<div class="grid_3 grid_4 ">
						<h3 class="hdg">留言</h3>
						<div class="bs-example">	
							<table class="table">
								<tbody>
								<tr><h5>留言内容1</h5></tr>
								<tr>
									<td><h6>留言人1</h6></td>
									<td><h6>留言时间</h6></td>
								</tr>
									
								</tbody>
							</table>
							</br></br>
						</div>
						
						<div class="bs-example">	
							<table class="table">
								<tbody>
								<tr><h5>留言内容2</h5></tr>
								<tr>
									<td><h6>留言人2</h6></td>
									<td><h6>留言时间</h6></td>
								</tr>
									
								</tbody>
							</table>
							</br></br>
						</div>
					</div>
					
					<div class="tab-content">
					<!--进行留言-->
					<p>
						<font size="6">
							我要留言
						</font>
					</p>
						<form role="form">
							<div>
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
							<img src="../../img/公众号二维码.jpg" class="img-responsive" alt="Cinque Terre" width="200" height="150">
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