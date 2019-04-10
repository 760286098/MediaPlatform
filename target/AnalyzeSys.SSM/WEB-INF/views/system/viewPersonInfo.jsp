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
						<li><a href="../homepage.jsp" class="active"><font size="3">首页</font></a></li>
                  <li><a href="dataTotal.jsp"><font size="3">数据分析</font></a></li>
                  <li><a href="viewPersonInfo.jsp"><font size="3">我的信息</font></a></li>
                  <li><a href="social.jsp"><font size="3">留言社区</font></a></li>
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
                    <li class="active"><a href="viewPersonInfo.jsp" >我的信息</a></li>
                    <li><a href="../changePersonInfo.jsp" >修改信息</a></li>

				    <!--功能可以继续扩展-->
			    </ul>
		    </div>
			<!-- //左边导航栏 -->


			<!-- 控制输出内容在右半部分 -->

		    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			    <div class="w3ls-details">   
					<!--个人信息-->	
					<div class="w3ls-text">
						<h4>个人信息</h4>
						<p><b>学号 :</b> <%=c.getBrand()%> </p>
						<p><b>部门 :</b> <%=c.getModel()%> </p>
						<p><b>职务 :</b> <%=c.getType()%> </p>
						<p><b>入学年份 :</b> <%=soc.getStock()%> </p>

						<br/>
						<h4>图片（可选）</h4> 
					</div>
					<!--个人信息-->
					<br/>
					<br/>
					<div display:block>
					<%if(soc.getPic_url()!=null){%>
					<%String []imgs=soc.getPic_url().split("--");
					for(int i = 0;i<imgs.length;i++){%>
					<img class="thumbnail" 
					align = "left"
					width="280" height="192"
					src=<%=imgs[i]%> data-src="holder.js/500x500/auto"
					>
					<%}%>
					<%}%>
					
					</div>
					<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

						<div>
						<a href="/carback?userid=<%=soc.getShopuser_id()%>&carid=<%=soc.getCar_id()%>">
							<button id="addBtn" name="access" type="submit" value="返回" class="btn btn-danger">
								<span class="glyphicon glyphicon-step-backward" aria-hidden="true"></span>返回
							</button>
						</a>
						</div>

				</div>
					
			    
		    </div>
			<!-- //控制输出内容在右半部分 -->

	    </div>
		<!--内容--> 
			
	    </div>
    </body>
</html>