basicFrame介绍：
===============

项目的架构采用SSM整合的结构：
---------------------------

视图层放到了webapp下的web-inf的views，用jsp写页面，页面跳转关系属于业务层范畴 <br><br>
业务层在项目包下的controller用于处理逻辑事务，调用service服务层 <br><br>
模型层在model，目前放了一个表（UserInfo）的model，以后会考虑实体类的存放位置 <br><br>
数据库层在dao下 <br><br>

值得注意的是 <br>
1.若拉取分支到本机，请更改jdbc.properties里的数据库驱动配置 <br>
2.如需操作（增删查改）库下对应表，请写对应的dao类，并放在dao包内，以便于mybatis操作；并在mapper下写映射配置文件 <br>
3.如需添加新表，请在model下写对应的bean对象 <br>
4.如需实现新的业务，请确保对应的service和controller写好 <br><br>



*****

v1.0
------

重写了userinfo相关的类 <br>
1.model下的userinfo: 为适应注册信息添加了诸列，完成userinfo表的最终版本 <br>
2.dao下的userinfoDao: 加入了一个新的方法：getLastestID,用于返回最新的id（注册要用）；同时引入ibatis的param注解：若SQL语句需要操作userinfo对象，则需要在dao内引入param注解（请看源码） <br>
3.userinfo_sql.xml：重写了insert语句以适应新表，这里用到了上条提示的注解 <br>
4.相关的service添加新方法 <br><br>

实现了login-register-homepage间相互跳转 <br>
1.相关controller、jsp、js <br>

实现了远程数据库的操作 <br>
1.注意：accesslistservice的impl文件有问题，目前没排查出来（根本就没花时间排查，hyk这比直接粗暴注释了），具体问题是：若不注释的话，页面的css/js等资源文件无法访问，我也搞不懂为啥一个没有调用到的service会影响这个 <br><br>

********

v1.1
-----

todolist: <br>
1.logincontroller向session中写入user，homepage以及其他controller从中读取user获取具体用户信息 (OJBK)<br>
2.其余各个controller的实现逻辑 (working)<br>
3.接1，由于现在用户的password是以明文的形式存放在MySQL的（谁用谁煞笔），以后肯定是要引入shiro框架对MySQL的password加密，并不直接通过session获取user，需要经过shiro的拦截与识别 (not now, not today, not tomorrow :) )<br><br>


********

v2.0
-----

1.完成了整个项目的大部分功能 <br>
2.关键数据的获取 （todo）<br>
3.对爬到的数据进行分析 （todo）<br>
4.社区的通知部分bug以及留言评论功能需要完成 （todo）<br>
