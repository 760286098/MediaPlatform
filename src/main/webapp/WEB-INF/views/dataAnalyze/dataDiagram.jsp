<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>数据分析</title>
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
    <script language="javascript" type="text/javascript" src="../../../js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">baselocation="${ctx}"</script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
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
            <li><a id="a_InsideGotoDataTotal">数据概览</a></li>
            <li class="active"><a id="a_InsideGotoDataDiagram">图表分析</a></li>
            <!--功能可以继续扩展-->
        </ul>
    </div>
    <!-- //左边导航栏 -->


    <!-- 控制输出内容在右半部分 -->
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="w3ls-details">
           <div class="tab-content">
					<!--数据统计分析-->
					<p>
						<font size="6">
							基于用户浏览记录的数据分析
						</font>
					</p>
					</br>
					<!--//数据分析图-->
               <div style="width: 600px; height: 400px">
                   <canvas id="likes"></canvas>
               </div>
               <div style="width: 600px; height: 400px">
                   <canvas id="browseTime"></canvas>
               </div>
               <div style="width: 600px; height: 400px">
                   <canvas id="broeseTimeforEachArticle"></canvas>
               </div>
               <div style="width: 600px; height: 400px">
                   <canvas id="browseTimeChange"></canvas>
               </div>
               <div style="width: 600px; height: 400px">
                   <canvas id="publishTime"></canvas>
               </div>
				<!--//数据统计分析-->
           </div>
        </div>

    </div>
    <!-- //控制输出内容在右半部分 -->

</div>
<!--内容-->

</div>
</body>

<script type="text/javascript" src="../../../js/systemScripts/nav_bar.js"></script>
</html>
<script type="text/javascript">
    var list1 = new Array;
    var list2 = new Array;
    var str = document.getElementById("length").name;
    var lengthid=parseInt(str,10);
    for(var m=0;m < lengthid ;m++){
        if(list1.indexOf(document.getElementById(m+101).name)==-1){
            list1[list1.length] = document.getElementById(m+101).name;
        }

    }
    for(var n=0;n <list1.length ; n++){
        var num = document.getElementsByName(list1[n]).length;
        list2[list2.length] = new Array;
        for(var k=0;k<num;k++)
        {
            list2[n][k] = document.getElementsByName(list1[n])[k].value;
        }

    }


    var ddlProvince = document.getElementById("carlist1");
    var ddlCity = document.getElementById("carlist2");
    for(var i =0;i<list1.length; i++)
    {
        var option = document.createElement("option");
        option.appendChild(document.createTextNode(list1[i]));
        option.value = list1[i];
        ddlProvince.appendChild(option);
        //city initialize
        var firstprovince = list2[0];
        for (var j = 0; j < firstprovince.length; j++) {
            var optioncity = document.createElement("option");
            optioncity.appendChild(document.createTextNode(firstprovince[j]));
            optioncity.value = firstprovince[j];
            ddlCity.appendChild(optioncity);
        }
    }
    function indexof(obj,value)
    {
        var k=0;
        for(;k<obj.length;k++)
        {
            if(obj[k] == value)
                return k;
        }
        return k;
    }
    function selectprovince(obj) {
        ddlCity.options.length = 0;//clear
        var index = indexof(list1,obj.value);
        var list2element = list2[index];
        for(var i =0;i<list2element.length; i++)
        {
            var option = document.createElement("option");
            option.appendChild(document.createTextNode(list2element[i]));
            option.value = list2element[i];
            ddlCity.appendChild(option);
        }
    }

</script>
<script>
    var ctx = document.getElementById('likes').getContext('2d');
    var chart1 = new Chart(ctx, {
        type: 'bar',
        data: {
            labels:[
            <c:forEach items="${likes.keySet()}" var="name">
                ${name},
            </c:forEach>
                ],
            datasets: [{
                label: '各公众号点赞数',
                data: [
                    <c:forEach items="${likes.values()}" var="value">
                    ${value},
                    </c:forEach>
                ],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    var chart2=new Chart(document.getElementById('browseTime').getContext('2d'),{
        type: 'bar',
        data: {
            labels: [
                <c:forEach items="${browseNumber.keySet()}" var="name">
                ${name},
                </c:forEach>
            ],
            datasets: [{
                label: '各公众号浏览量',
                data: [
                    <c:forEach items="${browseNumber.values()}" var="value">
                    ${value},
                    </c:forEach>
                ],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    var chart3=new Chart(document.getElementById('broeseTimeforEachArticle').getContext('2d'),{
        type: 'bar',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '文章浏览量',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    var chart4=new Chart(document.getElementById('browseTimeChange').getContext('2d'),{
        type: 'line',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '公众号浏览量变化',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    var chart5=new Chart(document.getElementById('publishTime').getContext('2d'),{
        type: 'pie',
        data: {
            labels: ['0-4','4-8','8-12','12-16','16-20','20-24'],
            datasets: [{
                label: '文章时间分布',
                data: [
                    <c:forEach items="${publishTime}" var="value">
                    ${value},
                    </c:forEach>
                ],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    chart5=chart1;
</script>