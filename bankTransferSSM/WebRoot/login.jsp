<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/login.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>

  </head>
  <body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-6">
                <form method="post" action="<%=basePath%>admin/login">
                    <h4 class="no-margins">欢迎登录网上银行转账交易系统：</h4>
                    <input type="text" name="uname" class="form-control uname" placeholder="用户名" />
                    <input type="password" name="pwd" class="form-control pword m-b" placeholder="密码" />
                    <select name="role" class="form-control" style="color: black;">
                    	<option value="0">管理员</option>
                    	<option value="1">用户</option>
                    </select>
                    <button class="btn btn-success btn-block">登录</button>
                    <a href="<%=basePath%>admin/beforeRegist" class="btn btn-success btn-block">注册</a>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                
            </div>
        </div>
    </div>
</body>
</html>

