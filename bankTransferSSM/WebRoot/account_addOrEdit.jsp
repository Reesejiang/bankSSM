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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="<%=basePath%>img/favicon.ico">
	<link href="<%=basePath%>css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="<%=basePath%>css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="<%=basePath%>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.min862f.css?v=4.1.0" rel="stylesheet">

  </head>
  
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>
                        	<c:if test="${account.accountId==null }">开户</c:if>
                        	<c:if test="${account.accountId!=null }">编辑账户</c:if>
                        </h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="commentForm" action="<%=basePath%>account/addOrUpdateAccount" method="post">
                            <input type="hidden" name="accountId" value="${account.accountId }">
                            <input type="hidden" name="balance" value="0">
                            <input type="hidden" name="integralNum" value="0">
                            <input type="hidden" name="status" value="0">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">卡号：</label>
                                <div class="col-sm-8">
                                    <input id="accountCode" name="accountCode" type="text" class="form-control" required="" aria-required="true" value="${accountCode }" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">账户密码：</label>
                                <div class="col-sm-8">
                                    <input id="accountPwd" type="text" class="form-control" name="accountPwd" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">账户类型：</label>
                                <div class="col-sm-8">
                                	<select id="accountType" class="form-control" name="accountType">
                                		<option value="1">单币种</option>
                                		<option value="2">多币种</option>
                                	</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">所属银行：</label>
                                <div class="col-sm-8">
                                    <select id="bankName" class="form-control" name="bankName">
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
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">开卡行：</label>
                                <div class="col-sm-8">
                                    <input id="createBank" type="text" class="form-control" name="createBank" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">客户名：</label>
                                <div class="col-sm-8">
                                    <input id="accountName" type="text" class="form-control" name="accountName" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">客户住址：</label>
                                <div class="col-sm-8">
                                    <input id="address" type="text" class="form-control" name="address" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">联系电话：</label>
                                <div class="col-sm-8">
                                    <input id="phone" type="text" class="form-control" name="phone" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">出生年月：</label>
                                <div class="col-sm-8">
                                    <input id="birthday" type="text" class="form-control" name="birthday" required="" aria-required="true" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-3">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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
			$("#commentForm").validate();
		});
    </script>
</body>
</html>
