<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上银行转账交易系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="<%=basePath%>img/favicon.ico">
    <link href="<%=basePath%>css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.min862f.css?v=4.1.0" rel="stylesheet">

  </head>
  
  <body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <!-- <span><img alt="image" class="img-circle" src="img/profile_small.jpg" /></span> -->
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${uname }</strong></span>
                                <span class="text-muted text-xs block">
                                	<c:if test="${roler=='0' }">管理员</c:if>
                                	<c:if test="${roler=='1' }">用户</c:if>
                                <b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="<%=basePath%>admin/logout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">T
                        </div>
                    </li>
                    <c:if test="${roler=='0' }">
	                    <li>
	                        <a href="#">
	                            <i class="fa fa-home"></i>
	                            <span class="nav-label">账户信息管理</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>account/findAccountAll">账户查询</a>
	                            </li>
	                        </ul>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="fa fa fa-bar-chart-o"></i>
	                            <span class="nav-label">存取款</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>pageJump?jumpPath=transfer1">存款</a>
	                            </li>
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>pageJump?jumpPath=transfer2">取款</a>
	                            </li>
	                        </ul>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="fa fa fa-bar-chart-o"></i>
	                            <span class="nav-label">转账汇款</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>pageJump?jumpPath=transfer3">行内汇款</a>
	                            </li>
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>pageJump?jumpPath=transfer4">跨行汇款</a>
	                            </li>
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>pageJump?jumpPath=transfer5">多币种汇款</a>
	                            </li>
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>transfer/findTransferAll">转账日志</a>
	                            </li>
	                        </ul>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="fa fa-home"></i>
	                            <span class="nav-label">积分兑换</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>integral/findIntegralAll">兑换历史</a>
	                            </li>
	                        </ul>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="fa fa-home"></i>
	                            <span class="nav-label">系统管理</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>product/findProductAll?m=1">商品管理</a>
	                            </li>
	                        </ul>
	                    </li>
                    </c:if>
                    <c:if test="${roler=='1' }">
                    	<li>
	                        <a class="J_menuItem" href="<%=basePath%>account/findAccountInfo"><i class="fa fa-magic"></i> <span class="nav-label">个人账户管理</span></a>
	                    </li>
                    	<li>
	                        <a href="#">
	                            <i class="fa fa fa-bar-chart-o"></i>
	                            <span class="nav-label">存取款</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>pageJump?jumpPath=transfer1">存款</a>
	                            </li>
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>pageJump?jumpPath=transfer2">取款</a>
	                            </li>
	                        </ul>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="fa fa fa-bar-chart-o"></i>
	                            <span class="nav-label">转账汇款</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>pageJump?jumpPath=transfer3">行内汇款</a>
	                            </li>
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>pageJump?jumpPath=transfer4">跨行汇款</a>
	                            </li>
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>pageJump?jumpPath=transfer5">多币种汇款</a>
	                            </li>
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>transfer/findTransferAll">转账日志</a>
	                            </li>
	                        </ul>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="fa fa-home"></i>
	                            <span class="nav-label">积分兑换</span>
	                            <span class="fa arrow"></span>
	                        </a>
	                        <ul class="nav nav-second-level">
	                            <li>
	                                <a class="J_menuItem" href="<%=basePath%>product/findProductAll?m=2">商品兑换</a>
	                                <a class="J_menuItem" href="<%=basePath%>integral/findIntegralAll">兑换历史</a>
	                            </li>
	                        </ul>
	                    </li>
                    </c:if>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="<%=basePath%>html/main.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <a href="<%=basePath%>admin/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="<%=basePath%>html/main.html" frameborder="0" data-id="<%=basePath%>html/main.html" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2018
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
    <script src="<%=basePath%>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>js/bootstrap.min.js?v=3.3.6"></script>
    <script src="<%=basePath%>js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=basePath%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="<%=basePath%>js/plugins/layer/layer.min.js"></script>
    <script src="<%=basePath%>js/hplus.min.js?v=4.1.0"></script>
    <script type="text/javascript" src="<%=basePath%>js/contabs.min.js"></script>
    <script src="<%=basePath%>js/plugins/pace/pace.min.js"></script>
</body>

</html>
