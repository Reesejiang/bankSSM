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
                <form id="commentForm" method="post" action="<%=basePath%>admin/regist">
                    <h4 class="no-margins">欢迎注册网上银行转账交易系统：</h4>
                    <input id="accountName" name="accountName" class="form-control" type="text"style="color: black;" placeholder="请输入客户名" required="" aria-required="true">
                    <input id="accountPwd" name="accountPwd" class="form-control" type="text" style="color: black;" placeholder="请输入交易密码" required="" aria-required="true">
                    <input id="compwd" name="compwd" class="form-control" type="text" style="color: black;" placeholder="请输入再次输入密码" required="" aria-required="true">
                    <input id="accountCode" name="accountCode" class="form-control" style="color: black;" type="text" value="${accountCode }" required="" aria-required="true" readonly="readonly">
                    <select id="accountType" name="accountType" class="form-control" style="color: black;">
                    	<option value="1">单币种</option>
                        <option value="2">多币种</option>
                    </select>
                    <input id="address" name="address" class="form-control" type="text" style="color: black;" placeholder="请输入客户住址" required="" aria-required="true">
                    <input id="birthday" type="text" class="form-control" name="birthday" style="color: black;" required="" aria-required="true" readonly="readonly" placeholder="请输入出生年月">
                    <input id="phone" name="phone" class="form-control" type="text"  style="color: black;" placeholder="请输入联系电话">
                    <select id="bankName" name="bankName" class="form-control" style="color: black;">
                    	<option value="中国银行">中国银行</option>
                        <option value="中国建设银行">中国建设银行</option>
                        <option value="中国农业银行">中国农业银行</option>
                        <option value="中国工商银行">中国工商银行</option>
                        <option value="招商银行">招商银行</option>
                        <option value="交通银行">交通银行</option>
                        <option value="中国民生银行">中国民生银行</option>
                        <option value="中国光大银行">中国光大银行</option>
                        <option value="中信银行">中信银行</option>
                    </select>
                    <input id="createBank" name="createBank" class="form-control" type="text" style="color: black;" placeholder="请输入开户行" required="" aria-required="true">
                    
                    <button class="btn btn-success btn-block" type="submit">注册</button>
                 </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                
            </div>
        </div>
    </div>
    <script src="<%=basePath%>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>js/bootstrap.min.js?v=3.3.6"></script>
    <script src="<%=basePath%>js/content.min.js?v=1.0.0"></script>
    <script src="<%=basePath%>js/plugins/validate/jquery.validate.min.js"></script>
    <script src="<%=basePath%>js/plugins/validate/messages_zh.min.js"></script>
    <script src="<%=basePath%>js/plugins/layer/laydate/laydate.js"></script>
    <script type="text/javascript">
    	laydate({
			elem : "#birthday",
			event : "focus"
		});
	    $.validator.setDefaults({
			highlight : function(e) {
				$(e).closest(".form-group").removeClass("has-success").addClass(
						"has-error")
				},
			success : function(e) {
				e.closest(".form-group").removeClass("has-error").addClass(
						"has-success")
			},
			errorElement : "span",
			errorPlacement : function(e, r) {
				e.appendTo(r.is(":radio") || r.is(":checkbox") ? r.parent().parent()
						.parent() : r.parent())
			},
			errorClass : "help-block m-b-none",
			validClass : "help-block m-b-none"
		}), $().ready(function() {
			$("#commentForm").validate({
					errorPlacement : function(error, element) {
						element.before(error);
					},
					rules : {
						accountPwd : {
							 maxlength: 8,
							 minlength: 6
						},
						compwd : {
							equalTo:"#accountPwd"
						}
					}
				});
		});
    </script>
</body>
</html>

