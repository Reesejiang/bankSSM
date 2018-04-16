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
                        	<c:if test="${product.productId==null }">添加产品</c:if>
                        	<c:if test="${product.productId!=null }">编辑产品</c:if>
                        </h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="commentForm" action="<%=basePath%>product/addOrUpdateProduct" method="post">
                            <input type="hidden" name="productId" value="${product.productId }">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">产品名：</label>
                                <div class="col-sm-8">
                                    <input id="productName" name="productName" type="text" class="form-control" required="" aria-required="true" value="${product.productName }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">兑换所需积分：</label>
                                <div class="col-sm-8">
                                    <input id="integralNum" type="text" class="form-control" name="integralNum" required="" aria-required="true" value="${product.integralNum }">
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
    <script type="text/javascript">
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
