<!--jsp的第一句page contentType规定了整个页面的编码方式-->
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
    <title>媒体管理平台</title>
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
			#myimg{
				width: 100px;
				height:100px;
				border:1px solid #eee;
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
				    <p id= "huanying" class="navbar-brand" align="right"><font size="4">用户：<a href="/SwitchPage?page=setpage">${userid}</a> </font></p>
			    </div>

			    <div id="navbar" class="navbar-collapse collapse">
				    <ul class="nav navbar-nav navbar-right">
						<li><a href="../home/homepage.jsp" class="active"><font size="3">首页</font></a></li>
                  <li><a href="../system/dataTotal.jsp"><font size="3">数据分析</font></a></li>
                  <li><a href="viewPersonInfo.jsp"><font size="3">我的信息</font></a></li>
                  <li><a href="../social/social.jsp"><font size="3">留言社区</font></a></li>
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
                    <li><a href="viewPersonInfo.jsp" >我的信息</a></li>
                    <li class="active"><a href="changePersonInfo.jsp" >修改信息</a></li>

				    <!--功能可以继续扩展-->
			    </ul>
		    </div>
			<!-- //左边导航栏 -->


			<!-- 控制输出内容在右半部分 -->



		    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			    <div class="w3ls-details"> 
					<!--用户信息表格-->
<!--controller capture 1-->
					<form action="/register" class="">

					<div class="col-md-6 col-md-offset-3">
					<div class="form-group has-feedback">
						<label for="shop_address">所属部门*</label>
						<div class="input-group">
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-user"></span>
								</span>
							<input id="shopName" class="form-control" name="shopname" placeholder="请重新输入所属部门" maxlength="45" type="text" required="">
						</div>
						<span id="name-message" style="color: red; font-size: small;"></span>
					</div>



					<div class="form-group has-feedback">
						<label for="shop_address">学号*</label>
						<div class="input-group">
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-user"></span>
								</span>
							<input id="shop_address" class="form-control" name="address" placeholder="请重新输入学号" maxlength="45" type="text" required="">
						</div>
					</div>

					<div class="form-group has-feedback">
						<label for="shop_phone">联系方式*</label>
						<div class="input-group">
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-phone"></span>
								</span>
							<input id="shop_phone" class="form-control" name="phone" placeholder="请重新输入联系方式" maxlength="11" type="text" required="" oninput ="checkPhone();"
								   onkeypress="keyPress();"
								   onkeyup="if(event.keyCode !=37 && event.keyCode != 39)value=value.replace(/\D/g,'')">
						</div>
						<span id="phone-message" style="color: red; font-size: small;"></span>
					</div>

					<div class="form-group has-feedback">
						<label for="shop_manager">入学年份*</label>
						<div class="input-group">
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-user"></span>
								</span>
							<input id="shop_manager" class="form-control" name="manager" placeholder="请重新输入入学年份" maxlength="45" type="text" required="" oninput="checkManager();">
						</div>
						<span id="manager-message" style="color: red; font-size: small;"></span>
					</div>

					<div class="form-group has-feedback">
						<label for="description">职位描述*</label>
						<div class="input-group">
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-user"></span>
								</span>
							<input id="description" class="form-control" name="description" placeholder="请重新描述职位" maxlength="45" type="text" required="">
						</div>
					</div>



					<div class="form-group">
						<input class="form-control btn btn-primary" id="submit" onclick="checkSubmit();" value="修&nbsp;&nbsp;改&nbsp;&nbsp;信&nbsp;&nbsp;息" type="submit">
					</div>

					<div class="form-group">
						<input value="重填" id="reset" class="form-control btn btn-danger" type="reset">
					</div>

					</div>
					</form>
				</div>



				</div>
					
			    
		    </div>
			<!-- //控制输出内容在右半部分 -->

	    </div>
		<!--内容--> 
			
	    </div>
    </body>
</html>